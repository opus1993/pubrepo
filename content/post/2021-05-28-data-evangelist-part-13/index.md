---
title: The Data Evangelist
subtitle: "Perspectives on building the Data Science Community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-05-28
featured: false
draft: false
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "image by Brett Jordan at Unsplash"
  focal_point: "Bottom"
  preview_only: false
projects: []
---

Marianne Bellotti's recent [Medium](https://onezero.medium.com/a-i-is-solving-the-wrong-problem-253b636770cd) post makes a call to action to build **antifragile** artificial intelligence. She writes:  
(<u>my emphasis</u>)

> Current A.I. systems are completely dependent on the quality of their data not because the technology is immature or broken but because <u>we have designed them to be vulnerable</u> in this fashion. Production A.I. systems must be designed to be resilient to bad data. If we change the problem we are attempting to solve, we can change the design to mitigate the risk...       

This really is a leadership challenge, in that we must drive to solve for the right problems. My past Evangelist posts have harped on about driving rigor in decision making, including [here](https://jimgruman.netlify.app/post/2021-03-01-data-evangelist-part-3/) and [here](https://jimgruman.netlify.app/post/2021-03-26-data-evangelist-part-5/). Rigorous experimental design and execution is not just about the quality of data, but also in the models and then in delivering impact as purpose designed and built solutions. 

When attempting to engineer a solution to a challenging problem, the best teams strip requirements down to first principles: What assumptions are we making, and how do those assumptions frame the problems we think we need to solve? If the assumptions were different, would we be solving different problems? How do the problems we want to solve map to outcomes we value?

Bellotti's conclusion:

> When the goal of A.I. is not to best the top experts but instead reinforce and support good decision-making practices, that technology is resilient to bad data and capable of becoming antifragile. But that A.I. doesn’t make determinations. Instead, it helps people articulate the assumptions behind the decision, communicate those assumptions to other stakeholders, and alert the decision-makers when there are significant changes to ground conditions relevant to those assumptions. A.I. can assist decision-makers in figuring out what states are possible or in what conditions they are possible. Such a solution can strengthen a team’s overall performance by addressing existing weaknesses rather than inventing new ones for adversaries to exploit.

On that theme, this post covers highlights from this week in the world we all work in. Whatever prompted you to read this blog post, I hope that you come away with a handful of useful insights for your own work. The content:

- Lets talk about teams
- We’re solving the wrong problems
- Managing your manager
- Upcoming events
- Experimental design
- A book recommendation
- Microsoft's \#Build Conference

----

{{<tweet 1397204275508482061>}}

## Let's talk about teams

Contrary to the digital-transformation promises in sales pitches today, as long as decisions need to be made by people, with all of the types of stakeholders and their individual motivations, the path to improving decision-making has little to do with adding sensors and dashboards. We need to first address modes of communication through  human networks, and **who** needs to know **what** actionable information **when**. 

Executive leadership really does not care about the technical details. They live strategy, talk money, and pay for outcomes. They find managers to hire and lead teams to deliver customer experiences.

Prospective job candidates observe that one of the most frustrating aspects of interviewing is that hiring managers have wildly different business outcome expectations for a given technical skillset list. Many are frustrated by postings requiring all the skills that a great data scientist might have, though few skills listed have anything to do with delivering business outcomes on that team. (i.e. "mapreduce" or "anova" or "Tableau") When you think about it, the list of the latest technical skills changes every year anyway.

Great managers and great teams do exist. A great team lead will 

- hire for diverse skill sets so that each member can focus on the aspects of their job where they excel.

- ensure that the data team doesn’t need to manage and scale their own k8s clusters; others with the right skills focus on infrastructure.

- ensure that data scientists don’t need to implement low-latency assignments, as they can focus on designing and analyzing the more challenging projects.

-  hire members who have empathy and communication skills so they can engage with stakeholders at any level and feel confident in their position, knowing they’re not expected individually to have software engineering, sales, marketing and all the other unicorn skills.

[Brandon Rohrer of iRobot curates a “Teachable” collection of courses/blogs](https://jimgruman.netlify.app/post/end-to-end-machine-learning/) that covers these points well, including [#121. Navigating a Data Science Career](https://end-to-end-machine-learning.teachable.com/p/navigating-a-data-science-career).

Most data scientists can build math models, but only a few can create business impact working solo. Let's admit that that this itself is going to be seen as a gap and the business will have little sympathy. Working on a well-orchestrated team though, each individual member has far more potential to flourish. 

----

{{<tweet 1397255027635359747>}}

## We’re solving the wrong problems

Most of the time, the outcome we are really expecting is better, faster decision-making. We all assume that giving leaders access to more data is the key, right? Total situational awareness is certainly seductive.

In real life, though, the majority of decision-makers optimize for conserving effort. The process of making a decision is less about an analysis of data and more about active negotiations between stakeholders with different tolerances for risk. More often than not, data is used not for the insights it offers but as a shield to protect departments from fallout. 

You would think that total situational awareness would improve the decision-making process, but perfect information — if it were even achievable — often actually lowers the quality of decisions by increasing the level of noise. The quantity of information alone will fail to change the organizational politics behind a decision. 

When determining how to leverage promising technologies, technical managers need to first consider how they are defining the problems that need to be solved. If the goal is to improve decision-making, then the focus should be on rigorous experimental design. In real life, total situational awareness is less desirable than having solid tools that facilitate team efforts leading up to a decision. After all, decisions are judged by the results. 

----

## Managing Your Manager

I'm adding this podcast segment at this point because in most cases, YOU have more technical capabilities than your team leader. Learn to manage up. 

<iframe src="https://anchor.fm/datascicareer/embed/episodes/Interlude-Managing-Your-Manager-e11065q" height="102px" width="400px" frameborder="0" scrolling="no"></iframe>

-----

## Upcoming Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

:star: June 1, 8, 15, 22 [Sliced Data Science Competition](https://www.notion.so/Sliced-Show-c7bd26356e3a42279e2dfbafb0480073) on Twitch at 8:30 Eastern 

:star: June 17 [Reproducible computation at scale](https://www.meetup.com/R-Lille/events/277902715/) with Will Landau of Eli Lilly and Company

:star: June 24 [Data Science Leader Fireside Chat](https://www.meetup.com/RStudio-Enterprise-Community-Meetup/events/278386492/) with John Thompson, Global Head of Advanced Analytics & AI at CSL Behring

:star: July 5-9th [useR!2021](https://user2021.r-project.org/)

:star:️ September 6-10th [EARL Conference 2021](https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

:star: September 8-10 [New York R Conference](https://twitter.com/rstatsai)

:star: September 16-17 [INFORMS Midwest Regional Analytics Conference](http://meetings2.informs.org/wordpress/regional-analytics-midwest2021/) Chicago Chapter hosting, virtual event

------

## Experimental design

A common technical interview question:

**What is your process for experimental design and execution?** 

Few can articulate the answer completely, yet it is critical to doing great work.

Without a well-structured experiment, our work lacks evidentiary support. Without the discipline, making decisions, or even worse, deploying A.I. models to production, is sloppy.

Expect an answer along these lines:

1. System problem space exploration and definition
1. Solution space exploration and definition
1. Factor and treatment analysis
1. Experiment definition
1. Experiment execution
1. Compile the report: Methods, analysis, interpretation, evidentiary support
1. Results, validation, and reproducibility
1. Artifact publication

Data Science finds patterns in the data and builds possible models that explain those patterns. The experiment creates evidentiary support, proving a model has learned something about the system with explain-ability.

The technical tool stack can be learned. Coding in a language is not the hard part. The rigor is.

----

## Book Recommendation

<a href="https://timharford.com/books/worldaddup/"><img src="https://timharford.com/wp-content/uploads/2021/04/Paperback-cover.jpg" alt="HOW TO MAKE THE WORLD ADD UP" width="400"/></a>

> Rather than simply rebuffing statistical trickery, Harford’s book implores us to look past the bluster – and our own biases…required reading”
*Wired, best science and tech books of 2020*

----

## Microsoft Build Conference

Microsoft CEO Satya Nadella's Build 2021 Keynote, with comments on AI  and connectivity in agriculture.

{{<youtube OCHN00stj2o>}}


And a brief 3rd party reflection of the conference highlights on Microsoft's Machine Learning tool stack:

{{<youtube AsacRomilZE>}}

------

## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-05-21-data-evangelist-part-12/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
