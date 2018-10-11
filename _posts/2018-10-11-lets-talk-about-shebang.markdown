---
layout: post
title: "Let's talk about shebangs!"
date: 2018-10-11 10:35:33 +0100
author: Tina
tags: linux bash best-practices

---

# Introduction to shebangs

*Shebangs*, or less commonly called *hashbangs*, are the top line of an
executable script written in plain-text on UNIX systems. For example, imagine a
file called `install`, without any extension. The file mode has the executable
bit set for current user. So you can execute it by just typing `./install`. At
this point, your system has to guess what to do with this file. If it was
compiled file, it will just execute the machine code in it. Since it's just
text, it starts by reading the first line to get a clue on what's this file and
what to do with it.

A shebang is this same top line written as a special [comment][wiki-comment]
that explicits an absolute path to an executable file, an interpreter, that is
able to read this plain-text code and do something with it. For example:
```python
#!/usr/bin/python3

print('max 300')
```
Since the first line says `#!/usr/bin/python3` your OS will execute
`print('max 300')` using Python 3. Hoo-ray!

But now you want to share this script to a friend, you send it to him, sadly
your friend didn't install Python 3 in `/usr/bin/python3` because it is not
packaged by default on its system and he is not an administrator. So he has
Python 3 installed in his home folder at `~/.local/bin/python3`, invoking
`/usr/bin/python3` fails on his computer, and now he hates you.
Congratulations, you just lost the only person in the world that considered
himself as your friend. You will now spend the rest of your life alone and sad.

Hopefully there is a trick to make it work. Instead of directly writing down
`/usr/bin/python3` you can instead reference `/usr/bin/env` which is a way more
standardly packaged utility which role is to alter or search in the
[PATH][wiki-path]. So writting your script this way instead:
```python
#!/usr/bin/env python3

print('please let\'s stay friends :(')
```
Will actually do things a bit differently.

- First search in $PATH for an occurence of `python3`
- Then execute the script using the found `python3`

Now, no matter where Python 3 is installed, the user-preferred one will be
used. Yay!

# And now everything is broken.

Then it starts getting problematic if I want to write a system-wide script that
uses Python 3.4. As your sysem administrator I ship Python 3.4 in
`/usr/bin/python3`, and my script has the shebang `#!/usr/bin/env python3`.

But you were not happy with Python 3.4, you wanted these sweet [asynchronous
generators][PEP-525] that comes with Python 3.6. But since you are not an
administrator, you installed Python 3.6 in `~/.local/bin/python3` and it is
invoked by default when you type `python3`, because it's the first one that
comes when looking in your `PATH`. But since my very important system-wide
script that is written in Python 3.4 and not 3.6 makes use of `StopIteration`
which was [changed after Python 3.4][PEP-479-breaks], now it's borken.

Oh too bad, this script was used to periodically backup your data and now it's
all deleted due to the script failing, you lost all of your holidays photos you
took with your mom last year and now she hates you and now you are getting
kicked out of your own house. Good job.

# So what?

The point of this article is not to point out that you breaking changes in
Python are dangerous. It is not to point out that you should not backup your
holidays photos on my server because I may inadvertently delete them. And it
is definitely not to point out that standard shebangs don't exist and that
they should be written according to context.

Oh wait, I lied on the last one.

## Write shebangs according to context

If you are a system administrator and write a system-wide script, you probably
want to reference the binaries shipped with your system, not the ones in PATH.
Never ever trust PATH. PATH is a user-land variable. Users can **and will**
change it. If just for the fun of it, I create a symlink to `/bin/true` and
place it into `~/.local/bin/python3` what do you think will happen to your
script? Well I'm probably really fucking dumb for doing this and I don't know
why you accepted that I use your server, but that doesn't change the fact that
it is dangerous.

If you already know you want to use the executable located in `/usr/bin` then
do so, don't rely on PATH.

Now if you are writing an executable script designed for regular users, things
are different. You want people to download an run your script, no matter where
they installed Python 3 or Bash on their computer. If they want to run your
script in a special version of Bash that prints the characters backwards just
for the sake of it, then why not. They do what they want, they are the users.

Then it makes sense to use `/usr/bin/env` because it will find the appropriated
interpreter, no matter where it is.

# Conclusion

Don't search for "should I use `#!/bin/bash` or `#!/usr/bin/env bash` in my
scripts. Search what's the difference between them. Or maybe don't, since you
just read my article the differences should be clear by now.

There is no best solution. There are contexts, and there are solutions
appropriate to these contexts.

I hope you learned a thing or two about UNIX and that you feel more clever than
ever now that you are a shebang master.

# Sources that inspired this article

- [Why is #!/usr/bin/env bash superior to #!/bin/bash? on StackOverflow](https://stackoverflow.com/questions/21612980/why-is-usr-bin-env-bash-superior-to-bin-bash)
- [Globally ban use of /usr/bin/env in executables on Pagure.io](https://pagure.io/packaging-committee/issue/700)
- [Fedora Packaging Guidelines about Shebangs](https://fedoraproject.org/wiki/Packaging:Guidelines#Shebang_lines)
- [Is Python 3.5 fully backward compatible with 3.4? on Quora](https://www.quora.com/Is-Python-3-5-fully-backward-compatible-with-3-4)

[wiki-comment]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[wiki-path]: https://en.wikipedia.org/wiki/PATH_(variable)
[PEP-525]: https://www.python.org/dev/peps/pep-0525
[PEP-479-breaks]: https://www.python.org/dev/peps/pep-0479/#consequences-for-existing-code
