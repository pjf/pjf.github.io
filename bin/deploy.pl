#!/usr/bin/perl -w
use 5.010;
use strict;
use warnings;
use autodie qw(:all);
use File::Path qw(remove_tree);
use FindBin qw($Bin);

chdir("$Bin/..");

system("jekyll build");
system("git checkout master");

# Make a hash of all our (non-dot) files
my %files;
@files{ glob("*") } = ();

# Remove _site from that list
delete $files{_site};

# But get rid of all the rest.
remove_tree(keys %files);

# Move everything in site up a level
system("mv _site/* .");

my $time = localtime();

# And send to githb.
system("git add -A");
system(qq{git commit -m"Site update at $time"});
system("git push");

# Finally, return home
system("git checkout build");
