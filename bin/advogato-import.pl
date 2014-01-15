#!/usr/bin/perl -w
use 5.010;
use strict;
use warnings;
use autodie;
use XMLRPC::Lite;

# Import pjf's blog entries from advogato into jekyll.
# This may be a useful starting point if you want to do an
# advogato import of your own data.
#
# Paul '@pjf' Fenwick, January 2014
#
# You can use, modify, and redistribute this code under the same
# terms as perl itself.

my $user = 'pjf';

my $posts = advogato('diary.len',$user);

say "Importing $posts posts\n";

# Posts-1 because advogato counts from zero

foreach my $post (0..$posts-1) {
    my $entry = advogato('diary.get',$user,$post);
    my ($posted, $updated) = @{ advogato('diary.getDates',$user,$post) };

    write_entry($posted, $entry, $post);
}

sub write_entry {
    my ($posted, $entry, $number) = @_;

    my ($date,      $timestamp)    = jekylify_time($posted);
    my ($raw_title, $cooked_title) = extract_title($entry);

    my $filename = build_filename($date, $cooked_title);

    say "$number: $filename";

    open(my $fh, '>', $filename);

    # Print our top-matter

    $fh->print(
        "---\n".
        "title: $raw_title\n".
        "date: $timestamp\n".
        "orig_url: http://advogato.org/person/pjf/diary/$number.html\n".
        "---\n"
    );

    # Print our entry

    $fh->print($entry);

    close($fh);
    return;
}

# This needs a YMD date and a cooked title
sub build_filename {
    my ($date, $title) = @_;

    state %used_filenames;

    my $filename = "$date-$title";

    # Find a unique filename

    if ($used_filenames{$filename}++) {
        my $count = 2;      # 'bob' 'bob-2', 'bob-3'

        do {
            $filename = "$filename-$count";
            $count++;

        } while ($used_filenames{$filename}++);
    }

    return "$filename.html";
}

sub advogato {
    state $server = XMLRPC::Lite->new(
        proxy => 'http://www.advogato.org/XMLRPC'
    );

    return $server->call(@_)->result;
}

# The first thing in bold with a <br> or <p> is what we consider our header
sub extract_title {
    my ($text) = @_;

    $text =~ m{<b>(.*?)</b><(?:br|p)/?>}i;

    my $raw_title = $1 || "untitled";

    # Cook our title by replacing unsafe characters with dash,
    # and lower-casing

    my $cooked_title = lc($raw_title);

    $cooked_title =~ s{\W}{-}g;

    return ($raw_title, $cooked_title);

}

sub jekylify_time {
    my ($timestamp) = @_;

    $timestamp =~ m{
        ^
        (?<year>\d{4})
        (?<month>\d{2})
        (?<day>\d{2})
        T
        (?<hms>[\d:]+)
        $
    }x or die "Can't parse $timestamp";

    my $ymd = "$+{year}-$+{month}-$+{day}";

    return ($ymd, "$ymd $+{hms} +0000");
}
