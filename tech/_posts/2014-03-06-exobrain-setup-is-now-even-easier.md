---
title: Exobrain setup is now even easier!
description: "Exobrain is my collection of digital minions which help me run my life. They know my goals, my location, my to-do list, and help me best plan what I'm doing, both personally and professionally. Best of all, none of my data is revealed to third parties, because I control all my agents, and all the code is open source."
tags: tech exobrain perl confoo
---

Exobrain is my collection of digital minions which help me run my life. They know
my goals, my location, my to-do list, and help me best plan what I'm doing, both
personally and professionally. Best of all, none of my data is revealed to third
parties, because I control all my agents, and all the code is open source.

<!--more-->

I've previously written about how to [automate your life with exobrain](/tech/2014/02/09/automate-your-life-with-exobrain.html). Today,
I'm going to talk more about how to get started with an exobrain install. I want to
thank everyone who attended my talk at [Confoo.ca][Confoo] for their feedback
and suggestions, and especially everyone who attended the install-fest on Friday.

If you've previously tried to get Exobrain installed, you would have known it had
a *lot* of dependencies. I'm very glad to say that we're moving towards a system
where instead of getting *everything* with Exobrain, you now only get the parts
you need.

Rather than one huge distribution, we now have the Exobrain *core*, which contains
the framework and supporting infrastructure, and *components*, which allow you to
hook into individual services. Installing the core still requires you to walk
through the [Exobrain install guide](https://github.com/pjf/exobrain/#installation).

Individual components now only require a couple of commands to get up and running.
For example, you may install `Exobrain::Twitter` or `Exobrain::Beeminder` to
communicate with Twitter or [Beeminder][Beeminder] respectively.

Components come with their own configuration code, which means there's no more
digging through `.exobrainrc` files. Here's how you'd get started with Beeminder:

    $ cpanm Exobrain::Beeminder
    $ exobrain setup Beeminder

This will launch an interactive process that will walk you through obtaining an
API key, and will even test to make sure it's working. Once complete, the Beeminder
services show up as their own service group:

    $ ubic status

    exobrain.beeminder
        exobrain.beeminder.source       running (pid 30359)
        exobrain.beeminder.notify       running (pid 30378)
        exobrain.beeminder.sink         running (pid 30389)

Here we can see that the Beeminder component comes with three parts. For
any component, the "source" reads from that data source and emits measurement
packets onto the Exobrain bus. The "sink" reads intents from the bus,
and transmits them to the external service. In the case of the Beeminder
component, it also comes with a "notify" agent, which generates notifications
whenever a Beeminder data-point is updated (provided we have Beeminder
call-backs configured correctly).

Because each component is in their own status group, you can enable or disable
them easily with `ubic start exobrain.beeminder` or `ubic stop exobrain.beeminder`.

Under the hood, components provide a much cleaner way of writing agents,
with many components supplying roles which automatically handle connection
and configuration to services. They also open the door to writing your own
private components which can be updated inpdependently to the rest of Exobrain,
or which you can distribute to others!
