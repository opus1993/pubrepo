---
title: The Data Evangelist
subtitle: "Perspectives on building the Data Science Community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-04-09
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

A number of conversations this week involved resources waiting for business problems to come to them. Many experts each own and secure a body of data in a form that is deemed sufficient, at least for their own previous needs. A supply chain manager that I respect asked for the plan for the whole enterprise data feature store. And the truth is, right now it only exists to the extent that individual expert owners allow it to be. 

We often miss the big opportunities. Maybe the language we apply around data curation and expertise is a barrier to creating value for customers. This brief post will cover a few thoughts on

-   Teaming up to Innovate,
-   A Data Science Generalist Role,
-   Survival Analysis, 
-   Upcoming Events,
-   Outsourcing Analytics,
-   and a book recommendation.

Whatever prompted you to read this blog post, I hope that you come away with a handful of useful insights for your own work.

------------------------------------------------------------------------

{{<tweet 1287782817963954178>}}

## Teaming up to Innovate

> “In less than one year, we went from not even a concept on a napkin to an operating, deployed, scaled product to customers,” says **Parag Garg**, T-Mobile’s vice president of Product & Technology. “Together, we really quickly came to an architecture that worked and a solution center that worked. [Microsoft](https://news.microsoft.com/transform/from-hackathons-to-new-products-northwest-neighbors-t-mobile-and-microsoft-team-up-to-innovate/) brought in architects, they gave us support, they were really good partners and they’re right there in Redmond.”

A must-read piece about successfully innovating, deploying, and scaling solutions [here](https://news.microsoft.com/transform/from-hackathons-to-new-products-northwest-neighbors-t-mobile-and-microsoft-team-up-to-innovate/).

----

{{<tweet 1371912042140024833>}}

## Data Science Generalist

Demetri here exposed an uncomfortable reality of my pocket of the data science space. While the flashy Machine Learning aspects of data science get the most attention, there also exists a lot of less flashy data work. We are immersed in data, everywhere. A huge amount currently collected is held by people who do not have have the skills to put it to its best use. It's owned and stored in various software systems, sharepoints, tables, and repos. People use some of it in their daily work, but most is captured in archives awaiting a business problem to come to them.

Sometimes the business problems are uninteresting because they deal with tedious topics. Other times, the people who are collecting and using the data themselves haven’t yet thought about how the data they’re using could be used elsewhere. They might not even care since it might not make their own lives easier.

There is an opportunity here for people who love working with data and want to explore a generalist approach in their career, as opposed to going deep into a specialty. The broader enterprise needs generalist data roles to take the time to listen and understand what people are trying to accomplish, how their processes work, and then use basic data science methods to amplify those efforts across functional groups.

Similarly, the consultant mode of data science, where highly paid teams are dropped in for limited engagements, is not exactly what advocating for either. The nature of expensive consulting work is that they also operate under specific domains of expertise. There’s still quite a bit of specialization as they build out their toolbox and clients, and market their plug-in accelerators.

The work of a generalist data scientist tends towards the simple stuff, including: talk to stakeholders, understand the problem, take data, clean it up, summary stats and simple analysis, answer some questions, iterate. Most subject matter experts I partner with can take that information alone and run pretty far with it themselves. To take things to the next level, toss in some automation and reporting, and maybe even a dashboard or a processing pipeline.

The majority of the work is wrangling the data into a usable format and developing a solid research question based on what you know about the problem space. It’s often not practical to use complicated methods because they require increasingly deep domain knowledge to make sure things work correctly. Everything from how to collect and clean the data, identifying and correcting issues and biases, and even interpreting and using results. Do not expect that throwing black box magical AI at the problem will resolve it.

But the generalist data scientist work is accounted for as loss, or attributed to team inefficiency. And it is challenging, because like going super deep into a topic, going super wide is very difficult too. The hardest part about working with lots of experts, is working with lots of experts. Each has their own language, expectations, conventions and norms. It takes a lot of effort to understand where people come from. The worst part is that if you don’t make the effort to understand, you’re either going to fail to create a useful solution at best, or burn social capital and damage your reputation.

You have to learn how and why different fields collect data. One team uses a unique piece of software from a vendor, and the only output mechanism is PDF. Another team might rely on data that comes in receipt scans. Others might do everything in a single spreadsheet from hell (Looking at Atlas, or SCAN). 

Thankfully, one aspect of breadth is that once we start, it gets easier to use that knowledge to draw parallels to other fields. It's the same as how the learning curve of between R and Python isn’t too painful compared to learning either from no programming background whatsoever. While you always have to be wary of over-generalizing knowledge, many things transfer and it gets easier with time.

A big problem is how to figure out how the existing system actually works. Maybe you've just joined the project; maybe it's been a while since you touched this module and the docs never existed or are out of date, or maybe it never worked as it should. Where would we be if we treated this as a learning problem (as in "people learning things")? Where would we be if we stopped thinking of code and docs as blueprints and started thinking of them as lessons?

Generalists cannot expect to solve everyone’s problems with a few strokes of the keyboard. If it were possible, someone else would’ve done it already. Instead, the main goal is to identify where the big wins are, without getting lost in minutiae.  Ask "What keeps you up at night?" Since data science is often about making better decisions more quickly, whether it’s through automation or decision support, there is usually something that can be made more efficient.

Speeding up decision making is very often a case of understanding what information people need, and giving it to them in a better way. Dashboards, often maligned for being rarely used and over-requested, can actually be useful in some situations. Other times, giving people context like “similar requests came up X times this week, this is normal but this one here isn’t normal” can lighten cognitive load. In most cases, even the low hanging fruit problems aren’t solvable by a lone data scientist. Charts won’t change the world on their own.

For example, imagine a subscription service where every new subscription is checked over by a human to reduce bad actors from joining a forum. We'd love to block those out quickly, but we also don’t want a high false positive rate because it would hurt the service and anger paying customers.

There are definitely solid, proven data science methods to apply to this problem. Fraud and anomaly detection has a long history, is fairly well understood, and has off-the-shelf parts. But no one has implemented those systems for this team yet because it just wasn’t deemed high enough priority to throw data science effort behind it. Then the generalist comes around and finds that it’s a solvable problem.

A data science generalist should realize that she cannot just implement a spam control system herself. It’s too big of a project with lots of integration into existing systems. But knowing what a spam control system would look like, and applying technical skills let her sketch out how a system might wire into existing infrastructure. Sizing up the problem and the business impact is a value-add in itself. Having visibility and credibility between all the teams helps to align resources across the enterprise. Sitting in the intersection of all these groups of people and being able to communicate with all of them, she can find a way to make people’s lives easier, and everyone wins.

Teams who incidentally generate data during their day-to-day activities often don’t have data science skills. So when helping out a team that doesn’t have access to programming resources, saving time through automation and simpler decision making often jumps to the forefront. This is especially true when the teams get larger, saving everybody an hour of their time, multiplied by the team size, can quickly scale into a huge amount of time (and human frustration) saved.

One last benefit for working broadly is that the generalist will build connections all over the place. There’s all the individual and team connections, which can be leveraged to get stuff done. There’s value in being able to bridge context between teams that might not normally communicating closely.

There’s also all the disparate data sets that could possibly be combined to make newer, even more exiting things. Networks get stronger and more interesting every time we add a new node.

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
