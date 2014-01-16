---
orig_url: http://privacygeek.blogspot.com/2013/03/gamifiy-your-command-line-with-habitrpg.html
date: 2013-03-22 21:22:00 -0800
tags: HabitRPG perl gamification hrpg cmdline
---

![](/images/privacygeek/hrpg-screenshot.png)

So, you're using [HabitRPG](http://habitrpg.com) to gamify your life, right?
You should be; what could be better than collecting XP and gold for fixing bugs
and doing chores and flossing your teeth, and developing a totally kick-arse
character you'd want to show off to all your friends?

Oh yeah, doing all that *from the command-line*. ;)

So, I present to you <code>[hrpg](https://metacpan.org/module/hrpg)</code>, a command-line
tool to integrate with HabitRPG. It's still new, but it's very full
featured.

<!--more-->

## Setup

To begin with, you'll need a HabitRPG account. Just head over to
[HabitRPG](http://habitrpg.com/) and make an account using whatever method you like. If
you've already got a HabitRPG account, that's excellent!

You'll also need to install
[WebService::HabitRPG](https://metacpan.org/module/WebService::HabitRPG)
which the `hrpg` client is bundled with. The easiest way to do this is with
[cpanm](http://cpanmin.us). If you don't have `cpanm` installed, I have a
[super-easy guide for
you](http://privacygeek.blogspot.com.au/2013/03/the-worlds-easiest-guide-to-installing.html).

    cpanm WebService::HabitRPG

On HabitRPG, head over to Settings, and navigate to the API tab. There'll be a
user-id and an API-key here. Use your favourite editor to open a
`.habitrpgrc` file in your home directory with the following format:

    [auth]
    user_id   = xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    api_token = xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</pre>

Replace the long strings of 'x's with your user id and API token from the
HabitRPG website, and we're ready to go!

### Using hrpg

The easiest way to get started with hrpg is to run it with no arguments. This
will provide you with a help display:

    $ hrpg

    Usage:

    hrpg status                  : Show current HP/XP/GP
    hrpg tasks                   : Show current tasks
    hrpg habit|daily|reward|todo : Show tasks of current type
    hrpg new                     : Create new task 'hrpg new' for help.
    hrpg [+-] task               : Increment/decrement a task or habit

    Debugging commands:

    hrpg dump                    : Dump entire user info
    hrpg dump tasks              : Dump task info

Most of these commands are pretty straightforward. For example, if I type hrpg
status I'll get some basic info about my character:

    $ hrpg status

    Hark, Paul Fenwick! (Lv 3)

    HP: 45.7 / 50
    XP: 25 / 170
    GP: 30 | SP: 54 | CP: 18

However there are a few things which require a little more explanation, and
will make your HabitRPG experience much nicer! Firstly, let's find out
how to make a task:

    $ hrpg new

    Usage: hrpg new [habit|todo|daily] +- "name" ["note"]

There are three different tasks we can make. Daily tasks are things we want to
do every day, like brush our teeth, practice our anki cards, or fill in our
idonethis log. They give us XP and coins when we complete them, and will
damage our HP if we neglect them.

Todo items are things which need to be done, but only once. Something like
paying a bill, or booking a flight.

Habits are things which we want to get into—or out of—the habit of doing. For
example, we might want to get penalised whenever we eat junk food or smoke a
cigarette, or rewarded whenever we exercise or respond to a client email.
Habits can be triggered multiple times per day.

The `+` and `-` modifiers tell HabitRPG if something is good, bad, or
potentially both. For example, you might have a 'pomodoro' habit which rewards
you for working solidly for a period of time, or penalises you if you get
distracted when you're supposed to be working solidly.

Finally, all tasks need a name. This is what shows up in the web interface, but
most importantly for us any unique abbreviation of this name is how we'll refer
to our tasks in hrpg.

Notes are entirely optional, and will show up as tool-tips in the web interface
if you use it.

So, let's make a few tasks. We'll have one that rewards us for drinking water,
and penalises us for drinking unhealthy drinks. We'll have another one for
responding to email (something I personally suck at), and another daily goal to
floss our teeth.

    hrpg new habit +- "Drink healthily"
    hrpg new habit + "Respond to email"
    hrpg new daily + "Floss teeth"

Once we've set up tasks, we can tell HabitRPG that we've completed them. For example, if we drank a refreshing but unhealthy drink, and then flossed our teeth, we could use:

    $ hrpg - drink
    $ hrpg + floss

Note that any unique abbreviation of our task name is acceptable. If we try an abbreviation that isn't unique, hrpg will provide us with a list of options, along with their unique task IDs:

    $ hrpg + pomodoro

    Did you mean...

    * Pomodoro of paid work (12fb2922-74be-45d3-b9ed-11e2fa1721c9)
    * Pomodoro of anything useful (424e327c-9738-4743-ac74-b9f5c528b555)

As an added bonus, if you're already a user for the [idone command line
client](http://pjf.id.au/privacygeek/2013/02/10/reimplementing-the-idonethis-memory-service.html)
for <http://idonethis.com/>, then you can mark a habit as done, and record a note in
idonethis *at the same time*:

    hrpg + email "Sent quote on flux capacitors to Dr Brown"

In the future, if HabitRPG supports logging tasks with notes, these will also
be appended to your HabitRPG log.

## Under the hood

hrpg sits on top of the
[WebService::HabitRPG](https://metacpan.org/module/WebService::HabitRPG) module
for [Perl](http://perl.org). If you're interested in reporting bugs, suggesting
features, improving the docs, or even contributing code yourself, you can find
the [repository on github](https://github.com/pjf/WebService-HabitRPG).
