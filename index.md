---
layout: default
title: Hello World
---

Hello World from markdown!

Here are some things I like:

* Code
* Pictures of cats on the Internet
* You!

And if this works, here are some posts:

{% for post in site.posts %}
* {{ post.date | date_to_string }} [{{ post.title}}]({{ post.url }})
{% endfor %}
