---
title: "How I Claimed $270 of Beeminder Bounties"
description: "Last Tuesday I paid Beeminder $5 because I didn't floss my teeth when I promised that I would. That evening, I was the one collecting $270 from Beeminder…"
tags: tech, personal, beeminder, akrasia
wide_image: /images/tech/beeminder.png
---

Last Tuesday I paid [Beeminder][Beeminder] $5 because I didn't floss my teeth
when I promised that I would. That evening, *I* was the one collecting $270
from Beeminder…

<!--more-->

In case you're not familiar with me, I'm outstandingly lazy. I really
dislike *having* to do anything at all. I'm totally fine with
*choosing* to do things, but I push back pretty hard against the
universe when something *has* to be done. This is why I'm so big
on automation, it reduces the things to have to be done by me,
and allows me to practice *efficient laziness*.

But there are some things one simply can't automate;
flossing your teeth, running a business, doing one's taxes, getting
some exercise. While I might be able to write digital agents that
can *assist* me with those tasks, fundamentally they're things that
I have to do. The problem is, left to my own devices, I rarely will.

However, there is one time when I'll take action, and that's when
presented with the threat of imminent failure. If you've read
WBW's [excellent article on procrastination](http://waitbutwhy.com/2013/10/why-procrastinators-procrastinate.html)
then you'll understand that the panic monster is one of the few things
that will get chronic procrastinators to actually move. 

For tasks with big, looming deadlines such as [my talks](/talks),
there's a very clear, and visceral threat of failure. They're even
worse than most deadlines, because they're *public speaking*, which
is already flat out terrifying, and most of my talks are given in
Australia, where everything is trying to kill you.

Generally, if I need to get something done, I'll promise to present
a talk on it, safe in the knowledge that the fear of public
ridicule and the thought of my audience
[taking](http://en.wikipedia.org/wiki/Saltwater_Crocodile)
[me](http://en.wikipedia.org/wiki/Stone_fish)
[to](http://en.wikipedia.org/wiki/Great_White_Shark)
[the](http://en.wikipedia.org/wiki/Box_jellyfish)
[beach](http://en.wikipedia.org/wiki/Blue_ringed_octopus)
will be enough to terrify me into action.

Yet there's a problem. Small things which I should be doing regularly,
like flossing my teeth, or doing exercise, come with with no
dramatic failure cliffs. And let's face it, planning to live one's
life by only doing the most terrifying things at the last possible
moment isn't exactly the most optimal way to live. This is
where Beeminder comes in handy.

[Beeminder][Beeminder] provides the ability to establish
*commitment devices*. In the same way that I'll promise to give
a talk on software I would *like* to write, I can use Beeminder
to promise to do something that I would *like* to do, but which
I know future me will be unlikely to achieve.

Beeminder is exceptionally good at taking large or ongoing tasks,
and splitting them into smaller, more achievable goals. It then
draws the most friggin' nerdtastic graphs ever, with rolling
averages, goal lines, predictive curves, and all sorts of goodies,
so you can see just how well you're doing. The most important of
these is the 'yellow brick road'. If you're on that, then you're
on track.

So I might achieve my long-term task of good dental hygiene by having
a goal to floss three times each week. Or I might turn my goal of
writing a 5,000 word essay into the task of writing 250 words per day
for 20 days. Beeminder makes it very easy to see if I'm achieving
my goal, or if I'm at risk of falling behind. And if I over-perform
(maybe by writing 1000 words one day), then Beeminder will cut me
some slack.

However the real power of Beeminder is that you can pledge an amount
of money against your goal. Promising that I'm going to floss my
teeth thrice weekly may not be very motivating, but knowing that
I'll lose $5 if I don't make my flossing deadline is enough to
have me stumble into the bathroom before bed, rather than promising
to myself that I will do it later. And while I can change my
goals at any time, I have to do it at least a week in advance, so
I can't weasel out of something just because I don't want to
do it right now.

While I pay out on the occasional pledge, those amounts
have been absolutely worth it. Overall I'm paying about $0.20/week
for good dental health, and maybe $0.08/day to keep my inbox
under control. A Beeminder pledge has also kept me
attending my last 30 dance lessons, by giving me just enough of
a nudge to not come up with excuses as to why I'm too busy to
go, and I've not paid a penny to Beeminder for that goal, as
I've never got behind in my dance lessons when I've promised to
be there.

There's a lot of cool
[cognitive science behind Beeminder](http://blog.beeminder.com/akrasia/),
but one of the neat things is they're
*very* committed to using their own system
to ensure that important tasks like user-visible improvements,
blog-posts, and general support get done. And by very committed, I
mean that the Beeminder team
[will pay out pledges](http://blog.beeminder.com/blogdog/)
to users that call them out if they fall behind on one of their
goals.

And that's what happened last Tuesday. One of the founders
hadn't spent enough hours on Beeminder that week, and I ended up
$270 richer as a result, and that was one of the smaller
pledges they have on the line.

Of course, being me, I don't want to feel I *have* to check if any
bounties are payable, so I've
[written some code](https://github.com/pjf/exobrain/blob/master/bin/source/beeminder-bounties)
to check for me. I've got no qualms about being efficiently lazy when
it comes to motivating others. ;)

