---
date: "2020-03-29"
diagram: true
image:
  caption: ''
  placement: 3
markup: mmark
math: true
title: rtweet on Windows
slug: rtweet-on-windows
categories:
  - R
tags:
  - R
---

I was inspired by inspired by David Robinson's Tidy Tuesday screencast to work with `rtweet` on some work-related Twitter handles and ended up discovering a bug and a workaround for windows users. 

{{< youtube KE9ItC3doEU >}}

As with any other project, the script opens with loading the library.

> library(rtweet)

The `rtweet` [Obtaining and using access tokens](http://rtweet.info/articles/auth.html) vignette gives instructions for creating tokens and writing them to `.Renviron`, one-time only, as:

> token <- create_token(
>  app = "mytwitterapp_NDMSBA",
>  consumer_key = api_key,
>  consumer_secret = api_secret_key,
>  access_token = access_token,
>  access_secret = access_token_secret)

Unfortunately, the process currently works properly in linux environments, but not in Windows. Closely inspect the token created:

> token<-rtweet::get_token()

> token

You have found the bug when the token returned does not match the keys created previously.

The solution to the problem is to edit your local `.Renviron` file manually. In the console, type

> usethis::edit_r_environ()

Find the **TWITTER_PAT** parameter and change every back slash `\` and forward slash `/` to double backslashes `\\` to the rds file address.  It will resemble

`"C:\\Users\\<youruser>\\Documents\\.rtweet_token.rds"`

Save the `.Renviron` file.  Then Restart R (Ctrl+Shift+F10). Closely inspect the token again:

> token<-rtweet::get_token()

> token

It turns out that [Jon Harmon has also reported of the issue at the package repo](https://github.com/ropensci/rtweet/issues/380). 

----

### Did you find this page helpful? Consider sharing it 🙌
