---
title: The Data Evangelist
subtitle: "Perspectives on building the Data Science Community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-04-08
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

"How am I going to help use the set of things I have to solve your customer problem?”

A number of conversations this week involved resources waiting for business problems to come to them. Experts that each own and secure a body of data in a form that is deemed sufficient, at least for their own ex-ante needs. So with a new CDO coming on board, I expect the question: "What's the plan for the whole enterprise data [feature store](https://thesequence.substack.com/p/edge77)?" And the truth is, right now it only exists to the extent that individual expert owners allow it to be. 

We often miss the big opportunities. Maybe the language we apply around data curation and expertise is a barrier to creating value for customers. This brief post will cover a few thoughts on

-   Teaming up to Innovate in the Garage,
-   A Data Science Generalist Role,
-   Survival Analysis, 
-   Upcoming Events,
-   Outsourcing Analytics,
-   and a book recommendation.

Whatever prompted you to read this blog post, I hope that you come away with a handful of useful insights for your own work.

------------------------------------------------------------------------

{{<tweet 1287782817963954178>}}

## Teaming up to Innovate in the Garage

> “In less than one year, we went from not even a concept on a napkin to an operating, deployed, scaled product to customers,” says **Parag Garg**, T-Mobile’s vice president of Product & Technology. “Together, we really quickly came to an architecture that worked and a solution center that worked. [Microsoft](https://news.microsoft.com/transform/from-hackathons-to-new-products-northwest-neighbors-t-mobile-and-microsoft-team-up-to-innovate/) brought in architects, they gave us support, they were really good partners and they’re right there in Redmond.”

Garg's team is featured in a 2020 article about successfully innovating, deploying, and scaling solutions from the Microsoft Garage [here](https://news.microsoft.com/transform/from-hackathons-to-new-products-northwest-neighbors-t-mobile-and-microsoft-team-up-to-innovate/).

The [Microsoft Garage](https://www.microsoft.com/en-us/garage/about/) delivers programs and experiences to employees, customers, and partners. Their motto is “doers, not talkers.” The Garage attracts people who are passionate about making a difference in the world. They are relentlessly curious and lifelong, hands-on learners. By actively participating in the creative process, regardless of success or failure, each person gets the opportunity to gain valuable insights, increase their knowledge, and learn diverse perspectives.

In the early days of The Garage, the focus was on employees and mobilizing Microsoft’s cultural ambitions. The Garage helped employees integrate these cultural priorities – Growth Mindset, Customer Obsession, Diversity & Inclusion, One Microsoft, and Making a difference – into everyday work. As The Garage grew and the culture shift actions gained critical mass, entire teams and organizations began driving their business forward. An additional focus of The Garage was helping teams and organizations integrate growth mindset activities into team workflows. More recently, The Garage has continued to evolve by bringing in Microsoft customers to team up with employees for high speed growth activities.

<a href="https://www.microsoft.com/en-us/garage/about/"><img src="https://www.microsoft.com/en-us/garage/wp-content/uploads/sites/5/2018/02/RedmondGarage-WEB.jpg" alt="What is The Garage?" width="600"/></a>

----

{{<tweet 1371912042140024833>}}

## Data Science Generalist

from Randy Au's [Being a broad-spectrum data scientist](https://counting.substack.com/p/being-a-broad-spectrum-data-scientist)

*Demetri here shone a bit of a light on my little niche of the data science space. While the flashy Machine Learning-powered aspects of data science tend to get the most attention, there also exists a lot of less flashy data work...*  

*Everywhere in the world, there’s data. A huge amount is currently collected and held by people who don’t have the skills to put it into use. It’s stored in various software systems, spreadsheets, stacks of paper files, and sometimes in human brains. It’s stuff that people use in their everyday work,* but most is captured in archives awaiting a business problem to come to them.

*Sometimes the problems are considered “uninteresting”, because they deal with tedious topics like handling inventory. Other times, the people who are collecting and using the data themselves haven’t sat down to think about how the data they’re using could be used for other interesting things. They might not even care since it might not make their lives easier.*

There is an opportunity here for people who love working with data and want to explore a generalist approach in their career, as opposed to going deep into a specialty. 

### What is high-breadth Data Science?

The broader enterprise needs generalist data roles to take the time to listen and understand what people are trying to accomplish, how their processes work, and then use basic data science methods to amplify those efforts across functional groups.

*Similarly, the consultant style of data science work, where highly paid teams are dropped in for limited engagements, is not (typically) what I’m talking about here either. The nature of expensive consulting work is that they also operate under certain domains of expertise. That domain is likely broader in scope than you’d find for a typical individual, but even within the consulting teams, there’s still quite a bit of specialization as they build out their toolbox and clients.*

The work of a generalist data scientist tends towards the simple stuff, including: *talking to stakeholders, understand the problem, acquire data, clean it up, build summary stats and simple analysis, answer some early questions, & iterate. Most subject matter experts that I partner with can take that information alone and run pretty far with it themselves. To take things to the next level, toss in some automation and reporting, and maybe even a dashboard or a processing pipeline.*

*The majority of the work is wrangling the data into a usable format and developing a solid research question based on what you know about the problem space. It’s often not possible to use complicated methods because they require increasingly deep domain knowledge to make sure things work correctly. Everything from how to collect and clean the data, identifying and correcting issues and biaes, and even interpreting and using results. Sure, you could just throw black box magical AI fairy dust at the problem and see what happens, but it’s usually not a good idea.*

But the generalist data scientist work is sometimes accounted for as a loss, or attributed to team inefficiency. And it is challenging, because like going super deep into a topic, going super wide is very difficult too. 

### Being broad means you deal with everyone’s weird data quirks

The hardest part about working with lots of experts, is working with lots of experts. *Each has their own language, expectations, conventions and norms. It takes a lot of effort to understand where people come from. The worst part is that if you don’t make the effort to understand, you’re either going to fail to create a useful solution at best, or burn social capital and damage your reputation.*

*You have to learn how and why different fields collect data. One team uses a unique piece of software from a vendor, and the only output mechanism is PDF. Another team might rely on data that comes in receipt scans.* CAN logs and error messages may infer different event meanings from vehicle to vehicle. Others might do everything in a single spreadsheet from hell (Looking at you Atlas & SCAN). 

*Thankfully, one of the nice things about* breadth *is it gets easier to use that knowledge to draw parallels to other fields. Just like how the learning curve between* R *and Python isn’t too painful compared to learning either from no programming background whatsoever. While you always have to be wary of over-generalizing, many skills transfer and things get easier with time.*

### Focus on the lowest hanging fruit

A big problem is how to figure out how the existing system actually works. Maybe you've just joined the project; maybe it's been a while since you touched this module and the docs never existed or are out of date, or maybe it never worked as it should. Where would we be if we treated this as a learning problem (as in "people learning things")? Where would we be if we stopped thinking of code and docs as blueprints and started thinking of them as lessons?

Generalists *cannot expect to solve every problem with a few strokes of the keyboard. If it were possible, someone else would have done it already. Instead, the main goal is to identify where the big wins are, without getting lost in minutiae.*  Ask "What keeps you up at night?" *Since data science is often about making better decisions more quickly, whether its through automation or decision support, there is usually something that can be made more efficient.*

*Speeding up decision making is very often a case of understanding what information people need, and giving it to them in a better way. Dashboards, often maligned for being rarely used and over-requested, can actually be useful in some situations. Other times, giving people context like “similar requests came up X times this week, this is normal but this one here is not normal” can lighten cognitive load.* 

### When you can’t do it alone, bridge

*In most cases, even the low hanging fruit problems are not solvable by a lone data scientist. Charts will not change the world on their own.*

*For example, imagine a subscription service where every new subscription is checked over by a human to reduce bad actors from joining a forum. We'd love to block those out quickly, but we also do not want a high false positive rate because it would hurt the service and anger paying customers.*

*There are definitely solid, proven data science methods to apply to this problem. Fraud and anomaly detection has a long history, is fairly well understood, and has off-the-shelf parts. But no one has implemented those systems for this team yet because it just was not deemed high enough priority to throw data science effort behind it. Then the generalist comes around and finds that its a solvable problem.*

A data science generalist *should realize that she cannot just implement a spam control system herself. Its too big of a project with lots of integration into existing systems. But knowing what a spam control system would look like, and applying technical skills let her sketch out how a system might wire into existing infrastructure. Sizing up the problem and the business impact is a value-add in itself. Having visibility and credibility between all the teams helps to align resources across the enterprise. Sitting in the intersection of all these groups of people and being able to communicate with all of them, she can find a way to make peoples lives easier, and everyone wins.*

### Your biggest impact is often through saving people’s time

*Teams who incidentally generate data during their day-to-day activities often do not have data science skills. So when helping out a team that does not have access to programming resources, saving time through automation and simpler decision making often jumps to the forefront. This is especially true when the teams get larger, saving everybody an hour of their time, multiplied by the team size, can quickly scale into a huge amount of time (and human frustration) saved.*

### Build and leverage connections

*One last benefit for working broadly is that the generalist will build connections all over the place. There are all the individual and team connections, which can be leveraged to get stuff done. There is value in being able to bridge context between teams that might not normally communicating closely.*

*There is also all the disparate data sets that could possibly be combined to make newer, even more exiting things. Networks get stronger and more interesting every time we add a new node.*

Randy's blog is at [Counting Stuff](https://ko-fi.com/countingstuff). Support his writing and buy him a coffee.

------------------------------------------------------------------------

{{<tweet 1379550608991080457>}}

## Survival Analysis In Engineering, Business, And Medicine

Dr. Nelson delivered a timely ASQ talk this week that demonstrated how analytical techniques in several domains are related in the context of censored, survival analytical examples. His slide materials are  [posted here](https://handouts-live.s3.amazonaws.com/2163e383912a4f9fa1ddd105f850baec?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20210408T155814Z&X-Amz-SignedHeaders=host&X-Amz-Expires=86400&X-Amz-Credential=AKIAJICNIQWVMWBRIUMQ%2F20210408%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a59a9689d5297aa234e27f5559425d6dfc2c077598a1fcd32c892c7d2d9d7e09).

Justin Zeltzer approaches the topic in an easy-to-watch video series. This is the second episode:

{{<youtube K-_sblQZ5rE>}}

------------------------------------------------------------------------

## Upcoming Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

:star:️ April 12-14th [INFORMS Business Analytics Conference](http://meetings2.informs.org/wordpress/analytics2021/)

:star:️ April 21st [IIA's Spring Symposium](http://iiasymposium.com)

:star: July 5-9th [useR!2021](https://user2021.r-project.org/)

:star:️ September 6-10th [EARL Conference 2021](https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

------------------------------------------------------------------------

{{<tweet 1374716048583368706>}}

## Outsourcing Analytics

Why do companies use external providers for data and analytical services they can produce themselves?

[Orestis Tsinalis](https://twitter.com/orestistsinalis) writes:

*The good reason: External providers may have expertise you don't have, in either some specific data related to your business or in some analytical methods that you don't know or cannot source.* 

*Unfortunately, the good reason above is usually a very small part of the story.*

*To understand how the choice of external providers (vs creating and retaining IP internally) works, look no further than corporate politics.*

*Maybe the data and analytical expertise exists, just not in "that senior stakeholder's" sphere of control.*

*What happens then? Internal data science teams are pitted against the external provider mostly as a pricing gauge, leading to either burnout or demoralization for the poor data scientist that is pitted against a whole company.*

*There is nothing more demotivating than "competing" with external providers. If you are an experienced data scientist chances are that you are capable of generating IP for the company you work for. Bringing some external company to destroy that opportunity is frustrating.*

*In a world driven by data, having a data science team as a tool for pricing and validating external providers is a waste of resources no matter how much money you think you are saving.*

*You are in the data business, you just don't know it until a data business eats your lunch.*

*What should you do if as a data scientist (or manager of a data science team) you find the company you work for uses you just as a pricing tool for external providers?*

*Start interviewing for innovative companies that really want you to create IP internally.*

------------------------------------------------------------------------

## Book Recommendation

<a href="https://end-to-end-machine-learning.teachable.com/"><img src="https://e2eml.school/images/zen_stones.jpg" alt="End-to-End Machine Learning" width="400"/></a>

In place of a book this week, let me draw your attention to Brandon Rohrer's [Teachable](https://end-to-end-machine-learning.teachable.com/) platform content. The e-learning material is a combination of free and subscription video and blogs.  Check out [Navigating a Data Science Career](https://end-to-end-machine-learning.teachable.com/p/navigating-a-data-science-career) as a good starting point. 

------------------------------------------------------------------------

## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-04-02-data-evangelist-part-6/)

[AI and Data Strategy](https://jimgruman.netlify.app/post/ai-and-data-strategy/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
