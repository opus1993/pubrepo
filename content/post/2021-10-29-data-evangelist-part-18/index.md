---
title: The Data Evangelist
subtitle: "Perspectives on building the data science community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-10-29
featured: false
draft: true
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: "Bottom"
  preview_only: false
projects: []
---

Writers are always, to some extent, intruding on the patience of readers by asking that you put aside a few quiet minutes to hear us out. As an engineer, believe me, I am sure grateful that you all do. To ask you to indulge me regularly, as I'm doing here, should at least come with a promise to do my best to neither bore you nor hector you. No one needs that.

In a wide-ranging interview recently, our CEO was asked

*What are some of the lessons you learned with your previous roles that you think could have direct application to farmers today? *

> Scott Wine: [First, all the Navy operates on S.O.P.: standard operating procedures. In corporate America we call it standard work. You think about a lot of the farm operations and if they have standard work that they know if somebody's out and somebody fills in that it gets done the same way. A navy warship turns over the entire population of the ship every three years. Yet they don't make mistakes. They don't make mistakes because they have standard work and I think standard work/standard operating procedures would be really good for farmers. ](https://www.agweb.com/news/machinery/new-machinery/qa-cnh-industrials-ceo-scott-wine)



What is a digital community? Does your team and the broader organization you work with have a rigorous data culture?

13 Slack Groups, Countless Meetup channels, 

Invitation-only executive networking gigs are all just marketing scams

Eventa (Gartner)

York Consulting

R4DS

New York R

C3ai and Palantir

Paying Gartner for access to gated community and a status, and then taking advantage of Gartner status

Organizations, especially larger ones, are constantly churning people. Individuals and teams are constantly coming and going. We're not only fighting the passive network forces blocking our brilliant works of pure Truth from reaching people, we're fighting to overcome an [active and constant organizational brain drain](https://counting.substack.com/p/the-many-faces-of-production).

[New power norms place a special emphasis on collaboration](https://hbr-org.cdn.ampproject.org/c/s/hbr.org/amp/2014/12/understanding-new-power), and not just as a way to get things done or as part of a mandated “consultation process.” New power models, at their best, reinforce the human instinct to cooperate (rather than compete) by rewarding those who share their own ideas, spread those of others, or build on existing ideas to make them better. Sharing-economy models, for example, are driven by the accumulated verdict of the community. They rely on reputation systems that ensure that, say, rude or messy guests on Airbnb have trouble finding their next places to stay.


-----
## Heading 1

Vin Vash - career advice on your job hunt. the market is on fire.

"Thought Leaders" page from Benn Stancil


{{<tweet 1455636903852527616>}}

----
## Heading 2

Dont look behind the curtain - Wizard of Oz

https://www.zdnet.com/article/dissecting-c3-ais-secret-sauce-less-about-ai-more-about-fixing-hadoop/

While C3.ai claims to be an AI company, its patented technology is really a platform-as-a-service for the Internet of Things with some fairly standard AI mixed in.

It turns out, the secret sauce is really more about platform-as-a-service, rather than AI per se, which is funny, given that machine learning, a form of AI, is mentioned fifty-five times in the C3 prospectus, while platform is mentioned only once, in the company's self-description: "We believe the C3 AI Suite is the only end-to-end Platform-as-a-Service allowing customers to design, develop, provision, and operate Enterprise AI applications at scale." 

What C3.ai has invented is a set of building blocks for putting together a system to analyze data coming from a variety of signals, including traditional databases, but also Internet signals such as social media, and, perhaps most important, sensors, including the kinds of sensors industrial companies might build into equipment in the field that they want to monitor. 

The building blocks C3.ai makes are tools that developers can access programmatically, and consume on a subscription basis, with some additional metered use.     

The actual artificial intelligence component, at least based on C3.ai's published materials, is fairly routine and nothing special.

The secret sauce is described in two patents that are referenced in the IPO prospectus, U.S. patents number 10,817,530 and number 10,824,634, both of which were granted this year. Both patents describe "Systems, methods, and devices for an enterprise Internet-of-Things application development platform" or simply a "platform." 

"Next-generation IoT applications require a new enterprise software platform," both documents assert.

As the patents both lay out, they are specifically PaaS for the aggregation of data coming from sensors:

The IoT Platform disclosed herein is a platform as a service (PaaS) for the design, development, deployment, and operation of next generation cyberphysical software applications and business processes. The applications apply advanced data aggregation methods, data persistence methods, data analytics, and machine learning methods, embedded in a unique model driven architecture type system embodiment to recommend actions based on real-time and near real-time analysis of petabyte-scale data sets, numerous enterprise and extraprise data sources, and telemetry data from millions to billions of endpoints. 

The patents lay out in detail a handful of the failures of enterprise open-source infrastructure in Hadoop. They note the failure of companies to adopt Hadoop at scale, as indicated by Gartner research. And companies that re-package Hadoop, such as Cloudera, "have failed to integrate their Hadoop components into a cohesive software development environment," C3.ai claims.

The result is that "to date, there is no successful large-scale enterprise IoT application deployments using the Apache Hadoop." It goes on to say that technologies including Cassandra, CloudStack, HDFS, Continum, Cordova, Pivot, Spark, Storm and ZooKeeper are components that should be put together but haven't been. 

"The many market claims aside, a close examination suggests that there are few examples, if any, of enterprise production-scale, elastic cloud, big data, and machine learning IoT applications that have been successfully deployed in any vertical market using these types of components."

And so, C3.ai is creating "a new kind of technology stack."

c3ai-2020-non-linear-classification-example.png
C3.ai's paradigmatic example is shown in the diagram of a multi-dimensional, non-linear classifier. It's pretty standard machine learning stuff, achieved, in this example, using a familiar approach called gradient-boosted decision trees. 

C3.ai

That technology stack, based on the patents, includes heavy use of domain-specific languages, for the purposes of assigning programming object types to sensor data and other resources.

The point is to simplify how massive data sources, and the analytics programs that operate on them, are put together. Using types, and using a model, developers can avoid stitching together all the parts of the program via API calls.

"A type is the definition of a potentially complex object that the system understands," says C3.ai.

In other words, it's kind of like wrapping object-oriented class interfaces around a lot of infrastructure components, so that programmers can make calls to big data in a simpler way. Addressing one type may set off a chain of processes that fetch data from many sensor endpoints, possibly from data stores such as a content management system, combine them, and pass them through an analysis program, for example. 

This typing system, C3.ai claims, is made rigorous by the company having devised models of the business logic of specific industries. Presumably, those industry-specific models produce the types that are used by the domain-specific language to address all the resources that C3.ai has.

All this type work lets C3.ai run data from sensors through a bunch of components for analysis. Something that is referred to as a "continuous data processing component" is basically a wrapper to MapReduce. That MapReduce program can feed data into another component, a machine learning system, to analyze data repeatedly. That can be handy because some sensor data may need to be put iteratively through multiple passes of a machine learning program.

Given all this emphasis on infrastructure, it is perhaps not totally surprising that what turns up as AI in the patents are somewhat mundane forms of machine learning.

The patents refer to the AI as happening within a "machine learning component." That component uses some "state-of-the-art" machine learning libraries, it says, "including public libraries such as those built upon the Apache Spark, R, and Python systems." It includes things like IPython Notebook, the popular sci-kit learn library, and packages in R for such standard machine learning approaches as gradient boosting. 

C3.ai says these libraries are complemented by "custom-built, highly optimized and parallelized implementations of many standard machine learning algorithms, such as generalized linear models, orthogonal matching pursuit, and latent variable clustering models." 

All those things are machine learning techniques that have been around for ages. In fact, the paradigmatic example of machine learning provided by C3.ai sounds, on its face, like something out of a machine learning textbook. 

The company discusses using machine learning to tell if someone is committing electricity theft by looking at data from electric meters. Presumably, it's the kind of application that a large utility customer would need help with. 

The problem is one of creating a classifier that can take in several different data points from the meter and produce a value for whether there is theft going on.

The description sounds daunting,

Detecting electricity theft is a highly non-trivial task, and there are many separate features that may increase or decrease the likelihood that a particular meter is exhibiting the signs of a user stealing energy […] Each meter can then be viewed as a point lying in "n-dimensional" space […]

This, however, is no different from any machine learning description. In the example problem, electricity theft, the solution is to apply the standard technique of gradient boosting to a set of 756 features to divide the data into hyper-planes of positive or negative examples, theft or no theft. 

As C3.ai indicates, the real art to this stuff is applying it at high volume. The company describes one such classifier, a gradient-boosted regression tree, as having "a weighted combination of 70 trees, each with a maximum depth of 5 nodes."

In other words, in the world of applied AI, C3.ai is dealing with tons of data. The company has gained valuable experience in how to take routine machine learning models, such as gradient boosting, and apply them with the kind of care needed to handle complexity.

That's no small accomplishment, though it may not be breaking any boundaries in the fundamental development of machine learning itself.

Still, applying AI at scale promises to be a very vibrant market.

Siebel, in an interview a week ago with ZDNet's Larry Dignan, said that customer relationship management, including both marketing and sales automation, will be one of the biggest markets for AI in the coming years, according to data from consulting firm McKinsey & Co. 

"They predict the largest impact on AI will be on sales and marketing and customer service, delivering up to $3 trillion of value per year," said Siebel.

----
## Why open / transparent?

A hypothetical (but realistic) conversation:

Me: You wanted to see me?

General Manager (GM): Yes, come in. I wanted to discuss the BI/DW budget for the next fiscal year.

Me (nervously): OK, what's on your mind?

GM: In your view, how did things go with our BI initiatives this fiscal year?

Me: Overall, I would say excellent. Our on-time data delivery metric dramatically improved, we delivered new data assets to Logistics that allowed them to realize millions in savings, and we completed training all users on Qliksense.

GM: That's what I thought you would say. It's all true and the team has done a great job. However, I'm confused by what's going on in budget planning.

Me (more nervous now): Oh?

GM: Yes, you would think that with all the successes that our customers would be happy to fund our budget requests. However, many are threatening to pull funding.

Me (shocked): What!?

GM: Yes, apparently there's a widespread belief that the data in the data warehouse is bad. Apparently, everyone is reporting different numbers in the business review meetings and the executives have lost confidence in the DW.

Me (saying the following like Jerry Seinfeld says "Newman"): Qliksense!

As it turns out, rolling out self-service BI makes the work in BI/DW harder, not easier.

The reason - lack of data literacy in both business leadership and the folks using the visualization tools. Learning how to use Qliksense alone isn't enough to realize value.

The BI team elected to give the user community the freedom to do almost anything. Want to create your own reports? Done.

The result was pure chaos.

We had what I referred to as “gremlin reports”: they were multiplying like crazy.

As an example, one year after launch we had over 300 different user generated versions of “open orders”.

Many used the wrong filters, pulled in the wrong fields, and/or didn’t deliver the information they thought it did.

Imagine the chaos that ensured when each person came into a meeting with different open order numbers using what they thought was the “same” criteria.

Now multiply that chaos across areas like sales, supply chain, and so on.

That’s a playbook to have your data and analytics solutions implode and lose credibility, no matter how well designed and correct it is. It becomes a perception issue.

The ironic thing was the information available to the users was good and credible. The challenge was they didn’t know how to properly use the tools (and power) we had given them.

I realized this situation wasn’t their fault. We had put them in a position to fail.

Eventually we removed the self service report creation capability and instead offered reporting “on rails”.

Despite this, the damage had already been done. Very few people ended up trusting/using the system.

This was early in my career, but the lessons learned are still extremely relevant today as I have seen this same playbook unfold in different companies.

Point being, before you elect for a “self service report creation” model, be sure you understand the initial and ongoing support and training that is needed to make this deployment model work.

Having lived in both a self service and more governed model, my vote is for a clean, concise set of content to reduce complexity.

Make sure everyone understands that core content so they are confident they are speaking the same language and comparing similar figures.

Self service report creation might not sound so great after you consider the ongoing work and potential risk it introduces.

Remember - Just because you can give everyone that power doesn’t always mean you should.

----
## Heading 4

[EXECUTIVE BOARDROOM](https://www.evanta.com/cdo/chicago/2021-chicago-cdo-executive-summit#agenda)

<iframe src="https://www.linkedin.com/embed/feed/update/urn:li:share:6857335832857186304" height="719" width="504" frameborder="0" allowfullscreen="" title="Embedded post"></iframe>

Join, Andela’s VP of Data and Analytics, [Patrick Hennessey](https://www.linkedin.com/in/hennesseypatrick/) and your peers to discuss:

- Preventing the pitfalls from traditional data warehouse models
- Identifying why the phrase “data-driven culture” can be misleading
- Overcoming the aversion to challenging problems and experimentation


----
## Heading 5

1970's Bell Labs recruiting video 

It's difficult to overstate ATT [Bell Lab's hegemony](https://en.wikipedia.org/wiki/Bell_Labs) in engineering and technology, up through the 1984 AT&T break-up forced by the [US anti-trust authorities](https://en.wikipedia.org/wiki/Modification_of_Final_Judgment).

{{<youtube ZHBHEWyZ1Xw>}}

Researchers working at Bell Labs are credited with the development of radio astronomy, the transistor, the laser, the photovoltaic cell, the charge-coupled device (CCD), information theory, the Unix operating system, and the programming languages B, C, C++, S, AWK, and others. 

The programming language S, was developed by John Chambers, Rick Becker and Allan Wilks while at Bell Labs that took form between 1975-76, created to "turn ideas into software quickly and faithfully." Up to that time, much of the statistical computing was done by directly calling Fortran subroutines; however, S was designed to offer an alternate and more interactive approach. In late 1979, S was ported from its original GCOS platform to UNIX, which would become the primary platform to this day.

-----
## Heading 6

https://sloanreview.mit.edu/article/progress-toward-the-intelligent-enterprise/


----
## What New Power Looks Like

<div style="max-width:854px"><div style="position:relative;height:0;padding-bottom:56.25%"><iframe src="https://embed.ted.com/talks/jeremy_heimans_what_new_power_looks_like" width="854" height="480" style="position:absolute;left:0;top:0;width:100%;height:100%" frameborder="0" scrolling="no" allowfullscreen></iframe></div></div>


-----
## Why is the CDO such a short-tenure, tenuous role?

How much of the role is actually Chief Business Transformation officer? Are CDOs responsible for shaping coummunity and company data culture?

<iframe src="https://www.linkedin.com/video/embed/live/urn:li:ugcPost:6858794403562172416" height="284" width="504" frameborder="0" allowfullscreen="" title="Embedded post"></iframe>

----

## Events this week

### Microsoft Ignite

Should you attend conferences while you’re trying to break into Data Science? Yes, and not just the well known Machine Learning conferences.

Microsoft is running **Ignite** this week. It’s worth checking out because it offers a different perspective than the other two cloud behemoths, Google and Amazon. The latter two build for companies with Data Science teams that run like Ferraris (top 10%). Microsoft builds for the pickup trucks and SUVs (the other 90%).

MS works to integrate with legacy everything. They'll run alongside your Oracle dB and let you port existing apps built in C. They've seen things other companies NOPE out of quickly.

Their product roadmap is a great reality check on the 2-5 years out content that dominates most conferences. Google and Amazon release with the mindset of “We’d love to see what you’ll build with this.” Microsoft’s mindset is “Here’s what people are building with this.”

Both mindsets are important for people breaking into Data Science. You want to direct your career and learning path towards what’s next. You want to write your resume and interview around what’s happening right now.

### R/Pharma 2021



### Big Data Ignite 2021


### NVIDIA GTC



-----
## Upcoming Events

These are opportunities to engage and learn about analytics, data science, and AI from peers. Meetups and other talks are so important because you can learn so much from the community and the people that are actually doing it today.

:star:️ September 6-10th [EARL Conference 2021](https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

:star: September 8-10 [New York R Conference](https://twitter.com/rstatsai)

:star: September 14-16 [SAE COMVEC](https://www.sae.org/comvec)

:star: September 16-17 [INFORMS Midwest Regional Analytics Conference](http://meetings2.informs.org/wordpress/regional-analytics-midwest2021/) Chicago Chapter hosting, virtual event

:star: October 6 [IIA's 2021 Fall Virtual Analytics Symposium](http://iiasymposium.com/index.php/registration/)

:star: October 24-27 [2021 INFORMS Annual Meeting](http://meetings2.informs.org/wordpress/anaheim2021/)

:star: January 5-8, 2022 [CES 2022](https://www.ces.tech/) in Las Vegas, Nevada

----
## Book Recommendations

<a href="https://www.amazon.com/Deep-Learning-Illustrated-Intelligence-Addison-Wesley-ebook-dp-B07W585JGG/dp/B07W585JGG"><img class="t-cover-img" src="https://images-na.ssl-images-amazon.com/images/I/4149v-5U5SL._SX381_BO1,204,203,200_.jpg" alt="Deep Learning Illustrated: A Visual, Interactive Guide to Artificial Intelligence"></a>

[Jon Krohn](https://www.linkedin.com/in/jonkrohn/) is the chief data scientist at [Nebula](https://nebula.io/). He leads a flourishing Deep Learning Study Group, hosts a long running [Data Science podcast](https://www.youtube.com/channel/UCMbtqTGdSsxYYhhTpV4lSTQ), and teaches his Deep Learning curriculum at the NYC Data Science Academy. Jon holds a doctorate in neuroscience from Oxford University and has been publishing on machine learning in leading academic journals since 2010.

This book is an approachable, practical, and broad introduction to deep learning, and the most beautifully illustrated machine learning book on the market.

----
## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-08-27-data-evangelist-part-17/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
