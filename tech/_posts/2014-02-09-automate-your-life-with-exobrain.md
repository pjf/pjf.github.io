---
title: Automate Your Life With Exobrain
tags: exobrain perl tech qs quantified-self
wide_image: /images/tech/backup-starting.jpg
description: "Services such as If-This-Then-That (IFTTT) and Zapier make it easy to connect apps and automate tedious tasks. However they require you trust your data with a third party. Enter Exobrain."
---

Services such as [If-This-Then-That](https://ifttt.com/) (IFTTT) and
[Zapier](https://zapier.com/) make it easy
to connect apps and automate tedious tasks. However they all require
you trust your personal data with a third party. Enter [Exobrain][exobrain].

<!--more-->

Exobrain is a free and open source framework for extending
everything. It's like IFTTT and Zapier, but you don't have to reveal your
credentials to anyone.

At the time of writing, Exobrain directly supports the following
services:

* [Beeminder][beeminder]
* Email/[Gmail][Gmail] (via IMAP)
* [Facebook][Facebook]
* [Foursquare][4SQ]
* [HabitRPG][HabitRPG]
* [iDoneThis][iDoneThis]
* [Pushover][Pushover]
* [RememberTheMilk][RTM]
* [Twitter][Twitter]

For Beeminder users, Exobrain also supports call-backs. This
means you can chain events off anything that Beeminder can measure,
including
[Withings](http://www.withings.com/en/scales/) scales,
[Runkeeper](http://runkeeper.com/),
[fitbit](http://www.fitbit.com/),
[Trello](https://trello.com/),
[RescueTime](https://www.rescuetime.com/),
[github](https://github.com/),
[duolingo](https://www.duolingo.com/), and more.

If you're a quantified-selfer, you can automatically record your
activities to your log. If you need some extra motivation, you
can automatically gain experience points on [HabitRPG](https://habitrpg.com/)
for achieving
your goals. You can back-up all of your activity from third-party
websites in real-time, or even allow people to add to your TODO
list by tweeting at you with a `#todo` tag!

If you own a [Pepple watch](https://getpebble.com/)
and are a Pushover user, then you can send notifications
directly to your watch.

You can use pre-written Exobrain actions or you can write your own.
Exobrain is completely free, open source, and
extensible. Because it uses a shared message bus, you can even
update components on the fly, without having to restart
the whole system.

Exobrain is written in Perl and at its core uses an extensible,
language-independent, messaging format based on [0MQ](http://zeromq.org/)
and [JSON](http://www.json.org/).

Writing extensions for
Exobrain is easy; here's the entire code to send all tweets
that mention you to your preferred notify service:

{% highlight perl %}

    #!/usr/bin/env perl
    use Exobrain;

    $exobrain->watch_loop(
        class  => 'Measurement::Tweet',
        filter => sub { $_->to_me },
        then   => sub {
            $exobrain->notify( $_->summary );
        },
    );

{% endhighlight %}

Exobrain is very much a work-in-progress, and we would love your
contributions and feedback. You can find
[Exobrain on github](https://github.com/pjf/exobrain). Contributions
to our [issues list](https://github.com/pjf/exobrain/issues) are
especially appreciated!
