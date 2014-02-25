---
title: The iOS SSL/TLS bug is worse than you think
description: "Holy smokes. So having looked at the actual code for this, the bug in iOS / OSX is *way* worse than described on gizmodo. The article is misleading when it says your home network is safe, it's not."
tags: security, tech, iOS
orig_url: https://www.facebook.com/paul.fenwick/posts/10152020757609611
---

Holy smokes. So having looked at the [actual code](https://www.imperialviolet.org/2014/02/22/applebug.html) for this, the bug in iOS / OSX is *way* worse than described [on gizmodo](http://gizmodo.com/why-apples-huge-security-flaw-is-so-scary-1529041062). The article is misleading when it says your home network is safe, it's *not*. If I poison your DNS queries, compromise your home router (they're *very* exploitable), have privileged access to the network infrastructure between you and what you're connecting to, or all manner of other things, then I *own* your connection, and whatever data you send across it; credit card details, bank account logins, facebook passwords, all of it. If I hijack anything that's doing a software update, then I may potentially own your device.

In fact, if you're already logged into a website, I may even be able to steal your cookies and act as you without you even needing to enter a username and password at all. Seriously, this exploit really is about as bad as it gets.

Two-factor auth will mitigate some, but not *all* of the damage here. The only way to close this hole is to upgrade your vulnerable apple devices now. Please do this. Seriously.

* [Gizmodo article](http://gizmodo.com/why-apples-huge-security-flaw-is-so-scary-1529041062). 
* [Code with discussion](https://www.imperialviolet.org/2014/02/22/applebug.html)

CVE-2014-1266

