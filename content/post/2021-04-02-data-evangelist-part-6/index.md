---
title: The Data Evangelist
subtitle: "Perspectives on building the Data Science Community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-04-02
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Photo by Michael Dziedzic on Unsplash"
  focal_point: "Bottom"
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

Vicki Boykis' post ["The ghosts in the data"](http://veekaybee.github.io/2021/03/26/data-ghosts/) on explicit versus implicit knowledge resonated with me this week. In the business, oftentimes we really only have a sense of what is know-able by engaging one another. Elsewhere, Mark Palmer [blogged](https://techno-sapien.com/blog/cassie-data-science-teams) on a progression of data science roles. In the two days since I posted a reference to it on the Yammer, it has reached 14 clicks. James Le's [blog post on DataOps](https://jameskle.com/writes/dataops-unleashed2021) has 29 clicks.

We are all so busy. Sometimes even too busy, and we miss the big opportunities. Respecting the value of everyone's time, this brief post will cover

-   Networked Thought,
-   High Performance Time Series Forecasting,
-   Modern Data Science Workflows,
-   Upcoming Events,
-   Helping data science students merge their advanced skills into existing teams
-   Imposter Syndrome,
-   and a book recommendation.

Whatever prompted you to read this blog post, I hope that you come away with a handful of useful insights for your own work.

------------------------------------------------------------------------

![xkcd comic "My friend and I both have apps we've stopped maintaining, so we just use the updates to chat." ](https://imgs.xkcd.com/comics/update_notes.png)

## Networked Thought

Synthesizing and sharing information is at the heart of most knowledge work. This is true for marketers, CEOs, sales people, and even analysts.

For many, the core of this "knowledge value chain" is a system for capturing ideas for later use, whether that's via an app, scratch paper, or a good old-fashioned spiral notebook.

As one who likes to continually evolve my tools to be more efficient, I've tried a bunch of different approaches over the past 25 years: Franklin planners, Microsoft OneNote, and even sending e-mails to myself have all played roles in my workflow.

New tools like Obsidian aim to change the way we capture and create knowledge. There are many of them on the interwebs, as a new crop of note-taking tools enabling what some call *networked thought*.

The term *networked thought*, while a bit high minded for a note-taking app, actually does a good job of capturing what's exciting about the current crop of ~~note taking~~ thinking tools.

Unlike a bunch of standalone notes, these new tools excel at allowing you to link one note to another. 

The benefits of these inter-note connections range from greater discoverability of sources, easier connection-making between ideas, reduced friction when it comes time to capturing ideas, and bidirectional linking between notes, which is what makes the net of ideas work.

All this makes it easy to relate ideas between one another and, when it comes time to synthesize, easily find everything you need.

These aren’t necessarily new concepts. The idea of a network of notes has an intellectual heritage in the wiki, first introduced by Ward Cunningham in the 90s, which was related to Lotus Notes, which in turn took inspiration from Apple’s HyperCard (80s) and even Vannevar Bush’s memex concept (1945). 

Tools like Obsidian play a big role in helping to popularize these ideas, mostly by galvanizing fervent communities around them. I expect to see much more of this over the coming years. 

I’d sure like to hear about your experiences with these types of tools. Do you agree that they’re the start of something big?

------------------------------------------------------------------------

## High Performance Time Series Forecasting with GPUs

Matt Dancho and Jacqueline Nolis delivered a 90-minute talk this week on building a modern high-performance forecasting system in the cloud. Matt's focus has been on packaging the feature engineering and algorithmic tools used in the winning Kaggle competition submissions into systems that can be deployed as world class demand planning business solutions.

Matt hosts an education platform called Business Science and develops open source packages. Jacqueline is lead data scientist at Saturn Cloud.

<a href="https://university.business-science.io/courses/541207/lectures/31554634"><img alt="Modeltime GluonTS Deep Learning | Saturn Cloud GPUs" src="https://ci6.googleusercontent.com/proxy/vwpNrG1Q0lVWaobJ6kqK8R0MrRoNK28ikRMMPhsbnGxcpBMxkpbkVMeZQwtlio5kid71SxuHBCwNtZNHYsAFSFxV5u3TJpcKoEFiajz_2HMHnHMBvSYghpo0ZhfW8jTmgYsc0ZJnzMSLO3B9Fuwm54Ihpdxa-g=s0-d-e1-ft#https://mcusercontent.com/cc36813ecec32f8e7b5088961/images/b2963393-6932-48fd-96d7-2dda3f11ff60.gif" width="250"></a>

The [code for the demonstration is available on github here](https://github.com/business-science/gpu_accelerated_forecasting_modeltime_gluonts). SaturnCloud provides 10 hours/month of free, basic GPU runtime. Look at Azure MLStudio and AWS infrastructure to host these tools as well, especially as the business needs scale up.

{{<youtube vmfzjTsU_zE>}}

------------------------------------------------------------------------

## Modern Data Science Workflows

On the surface, Vin Vashista's target audience for this 35 minute talk is people just entering the field in 2021. Engaging clients in business requires a level of candor about what rigorous work looks like. The talk is also relevant for professionals building out their current set of competencies to support more complex models and use cases. 

It's worth your time. Check it out:

{{<youtube aQSRJ56e-Vg >}}

------------------------------------------------------------------------

## Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

:star:️ April 6-7th [ISU Analytics Symposium](https://www.ivybusiness.iastate.edu/analytics-symposium/)

:star:️ April 12-14th [INFORMS Business Analytics Conference](http://meetings2.informs.org/wordpress/analytics2021/)

:star:️ April 21st [IIA's Spring Symposium](http://iiasymposium.com)

:star:️ September 6-10th [EARL Conference 2021](https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

------------------------------------------------------------------------

![](https://jnolis.com/images/blog/training_for_ds_teams/language_icons.jpg)

## Merge conflicts: helping data science students merge their advanced skills into existing teams

Allison Horst and Jacqueline Nolis published a [post this week](https://jnolis.com/blog/training_ds_for_teams/) on the perilous transition from the academic world of data science to industry. Entering the workplace, data science program graduates will often join teams further from the leading edge tools and approaches. Having a junior employee with more sophisticated technical skills than the senior members can cause complications for both the junior employee and the team as a whole. 

They close by recommending that students make connections with industry on capstone projects, take on internships, and participate in workshops to build skills on the human side of working with diverse teams.

{{<tweet 1348399361521111040>}}

## Imposter Syndrome

Scott Hanselman works at Microsoft, posts regularly on Twitter, and now has his first post on tiktok.

------------------------------------------------------------------------

## Book Recommendation

<a href="https://www.tmwr.org/"><img src="https://th.bing.com/th/id/OIP.Py5IsZhUv1X3h-M3H7thDAHaCs?pid=ImgDet&rs=1" alt="Tidy Modeling with R" width="400"/></a>

[Tidy Modeling with R](https://www.tmwr.org/) is a work in progress, with the first 15 chapters more or less complete. I will be presenting Chapter 13 to the R4DS TMWR Book Club next Tuesday evening. All are welcome to [join the R4ds Slack](http://r4ds.io/join), whether for help and support, or to join one of the many other book club groups.

The organizers are considering creating "birds of a feather" channels to facilitate interaction with people who work in fields similar to your own. They are not yet certain that this will make sense, so they'd like some feedback. Consider filling out this quick [survey](https://forms.gle/qDHyAujLzMyF75zt9) to help them decide what to do! 

------------------------------------------------------------------------

## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-03-26-data-evangelist-part-5/)

[AI and Data Strategy](https://jimgruman.netlify.app/post/ai-and-data-strategy/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
