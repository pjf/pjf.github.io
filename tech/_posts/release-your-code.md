---
title: Release your damn code
tags: coding
---

I have been coding for thirty goddamn years, and involved in open source projects for twenty. During that time, I keep some one infuriating mistake that people make again and again.

They don't release their damn code.

There used to be a time when releasing code was a big deal. Back when we distributed code on floppies or CDs, when you released code it was fixed in that media. Testing code was hard, because people weren't really sure how to write software, let along *test* it. Updating software was *really* hard, you had to get a *human* to do it, and humans especially suck at anything related to software.

But we're no longer distributing code on physical media. We have freakin' awesome test frameworks. We have build systems that do all the heavy lifting for you. The reasons not to release code are becoming very, very slim.

So I'm going to look at some of the regular excuses I see, and try to knock them over as best I can. There *are* some times when there are legitimate reasons not to release your code, but they're minor compared to the excuses people have for not releasing code.

# Our master branch isn't ready for release

So, I trust you're using some sort of source control. If not, then go learn that, it will turn you into a freakin' wizard. Advanced changeomancy has been one of the most useful skills I've *ever* learnt, even for non-coding tasks. But even when people are using source control, I keep seeing a terrible scourge that affects their repositories... the master (or release, or whatever) branch not being ready for actual release.

Back in the days of floppy disks, source control sucked at branching. It doesn't any more. In modern source control, branches are easy and lightweight. This means that if you've got more than zero humans on your project, you should *always* do your work on branches. When it's finished, you can merge it into master (or wherever you release from), and master can *always* be in a releasable condition.

Now, I get that it's not always that easy. Sometimes features depend upon other features. Sometimes there are architectural changes you're making. But in almostall cases, all that work should be happening on branches until it's in a releasable condition.

Having a release-ready master is freakin' liberating. If there's a bugfix, you can release it right away. If you improve something, you can release it right away.

Moral: Learn your source control system. Do all your work on branches. Make sure you're ready to release at any time.

# I haven't tested it properly

Yeah, I get it, you just want to write the code; but one of the *biggest* time-savers you'll ever get is a comprehensive test-suite. Full on test-driven development is wonderful, but if you have a policy that all new code requires test cases, you'll rapidly find that you get better at writing them.

You may be crying "but only a human can test my code", and that *might* be true, or it might be that you've not found the right framework yet. Tools like Selenium are amazing for testing web frameworks. Having your web application based on a strong REST layer means you can do lots of automated testing on that. If you've got a user-interface, you may find tools like AutoHotKey can be used to do a *lot* of things you'd normally leave to humans.

If testing your code is really hard, then frequent releases are even *more* important. Because even if you don't test your code, your *users* will. Releases with a small number of changes mean that when bug reports come back, you'll have a much better idea of the source of those bugs. If you have infrequent, monolithic releases, then finding bugs can be *much* harder, and worse still you may find your changes have tangled up with each other, making debugging *much* harder.

Moral: Learn appropriate test frameworks for your environment. If your code is hard to test, release it *more* often, not less.#

# I hate writing release notes

Oh yeah, don't we all? The solution here is... don't write them! If you have a Changelog file, insist that each branch updates it. If you're using continuous integration (you should), then get your CI framework to red-flag the brach if it doesn't update the Changelog. It's *much* better to note your changes with each merge, rather than trying to figure them all out at release time.

If you've got an experienced enough team, you can make sure that each commit summary contains what should go in the release notes, or a special tag (I use `#dev`) to indicate that it should be omitted. Then you can just do a `git shortlog top

