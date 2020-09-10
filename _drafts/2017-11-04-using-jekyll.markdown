---
layout: post
title: "Using Jekyll"
author: tina
category: tech

---
So I wanted to finish up a working blog and faced my usual dilemma : I did not want to use a CMS (like *Wordpress* or *Blogger*) and developing one myself took a lot of time. It took a lot of time because I can't juste write an interface to a database that fetches and puts articles inside. No. I want something fast and secure.  
There's one answer. And it took me a long time before accepting it as a solution.

Static websites.

No, you didn't misread this one. Let me say it again.

Static websites.

*Jekyll is a simple, blog-aware, static site generator for personal, project, or organization sites* --Wikipedia  
That's what Wikipedia says. But I'd rather say that it is a preprocessor for HTML, CSS, and JS.

Because examples are faster to understand, here's a very minimal use case.
You write layouts in a folder called `_layouts`:  
`default.html`:
```html
<!doctype html>
<html>
  <body>
    <main>
      {% raw %}{{ content }}{% endraw %}
    </main>
  </body>
</html>
```
Then you write your content in markdown in a file, and tells *Jekyll* you want to use the layout we just wrote before.  
`content.markdown`:
```md
---
layout: default

---
This is my content and I can use some *lit* **markdown**.
```
Then you execute `jekyll build` and *Jekyll* will "*compile*" all your mardown files to a folder called `_site`. And you're ready to go.  
For example, here you'll have :
```
+-- _layouts/
|   |
|   +-- default.html
|
+-- content.markdown
|
+-- _site/
    |
    +-- content.html
```
* * *
*Jekyll* can do way more than this, but I will only cover my use case.

- I work locally on my blog (writing / modifying posts)
- I push my modifications to a remote *GitHub* repository
- My server which runs other sites on *[NGiИX](https://nginx.org)* periodically pull the latest version from *GitHub*
- My *NGiИX* server serves the `_site` folder to `/blog`

And that's dope. That makes publishing very easy and straightforward. I can write my blog posts in plain *Markdown* and they are translated to HTML.  
The only hard part was to write my own templates / layouts. I just can not stand using a theme that I did not make myself. So I wrote my own *Jekyll* layouts and CSS spreadsheets. Oh, did I mention you could use SCSS ? You can use SCSS. I used SCSS.  
But I kind of love designing websites so this part was fun.

That was impressively simple.

But most of all, it is fast. Serving static pages is super fast. Of course it has some drawbacks, you can not process data on the go like comments, web interfaces for writing articles, and such.  
You can however use client-side JavaScript to load server data after sending it, but that would ruin the purpose of generating HTML from Markdown files. Of course you can do it partially, for example, writing your posts / pages in Markdown and using Javascript to load comments.
* * *
Most important *Jekyll* features I did not mention are :
- Supports SCSS and Coffeescript
- *Jekyll* is supported by *[GitHub Pages](https://pages.github.com)* (you can host your website freely on *GitHub*)
- Embeds a web server for easy testing
