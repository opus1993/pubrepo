---
title: The Data Evangelist
subtitle: "Perspectives on how Data Scientists Lead"
date: '2021-02-18'
slug: []
categories: 
  - Business, Data Science
tags: 
  - Data Science
summary: ''
authors: [Jim Gruman]
featured: no
image:
  caption: 'Tsukioka Yoshitoshi (1875)'
  focal_point: ''
  preview_only: false
projects: []
draft: false
---

The weekly check-in conversations with my boss in the COVID era often dwell on the finer points of change management, which is certainly one of his strengths. Organizational change happens [**one person at a time**](https://www.prosci.com/resources/articles/the-what-why-and-how-of-change-management). Or more succinctly, organizations don't change. People within organizations change. Whatever prompted you to read this blog post, I'd like to think that you are in a position where you want to be a part of the change.  Or, at least, to "induce the wobble."

In that spirit, the questions I expect to drill down to through the course of this year include:

- Where exactly is our center of excellence for analytics?

- What is the current assessment of analytics maturity?

- Where is the analytics leadership forum, and how are they delivering to the business?

- What best practices opinionated framework guides our selection of the primary tool stack and skills definitions?

- What is our documented data quality strategy? How does the enterprise embrace it?

- Where is our robust feature store of high quality, clean data for modeling to accelerate analytics?

My post this week touches on 1) a GPU Deep Learning topic, 2) Opinionated Analytics Frameworks, 3) Who Deserves an Audience, 4) Learning Data Science, 5) Upcoming Meetups, and 6) closes with two Book Recommendations. 

----

## Interpretable Deep Learning

