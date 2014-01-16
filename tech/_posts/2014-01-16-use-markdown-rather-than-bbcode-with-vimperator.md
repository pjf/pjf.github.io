---
title: Use Markdown Instead Of BBCode With Vimperator
tags: vimperator phpBB BBCode markdown perl
---

I really love the Dwarf Fortress community, and a lot of it is centred
around the [bay12 forums](http://www.bay12forums.com/smf/index.php).
Unfortunately, I don't love BBCode (aka phpBB syntax), which is what the
bay12 forums require me to write posts in. I'd much rather use
[markdown](http://daringfireball.net/projects/markdown/syntax). So
I decided to fix that with the help of vimperator, and by writing my own
markdown to BBcode parser.

<!--more-->

If you install the [Markdown::phpBB](https://metacpan.org/pod/Markdown::phpBB)
module from the CPAN, you'll find a nifty little program named `md2phpbb`.
This is a filter; it takes input in markdown, and emits output in BBcode.

    $ cpanm Markdown::phpBB     # install using cpanm
    $ cpan  Markdown::phpBB     # install using classic cpan

If you're editing in vim, you can run `:%!md2phpbb` to replace your
current buffer (written in markdown) with the equivalent text in BBcode.
You can even bind it to a key, as I've done in my `~/.vimrc` file:

    :nmap <F5> :%!md2phpbb<CR>

If you've installed md2phpbb into a user (rather than system)
directory, then you may find that vimperator won't have your perl-specific
environment variables in place. In that case you can use full paths
in your `~/.vimrc`:

    :nmap <F5> :%!perl -I/home/pjf/perl5/lib/perl5 /home/pjf/perl5/bin/md2phpbb<CR>

If you're using [vimperator](http://www.vimperator.org/vimperator) then you
can already invoke vim from any textarea by pressing `ctrl-i`. However
BBcode websites usually bind this to *italics*, so you'll probably want to
add an additional key for editing to your `~/.vimperatorrc` file. I use
`ctrl-e`, for edit:

    :inoremap <C-e> <C-i>

Now you can use `ctrl-e` to open a vim window, write your response in
markdown, and then just hit `F5` to turn it into BBCode. Best of all,
the filter doesn't change existing BBCode at all, so you can hit `F5`
as many times as you like, to refresh your text after edits.

`md2phpbb` and supporting libraries are completely free and open source,
and can be found on [github](https://github.com/pjf/Markdown-phpBB).

---

See also: [The world's easiest guide to installing cpanm](http://privacygeek.blogspot.com.au/2013/03/the-worlds-easiest-guide-to-installing.html)
