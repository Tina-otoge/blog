---
layout: post
title: "Why I think C is a good thing for beginners"
date: 2018-07-26 00:56:00 +0100
author: COLAMAroro
tags: programming opinion guest

---

This time I'm presenting you an article that wasn't written by myself. COLA is
a classmate of mine. We've been in the same school since 2016 and will probably
still be until I graduate, theorically in 2022. He asked if he could write an
article on my blog about why he thinks C is a good language to learn for young
programmers, which I of course agreed to.

I won't express my opinion on this matter here. While reading, please don't
forget that this article is based on his personal experience with programming
and C. Have a good read!

\- Tina.

# Why I think C is a good thing for beginners

#### From Corentin "COLA" R


>Just to be sure, this is a personnal rant.
I don't assume my point of view is the best one. It's mine.
Feel free to agree or disagree. Now let's get right in.


I kinda like computers. I also like computer science. So I decided to study it.
I'm actually a student at [EPITECH](http://epitech.eu), where they teach you C
as your first language. During the first year (called Tek1), you do only C
And during the Tek2, you still do a lot of C, but also some C++.

The C language is not nice to you. It's not forgiving. He will not take you by
the hand. You forget a check? Segfault. You don't read entierly some API?
Get ready for serious memory leaks. Wanna concatenate two strings together?
Your job to reallocate a new memory area, concatenate the strings and free the
other part. C is a low level language. You give (almost) direct instructions
to your machine

EPITECH is not really kind too. You start with their famous C Pool (5 weeks of 
C, 7 days a week, 15 hours a day), in which your job is to recreate some
functions of the standard C lib (mainly string functions, like strcpy, strlen,
etc...). They also correct you with an autograder, meaning you will receive
your result (Or [this message🙃](https://i.imgur.com/Edns7sN.png)) in your
inbox. And they are not very kind too regarding their coding style and your
code compliance.

It means I've learned C the **hard way**. Take the function to write 1
character, draw me a fucking christmas tree on the terminal. Using *printf(2)*?
No way. You will have to rewrite it later anyway.

What I've learned by doing that? I know how my tools works. I know how Linux
works. I know how computers and programs *really* work. Memory doesn't just
appear. You have to request it, but it's *heap memory*. It means I know
the difference between `cat file | someprogram` and `someprogam < file`
(If you don't understand, it's standard linux thing)

What's the interest of learning the hard way? Let me quote my algorithm teacher
from my EPITA year:
>Vous faites du C#, vous appellez list.sort() sur une liste de 50000 éléments
et vous vous plaignez que ça prenne du temps

Translated to english:
>With C#, you call list.sort() on a 50k elements list, and you complain about
your program being slow

You know to react when in a more forgiving language like Python, you see an
`OutOfMemoryException`. You thank the language to handle the boilerplate code,
but you remember that it's not just magic.

You learn to read an API documentation. You learn good practice, clean
coding style, efficiency.

Yes, it's annoying, but at least you understand **computer programming**, not
just programming. Other languages are probably just based on a runtime written
in C or C++ anyway (JVM is written in C, so does CPython). Elevate yourself
from wannabe programmers who do **entire string comparaisons** instead of
enums.


And that's probably all I have to say. Thank you for reading till the end and
thanks Tina for letting me write this on his blog. You can contact me for
questions/answers on Discord, at `COLAMAroro#0001`
