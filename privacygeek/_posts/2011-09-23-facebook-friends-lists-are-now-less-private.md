---
title: "Facebook Friends Lists Are Now Less Private"
date: 2011-09-23 22:59:00 -0800
orig_url: http://privacygeek.blogspot.com/2011/09/facebook-friends-lists-are-now-less.html
tags: facebook privacy
---

<!-- In the original post there was an image here. Meh. -->

Today started with breakfast. A breakfast so good that I decided to tell my
friends on Facebook about it. Rather than telling everyone about my breakfast
habits, I have a [friends list](https://www.facebook.com/help/?faq=200538509990389&amp;ref_query=friends+lists)
that I use for the purpose. Actually, I have dozens of lists, with
people categorised by interests, social circle, location, shared experiences,
personality type, programming language, and all manner of other criteria.

Telling my friends about my breakfast shouldn't have been a big deal, except
when I selected my breakfast list, Facebook informed me that posting to lists
has changed, and now [users will be able to see who else can see a given
post](https://www.facebook.com/help/?faq=196729973725708).  The pop-up
cheerfully informed me that they won't be told the *name* of the list
they're on, so everything's okay, right?

<!--more-->

Well, no... Firstly, I don't *need* to know the name of the list, I can *infer*
it. Let's say I'm reading one of your posts: are you talking about a very
personal experience? That's probably your list of close friends. Is your post
in Klingon? These are probably your Klingon-speaking friends. Is everyone else
in your list a family member? I'm guessing this is your family list. Sometimes
you might be sharing your most private and intimate fantasies and details...

<!-- Guess who need a plugin with image captions? -->

![Hovering over the cog gives the view above. Clicking on it reveals a complete list.](/images/privacygeek/jarjar-share-list.png)

So, why is this a big deal? Well, I'm blessed with a fabulously diverse
selection of friends, and many of them feel safe about sharing an awful lot of
their life with me. Consequently, one of my biggest uses for lists is to record
my friends' health and lifestyle choices. Cancer survivor? Sexual minority?
Circus freak? Transgendered? Member of the Jarjar Binks appreciation society?
Ethically flexible geneticist? Emacs user? Incurable stigmatising disease?
Useful in a zombie attack? Illegitimate child? Chances are, I have you on a
list.

In the past, I could cheerfully post relevant information to these lists,
without fear of outing anyone. Of course, my friends could always out
themselves, by commenting or liking a post, but those who chose to just observe
remained private. That's no longer the case. To post to a list means outing
everyone on that list, at least to each other.

It's not going to take long before the typical user starts encountering these
issues. Am I in your list of close friends? Now, when you share a post with
them, not only will I know that I'm special, but I'll know everyone else on
that list, too. In fact, I can write a bot to regularly look at the audience of
your posts, and see when you add a new person to your close friends list. More
interestingly still, I can spot when you remove someone. You wanted me to have
that information, right?

Amazingly, I *don't* want to share my list of close friends, not even with my
close friends themselves. I consider my list of friends, but *especially* my
list of close friends, to be pretty darn private.

Unfortunately, the workarounds for this change are pitifully few. Reading the
[documentation](https://www.facebook.com/help/?faq=196729973725708)
we can see that *smart lists* reveal their names, but not their members.
However they're primarily focused on clumping people by geography, and are
automatically updated by Facebook, so the opportunity for surprise is
rife. The only thing I've found which works is *negative* inclusion.

Put simply, if you post to friends, but *exclude* certain lists, it still shows
up as being posted to "friends". So you can still retain privacy by
posting to friends, and excluding all the ones *without* a Jarjar Binks
fetish. There might be other ways to hide the audience, but I'm yet to
find them.

Needless to say, this isn't a good workaround, and it requires some seriously
heavy-duty list management. If you have dozens of lists, you're going to have
to produce the inverse of all them.&nbsp; What's more, every time you get a new
friend, you'll need to add them to all the inverted lists, too. That either
means you need to be very patient and thorough, or have some sort of code
assisting.

If you feel like writing your own bot, so you can watch to see which lists you
happen to be on, then I suggest using the
[Graph API](http://graph.facebook.com/) to monitor your friends'
activities. To actually get the audience, you'll need to call 
`https://www.facebook.com/browse/audience/?fbid=`
as a logged in user (or clever bot) to see it, with the Facebook ID of the post
attached to the end.

I'm hoping Facebook will decide this was a mistake and reverse the changes,
otherwise I look forward to harvesting any friends lists you put me on. ;)