Conventional wisdom right now is that deep learning techniques in tabular data tend to over-fit, are not useful for discovering feature inferences, and are not interpretable. Arik and Pfister presented a 2020 paper and method called [tabnet](https://blogs.rstudio.com/ai/posts/2021-02-11-tabnet/#ref-arik2020tabnet) that leverages the deep learning `torch` framework and aspects of decision trees to overcome these limitations.

Sigrid Keydana published a blog post [torch, tidymodels, and high-energy physics](https://blogs.rstudio.com/ai/posts/2021-02-11-tabnet/) that I re-ran on an Azure ML Studio VM to explore the framework as well as Azure's GPU compute facilities. She may have the advantage of development versions of some packages, as her results were slightly different than mine. I'll explore the difference a little further and put together a post on github.

----

## Opinionated Analytics Frameworks

'No code' solutions certainly have their place in a data-driven company. Nearly every ISO audit I've supported over the past 25+ years involved some sort of procedural search for the appropriate work instruction and an Excel form template. When the team can get the job done right, and fast, with Excel, who am I to judge? 

However, in business critical contexts in 2021 there is no replacement for fully documented, reproducible code.

People in leadership positions that have no coding experience might be led to believe that coding is 'magic', and that if a person was hit by the 'proverbial bus' then the company would be in a lurch. The sentiment would be something like 'Just do it in Excel, anyone can follow it'.

My perspective today is that the complete opposite is true. First, there are plenty of people out there with R or Python (or pick your language) ability that can be hired; no one is irreplaceable. Second, the code is reproducible and readable.

Well documented/commented code is a must for validation. You know where the data came from, the filters applied, assumptions, variables, etc. and it is all in a logical sequence.

There is nothing worse than being handed a huge Excel sheet with no explanation of where it came from, and then playing 'follow the formulas' and try to figure out the logic. This is hard enough when the colleague is still there, and nearly impossible if the person is no longer with the company (or contractor). 

Hilary Parker's 2017 paper [Opinionated analysis development](https://peerj.com/preprints/3210/) and [conference talk](https://rstudio.com/resources/rstudioconf-2017/opinionated-analysis-development/) speaks to the processes of developing the technical artifacts — that is, the paper, dashboard, or other deliverable.

Unfortunately, leaders in industry sometimes fall into cookbookery & prescribing specific software choices. In the paper Parker argues that it is critical to teach analysts how to go about developing an analysis in order to maximize the probability that their analysis is reproducible, accurate, and collaborative. By encouraging the use of and fluency in tooling that implements the opinionated framework, as well as a blameless way of correcting course as analysts encounter errors, we as a community can foster the growth of processes that fail the practitioners as infrequently as possible.

----

## Who Deserves an Audience?

Comedian Jerry Seinfeld's new autobiography opens with a reflection of his formative years, discovering the thrill of connecting with a live audience, arriving at standup comedy as his calling. “[Is This Anything?](https://www.amazon.com/dp/B084BYK62K/)” is a decade-by-decade collection of ideas he initially wrote out on yellow legal pads, then honed in front of audiences, until a select few of them became his act. The book covers the evolution of the comedian and provides insights into the unforgiving art of writing for an audience.

Landing the connection with the audience is a core tenet of business school programs, with didactic multi-step methodologies to make anyone a speaking professional. For example, **#3** smile, **#6** walk towards your audience, and **#8** tell a story. Yet, in this era of social media, meaningful connections with audiences are still lacking, and the data science domain is no exception.

{{<tweet 1356395056899362816>}}

My blog post cover image is an 1875 woodblock printing entitled "[Tokugawa Iemitsu Receiving Lords in Audience](https://artvee.com/dl/tokugawa-iemitsu-receiving-lords-in-audience)" The artist, Tsukioka Yoshitoshi, like many Japanese of that era, was interested in new things from the rest of the world like photography, but over time he became increasingly concerned with the loss of aspects of traditional Japanese culture that brought people together.

{{<tweet 1356650318730305537>}}

In Amanda Mull's Atlantic piece "[The Pandemic Has Erased Entire Categories of Friendship](https://www.theatlantic.com/health/archive/2021/01/pandemic-goodbye-casual-friends/617839/)," she explains how there’s a reason you miss the people you didn’t even know that well. Most people are familiar with the idea of an inner circle. Sociologists propose that we also have an outer circle, vital to our social health in its own ways, functioning as the forums that we normally look to to find validation for our work and ideas.

"Inducing the wobble" in change management requires that our data science community of practice find new ways to re-connect with colleagues and leaders.

-----

## Learning Data Science

I've dropped my DataCamp subscription and moved on to other learning resources. In about one year's time I had managed to take some 30 or more short courses. Many of the original instructors there have moved on now, and some of the courses are stale, using older versions of packages. The company itself has taken actions that make it easy for me to choose to walk away.

Matt Dancho's [Business-Science](https://www.business-science.io/) courses and their Learning Labs Pro offering in particular suits my needs better for where I am. Forest Brazeal's blog post [The career-changing art of reading the docs](https://acloudguru.com/blog/engineering/the-career-changing-art-of-reading-the-docs) is great advice for keeping at the leading edge of a technical profession.

Every path to digital competency is going to be different. Like [Paige Bailey](https://twitter.com/DynamicWebPaige/status/1360303252219154432), I want not to be surprised if a data scientist used to be a biologist, or a bartender, or a geologist. DS skills do not require an ivory tower, or time sacrificed on acronyms for a Ph.D. Your Github should be your CV.

[Chris Albon](https://twitter.com/chrisalbon/status/1360465652817874944) at wikimedia outlines his hiring strategy as:

1. Remove educational requirements in job postings. No "CS degree or similar" etc.

1. Read the cover letter to let folks explain why they are right for the role.

1. Posting the job is just the start. Use a LinkedIn premium account to actively hunt strong potential candidates. Seriously, hunt down good candidates and get them to apply for your role.

1. As the hiring manager, hop on a 15 minute call with anyone remotely qualified. Have a conversation and collectively decide if they should continue with the process. Your bar here should be super low.

1. Send any remotely qualified candidate a take home AND have the take home quantitatively measurable. 

1. Require colleagues in the interview loop to pre-register interview questions. They can come up with their own questions but every candidate needs to get the same question.

1. Every interviewer's opinion needs to be justified in the interview notes. A candidate can't just be "not a fit," but rather the interviewers need to justify their thinking. Force your colleagues to evaluate their own thinking and biases.

1. Don't cede hiring decision making to your interview panel. You are building a *team*, not a collection of individuals. 

For the take home test technical content, there are a number of Data Science and Analytics credentialing organizations that bundle the input of their memberships, like [here](https://www.certifiedanalytics.org/) and [here](https://grow.google/certificates/). Books like [Cracking the Data Science Interview: 101+ Data Science Questions & Solutions](https://www.amazon.com/dp/171068013X), or [Build a Career in Data Science](https://www.manning.com/books/build-a-career-in-data-science), and even this four page [interview prep cheat sheet](https://github.com/aaronwangy/Data-Science-Cheatsheet) offer lists of what candidates expect to know before going into an interview.

> For your own company, do you know what the material is on the technical evaluation for new DS and analytics hires? 

Expect the bar to be raised on tech knowledge requirements in the coming years. I've recently seen "business intelligence analyst" postings that require NLP and Python. On that note, Linda Burtch gave a 26 minute talk this last week on the latest on talent acquisition, technical roles, and what to expect in 2021:

{{< youtube RHjXYicPWGA >}}

----

## Data Science Meetups

With virtual events it's possible to join communities of practice from all over the place 🙌. Here are a few that are upcoming:

⭐️ Feb 23rd RStudio Enterprise Community Meetup [End-to-end Data Science with RStudio Connect](https://lnkd.in/drU5qAk)

⭐️ Feb 24th Boston useR [3 Presentations: ndexr: democratizing data, using blogdown, & learnr package]( https://lnkd.in/dKcWy5t)

⭐️ Feb 25th Why R Foundation[brms: Bayesian Regression Models using Stan](https://www.meetup.com/Spotkania-Entuzjastow-R-Warsaw-R-Users-Group-Meetup/events/275582884/)

⭐️ March 2nd RStudio Enterprise Community Meetup [R in manufactuRing & consumeR products]( https://lnkd.in/drU5qAk)

⭐️ March 4th Why R Foundation [Towards automating Time Series Forecasting Using R]( https://lnkd.in/d8J7rEJ)

⭐️ Also check out the recording of this week's [Why R Foundation](https://www.youtube.com/WhyRFoundationVideos) talk, with Roel Hogervorst, on cloud resources and effective collaboration

{{< youtube 1t47U_nBXdE>}}

Roger's materials and links to source material are posted [here](https://github.com/RMHogervorst/running_your_r_script_in_the_cloud)

----

## Book Recommendations

Feature Engineering and Selection

<a href="https://www.taylorfrancis.com/books/feature-engineering-selection-max-kuhn-kjell-johnson/10.1201/9781315108230"><img alt="Feature Engineering and Selection" src="https://images.tandf.co.uk/common/jackets/agentjpg/978113807/9781138079229.jpg" width="450"></a>

Also available for free at [http://www.feat.engineering/](http://www.feat.engineering/)

*"The book is timely and needed. The interest in all things 'data science' morphed into everybody pretending to do, or know, Machine Learning. Kuhn and Johnson happen to actually know this―as evidenced by their earlier and still-popular tome entitled ‘Applied Predictive Modeling.’ The proposed ‘Feature Engineering and Selection’ builds on this and extends it. I expect it to become as popular with a wide reach as both a textbook, self-study material, and reference."* ~Dirk Eddelbuettel, University of Illinois at Urbana-Champaign

Staff Engineer

<a href="https://staffeng.com//book"><img alt="Staff Engineer: Leadership beyond the management track" src="https://staffeng.com/StaffEngCoverHero.png" width="450"></a>

*A pragmatic look at attaining and operating in Staff engineering roles, building on the lived experience of folks who've walked before you.*

----

ICYMI the last post of the series:

{{<tweet 1354203415962902529>}}

### Did you find this page helpful? Consider sharing it 🙌
