---
title: CKAN needs an infrastructure sponsor!
tags: KSP, CKAN
---

About six months ago I had this crazy idea that one of my favourite games, Kerbal Space Program, needed a mod manager that did everything *right*, and an *amazing* team of volunteers, including myself, set about to make that happen. The result has been the Comprehensive Kerbal Archive Network (CKAN). Tens of thousands of people have downloaded the CKAN client, and we index hundreds of mods to make sure our users can install and upgrade mods with the click of a button.

CKAN has been an *overwhelming* success. All our code is free, all our metadata is free, and all the work has been done by unpaid volunteers who wanted to contribute to something awesome.

However, the CKAN requires infrastructure to run... and that's not free.

<!--more-->

One of the services provided by the CKAN is the hosting of dedicated mirrors. These protect our users from outages, and ensure that mods which allow redistribution don't suddenly cease-to-be if the site hosting them disappears. In December, each mirror required about 5GB of space. Now, due to our continued success, it's about 20GB. However that's only mirroring the latest version of each mod; we'd *like* to mirror older versions as well, for players running on older versions of KSP, or players who need to backgrade because they've encountered a bug in a new mod release. We also have much more modest requirements for our build and continuous-integration server.

Right now, those infrastructure costs are being borne by the same volunteers who contribute to the CKAN, in particular Alexander Dzhoganov (aka nlight) who has been managing the infrastructure, as well as being project lead for much of 2015. Alexander is an *absolute hero* for doing this, but the growing popularity of the project is rapidly making this unsustainable.

And so this is where you *might* come in. If you happen to work for a company that can provision us an instance with some 400GB of storage on a fast pipe, the potential for a few hundred gigabytes of traffic each month, and the willingness to grow with our needs, then we'll think you're *amazing*, and you'll have saved the CKAN mirror.

For our first mirror and most important mirror we need an instance we can configure and run ourselves. We have bots that index all the mods, test everything installs, watches the git repo for changes, and provide amazing continuous integration tests. That instance is our main automation workhorse, it simply can't work unless we can control it.

Once the first mirror is re-homed, we can establish more traditional mirrors, and I'm thankful for everyone who's offered to help out with these thus far. Those offers really do help, and I'll be following up with everyone who's made them, but the first mirror that lets us run our own virtual machine is most vital to our immediate needs.

If your company *can* help, then please drop me an email at paul.j.fenwick at gmail, or you can tweet to me {% t pjf %}. We would *love* to hear from you.

Thank you all so very much, and thank you in particular to all our amazing CKAN volunteers who have contributed to this success.

~ Paul

(CKAN Project Founder)
