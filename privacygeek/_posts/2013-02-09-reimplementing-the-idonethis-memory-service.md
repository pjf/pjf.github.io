---
title: Reimplementing the iDoneThis Memory Service
date: 2013-02-09 20:31:00 -0800
orig_url: http://privacygeek.blogspot.com/2013/02/reimplementing-idonethis-memory-service.html
tags: idonethis hacking code api perl productivity
---

There's an excellent website called [iDoneThis.com](http://idonethis.com/)
which implements the most simple yet brilliant of services. Every day, you
record the list of things you've done, and it gives you a check-mark for that
day. This was motivating in two ways: firstly, the desire to keep that chain of
check-marks running (what's known as a 'chain calendar' or a 'Seinfeld
calendar'), and secondly by emailing you your memories of what you were doing a
year (or a week, or a month) ago.

For me, knowing what I was doing a year ago was *really* good. I loved waking
up each morning to be reminding of something I might otherwise not think of
again. The good memories I was emailed would make me feel good again, and bad
memories? Well, they'd often make me feel good that I wasn't going through
*that* anymore, or they'd be *insightful* if I was encountering similar issues
now.

I *loved* the memory service, and so did my friends, even if they didn't use
it. I'd often send them messages about what awesome adventures we were up to a
year ago, and that would often make their day.

Unfortunately, a few months ago, iDoneThis discontinued their memory-posting
service. I don't know why; I can only assume they're focusing on the more
corporate part of their service, and the network costs of all the personal
emails wasn't worth it.

Today, as part of a [productivity spiral](http://lesswrong.com/lw/3w3/how_to_beat_procrastination/), I reimplemented
the old memories service. The code isn't pretty—unfortunately iDoneThis doesn't
(yet) provide an API—but I have a bot that can log-in and fetch a day's worth
of data. Best of all, that code is open source, and
[available from the CPAN](href="https://metacpan.org/module/WebService::Idonethis), so you can
download and use it yourself.

<!--more-->

Even if you're not a Perl person, then it's pretty easy to install. Simply follow my [world's simplest guide to installing cpanm](http://privacygeek.blogspot.com.au/2013/03/the-worlds-easiest-guide-to-installing.html).

Now just install the [WebService::Idonethis](https://metacpan.org/module/WebService::Idonethis">WebService::Idonethis) module:

    cpanm WebService::Idonethis

To use it, you'll first need to create an `~/.idonethisrc` file with your auth
details:

    [auth]
    user=someuser
    pass=somepass

If all has gone well, you can now use the `idonethis-memories` command!

    $ idonethis-memories

    Here's what you were doing on 2012-02-11:

    * Built a robotic dinosaur with lasers with Claudine.
    * Played stepmania with Deanna (Spice Girls rock!)
    * Invoiced ALL the clients.
    * Drank six billion cups of coffee.

It's perfect for putting into a cron job.

*Edit:* As of v0.03, you can now submit done items directly from the command line using the `idone` tool:

    $ idone "Read a great blog by Paul Fenwick"

*Edit:* As of v0.04, you can also get a list of what you've done today:

    $ idone -l

    * Flossed my teeth
    * Looked at pictures of cats on the Internet
    * Defended against a goblin siege in Dwarf Fortress

If you're handy with Perl, or just want to look at the code, there's a [github
repository](https://github.com/pjf/idonethis-perl). Patches are extremely
welcome!

Edit: As of v0.08, the `idone -lc` command is the best thing ever. It will list the things you've done today, and allow you to add new things by entering them on stdin. It also has less than one third of the previous dependencies.
