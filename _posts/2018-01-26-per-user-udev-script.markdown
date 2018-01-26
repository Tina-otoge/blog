---
layout: post
title: "Per-user udev triggered script"
date: 2018-01-26 03:06:47 +0100
categories: linux
author: Tina
tags: script programming sysadmin

---
Ricing. Or stupid car tuning philosophy applied to computer interfaces.

I got myself invested a lot into making my *rice* beautiful. By that I mean
customizing my desktop environment so it looks personal and cool but remains
very efficient and productive at the same time.
While a lot of personalizations are subjective and so the choice of the window
manager, status bar, icon packs, and such, changes from a person to another;
there is some things that looks beautiful to the eyes of almost anyone.  
Shadows and transparency.

Nothing can beat the effect of a modern and simple transparent terminal with
soft shadows drawn on the desktop. To obtain this effect, one uses a
**compositing window manager** or a standalone **compositing manager**
([Wikipedia](https://en.wikipedia.org/wiki/Compositing_window_manager)).  
I use [Compton](https://github.com/chjj/compton). Don't ask why, it is the
first I tried and it was not difficult to configure, so I sticked with it.  
![My desktop with Compton running]({{ "i/desktop_compton.png" | relative_url }})

However something got my attention early after I started using *Compton*. A
compositing manager drains a lot of battery power. I don't know if I'm
imagining things, but I started to believe that my laptop's battery power was
decreasing way faster now that I started using *Compton*. Nothing too crazy
though, with the two integrated batteries in my *T470s* I could still use my
computer all day without charging. However it bothered me to think something
so insignifiant had a so big impact on my computer.

Later, [Kurokotei](https://twitter.com/dialgadu77), a friend of mine, showed me
something cool he did on his ArchLinux computer, he used *mpv* and *Compton*
to have a video playing as a wallpaper behind transparent windows ([See video](https://twitter.com/dialgadu77/status/955540684395728897)). Naturally
I decided to do the same, even if I will surely not use it on a daily basis. It
was more for the sake of trying to set it up and learn some things. But
something crossed my mind, playing a video is quite battery consuming. So
playing a video + running a compositing manager permanently would be the worst.

That's when I came up with an idea (and the main topic of this article): what if
I can run *Compton* (and other things) when I plug my laptop to AC and kill
them when I unplug it ?

And the journey begins.

Depending on what's available on your system, you may want to take a look at
[pm-utils](https://pm-utils.freedesktop.org/wiki/) which supposedly exists to
run scripts triggered by certain events. My OS apparently has a folder for it.  
![ls showing /etc/pm]({{ "i/ls_pm.png" | relative_url }} )  
However I will not be using it. Firstly because it did not work when I tried
and secondly because apparently the Internet says it's obsolete and I should
use `udev(7)`.  
Simply puts, `udev(7)` is a cool thing that relays events the kernel receives
when you plug or unplug devices to the computer. I did not do many more
research, when I understood that I had to add a rule to the `/etc/udev/rules.d`
folder to trigger scripts when I plug or unplug something to the computer I had
everything I wanted.

*udev* rules can be adressed to run a script, which will be executed as root
and without any environment. This is somehow expected but I wanted something
that was very specific to my user. Even if I'm the only one who uses my laptop,
I try to make my system as general and scalable as possible. If there was
another user on my computer, I don't think he would like to have *Compton*
executed everytime he plugs the computer to AC without being able to do anything
about it.

What I did then is a script meant to be run as root that will check every
folder in `/home` and check if there is a `.local/bin/some_script_name`
residing in each home folder. Then it runs it as the corresponding user. And
not as root. Because this would be a severe security breach otherwise.

The script I made that calls the corresponding scripts in each home directories is
stored in `/usr/local/bin`, I could not think of an other place for it. I
called it `powerrice` because I'm bad with names, and it checks for a
`~/.local/bin/powerrice` file in each user's home directory.

To execute a script when you plug or unplug the computer to AC you have to add
a similar rule to `/etc/udev/rules.d`, I called it `custom-powerrice.rules`.

`/etc/udev/rules.d/custom-powerrice.rules`:  
```bash
SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="/usr/local/bin/powerrice false"
SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="/usr/local/bin/powerrice true"
```
Of course you can change the path indicated in the `RUN` field to wherever you
want, just remember it will be run as root and without a regular environment.
You may also want to invert the `"0"`/`"1"` and change the `true`/`false`
depending on your specific scenario. In my case, I wanted to "enable powerrice"
when I plug the computer. So it made sense to run the script with `true` when
`"1"` is received. But you can see things in a different way. You may find a
lot of examples on the Internet with `true` and `false` inverted since usually
people make a script to "enable power saving" or something like that instead.

Here is my "powerrice" script, the one that calls the corresponding script in
each user's home directoy.

`/usr/local/bin/powerrice`:  
```bash
#!/usr/bin/env bash

for dir in /home/*/; do
	SCRIPT="$dir"".local/bin/powerrice"
	USER=$(echo "$dir" | cut -d'/' -f 3)
	if [ -f "$SCRIPT" ]; then
		su -c="$SCRIPT $1" $USER
	fi
done
```

And finally, this is my own user's "powerrice" script, that enables or kill
*Compton*.

`~/.local/bin/powerrice`:
```bash
#!/usr/bin/env bash

if $1; then
	env DISPLAY=":0" compton -b
else
	pkill -f compton
fi
```
Remember that scripts run with `udev(7)` are run without a standard
environement, so *Compton* won't be able to run the `XOpenDisplay` function. It
needs to know the current `DISPLAY`, that's why I used `env(1)`.

---
This concludes my experience with `udev(7)` and it was interesting.

What about you, did you learn anything useful from my experience?
