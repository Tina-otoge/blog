---
layout: post
title: "You can (and should!) probably switch to Linux"
author: tina
tags: linux tech

---

8 years ago, I started using Linux very casually to manage Minecraft servers
running on dedicated machines.  
4 years ago I started using Linux at school as a main part of my programming
environment.  
3 years ago I started using Linux as my main OS.

## What's so good about it?

I don't believe I'd be able to ever switch back to another operating system in
my life.

Linux and everything that surrounds it is free and open source, this means it's
built by many different people and rarely for profit. Even if it's not
dominating the desktop market, Linux is used in almost *every* other computers.
You may not realize it, but that's a damn lot. Servers, supercomputers, cars,
planes, TVs, almost everything that requires a computer runs Linux.

This means two things:
- It is trustworthy and powerful. Basically the whole industrial world depends
on it, from Amazon to Tesla, they all need and use Linux. So if there's a major
issue there are probably hundreds of professionals trying to resolve it right
now.
- It does not try to spy you or milk money out of you. Since it is written by
people with various interests, from hobbyist to big companies, the majority of
versions distributed are entirely free and does not contain mailicious stuffs.
Except in the case of Red Hat or Canonical's Ubuntu which are distributed by
companies, but targets professional companies or targets idiots (in this exact
order).

## Major advantages for regular users

I think I did a nice job at convincing you that I love Linux, however saying it
is "free", "powerful" and "trustworthy" is cute but it does not really bring up
any arguments. So to convince you that it is actually that great, I want to give
you real life examples.

### Alternatives everywhere

Imagine there is only one single company selling clothes in the world. And their
clothes are terrible. They stink. They ache. They are ugly. After using them for
a few weeks they are so worn out that you need to buy new ones.

You would not even know it is bad because your job is not to make clothes, so
you do not know what would be "good quality" clothes.

This is what happens when a company holds the monopoly on a product. Competitors
actually enforce a raise of quality. If one company makes awful products,
someone will eventually come up with an alternative that is actually good. Or
cheaper. Or free. That is actually what started Linux, it is an entirely free
alternative to the UNIX system which was a proprietary and commercial product at
the time.

Because of the free nature of Linux ("free" as in "public" more than "$0"),
almost every components and tools written for Linux know several alternatives.

This is good because as a user it means you are free to choose softwares that
suits your specific needs or preferences.

Don't like how the windows move and look? There are dozens of windows managers.  
Don't like your files browser? There are so many others.  
Don't like your browser? Terminal? Text editor? Taskbar? Login screen?

Of course you'll need to spend at least some time researching what's the
different ones and how they compare, but even just knowing you are not tied to
one specific tool is awesome. It took me a lot of time to realize how much of
broken Microsoft softwares I'm **forced** to use when I'm using Windows.

A lot of Linux softwares recommendations can be found on my [dotfiles repository][dotfiles]
over at GitHub.

### Packages managers

If using Windows, you are probably used to the "installer program" way of doing
things. To install a program called A, you download a program called B which
sole purpose is to install program A. It will take care of putting the files in
the right directories, because juggling between "Program Files", "ProgramData",
"AppData" and the registery keys is a tedious task on its own so we write a
seperate program for it.  
This is a terrible mess, and I have yet to rant about programs then having to
find a reliable way to stay up to date. Either by warning you that a new version
came out when starting them or running background jobs.

A package manager is a software that solves this problem. If you want to
download Google Chrome you asks your package manager to install it.
It is also the one you will ask for when you want to update some programs, or
more commonly all the programs installed on your computer at once.

You will never see a "Download here!" page on the web ever again.

This is very similar to what you get with mobile devices or Mac OS.

### Prominent helpful community

Because of the so many different softwares, you may be worried that it's easy to
get lost, not to find what to use or how to configure something to suit your
need.

Fear not, probably because of the Linux philosphy and it being a platform of
choice for developers, plenty of wikis, guides or even books exist to support
all the users. Also most built-in and widely used softwares usually come with
manual pages.

## Tips and myths

There a lot of wrong assumptions people make about Linux. Also there are easy
mistakes and things I would have loved to know from the start.

### Games

Most games run fine on Linux, and the list of native games will definitely grow.

Almost half of my Steam library runs natively on Linux, and I own nearly 300
games. For the ones that don't, current tools makes it totally seamless to run
them just like native games.

Only exceptions are some niche visual novels or arcade games that refuses to
run, but honestly, they are a pain to run on Windows too so it's not surprising.

If you do not play those, you can probably entirely ditch Windows. I run games
such as Counter-Strike, Minecraft, many visual novels and rhythm games
(including osu!) on Linux just as good as on Windows, sometimes they run even
better.

I believe many future games will be compatible with Linux because a new 3D API
called Vulkan is fastly growing in popularity and it is cross-platform. This
means this lowers greatly the chances of game developers using DirectX which is
exclusive to Windows. Even though it's not the only factor that makes developer
writing Windows-exclusive games, it is one of the most important ones.

### An OS for developers

While it is true that Linux is loved by developers and thus a crazy amount of
softwares built for Linux are targeted at developers, there is a fairly great
amount of tools available for other categories of users too.

This includes gamers, content creators such as 2D and 3D digital artists or
video producers, web designers, and many more.

### Picking a distribution

A distribution is more or less a "release" of Linux, bundled with a set of
softwares, often pre-configured, usually with a desktop.

One of the worst assumption I see daily is that people associates distributions
with the (default) look of the desktop bundled with them.

The desktop, just like most part of the Linux OS, is a program that is not tied
with the OS itself. You can freely swap it with another "desktop" program, run
multiple ones at once, or install several ones and pick a different one every
day. It is pointless to judge a Linux distribution based on the default desktop
it ships with. Replacing a desktop is as easy as replacing your web browser.

There are others things you can look at when picking a distribution, such as its
packages management system, the availability and version of packages released,
its history or its project philosophy.

I recommend reading [about each major distributions at DistroWatch.com](https://distrowatch.com/dwres.php?resource=major).  
Even though the website is ugly as hell, it is a very rich source of
information about Linux distributions.


I personally currently use Fedora on the desktop and recently switched from
Fedora to Debian on the server against my will. Feel free to ask me about
distributions on Twitter, Discord or Matrix.

### Command line tools

People who want a regular desktop experience tend to be afraid of using the
terminal. While I use the terminal more often than I use graphical tools, I
believe it's entirely possible to use Linux without having to use a terminal.

However, there are many very useful command line tools that are probably worth
learning even if you are seeking a "traditional" desktop experience.

- ImageMagick is a set of tool to manipulate pictures. Converting and resizing
images is very easy with it.
`convert something.png something.jpg`.
`convert big.png -resize 200x200 small.png`.
`convert photo.jpg -flip flipped.jpg`  
They probably all do the thing you just guessed in your head.

- ffmpeg is similar but for audio and video files.

- cURL and wget allows simple downloading of web resources and can cover very
complex scenarios if needed.

- `ln -s` is the command to create symbolic links to files. Similar to Windows'
"shortcuts" but way more powerful. I recommend learning and experimenting with
them very early.

A lot of Linux softwares recommendations can be found on my [dotfiles repository][dotfiles]
over at GitHub.

## End note

I've been wanting to put together an article like that since a very long time.
I think I really fell in love with Linux. And I want other people to understand
why, even if that don't make them switch to it, I believe there is an huge lack
of understanding about Linux and how efficient it is as a desktop OS.

I hope I convinced some of you!

[dotfiles]: https://github.com/skielred/Dotfiles
