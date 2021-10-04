---
title: The Data Evangelist
subtitle: "Perspectives on building the data science community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-08-27
featured: false
draft: false
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: "Bottom"
  preview_only: false
projects: []
---

I was asked recently for my views on digital literacy skills development. Department heads want their rising stars :star2: to be on the right development track. [Monica Rogati's 2017 piece](https://hackernoon.com/the-ai-hierarchy-of-needs-18f111fcc007) with her Hierarchy of Needs illustration is referenced pretty widely in the data science community in this context to explain what skills map to which roles. Let's take a little different approach than Demetri does here, though:

{{<tweet 1428426873697095691>}}

Tom Davenport's "Purple people" articles [here](https://www2.deloitte.com/us/en/insights/focus/cognitive-technologies/artificial-intelligence-purple-people.html) and [here](https://sloanreview.mit.edu/article/to-succeed-with-data-science-first-build-the-bridge/) each emphasize that business engagement is still at the core of the mission, so we must work to embed the skills and tools as close as possible to the functional teams making the business decisions. Rule #1, after all, is to be customer centric.

Dr. Mike Chapple, in his Cloud Analytics course in the [Notre Dame MSBA program](https://mendoza.nd.edu/graduate-programs/business-analytics-chicago-msba/), observes how business projects moving IT workloads from on-premise datacenters to cloud services often become conflated with delivering analytics use cases. Today, few will tolerate sending tickets to a central IT database team inbox for custom reports, where-ever they sit. The momentum is towards the decentralization of data teams, and further towards the concept of the **Data Mesh** (more on this in a moment). 

This is a rapidly evolving space. Leading organizations have added other roles like [Data Architect](https://www.jigsawacademy.com/blogs/data-science/data-architect), [Data Catalyst](https://www.linkedin.com/jobs/view/data-catalyst-at-john-deere-2555701854/), and even [Analytics Engineer](https://www.northeastern.edu/graduate/blog/what-is-an-analytics-engineer/) to better address the specific expertise required. And higher in the org chart there are a [number of critical strategy and leadership roles](https://jimgruman.netlify.app/post/2021-03-26-data-evangelist-part-5/) that I've discussed previously.

**WE** still need to be responsible for the data science and analytics strategy, the work breakdown, and ultimately the decision making. This post highlights recent talks and posts by experts in the field. They include Bar Moses, Sean Taylor, Ben Stancil, Emily Riederer, Anna Filippova and others. Whatever prompted you to read this, I hope that you come away with a handful of useful insights for your own work.

-----
## The Data Mesh

Jon Krohn recently interviewed [Barr Moses](https://twitter.com/BM_DataDowntime), the CEO of [Monte Carlo data](https://www.montecarlodata.com/) on the shortcomings of data teams today and the challenges they face. 

{{<youtube LBoetaid78s>}}

She notes that at one time a typical analyst would sit in [finance](https://wraptext.equals.app/every-analyst-is-a-finance-analyst/) and tally figures on internally available transactions against a departmental budget, monthly or quarterly. Control and movement of data was simple. As analytics is scaled out into new use cases across all of the other functional groups, the issues include:

- Self-service platforms do not handle the massive number of data sources, batch and streaming, structured and un-structured, from both inside and outside of the enterprise. 
- With the complexity of pipelines, there is a lack of trust as many are poorly orchestrated and not fresh or not well documented.
- The rise of many new personas working with rich datasets outside of IT and finance that need data to fulfill their functional missions.

With an eye on doing digital *well*, we return to the central question: How do we actually work with data? Whatever worked before is not going to cut it going forward.

The original [data mesh](https://martinfowler.com/articles/data-monolith-to-mesh.html) paper dates from 2019 and is a pretty robust set of architectural requirements. In a nutshell, it adopts concepts from software engineering, where distributed systems are deployed with mandated standards and norms, allowing for de-centralized ownership and responsibility while pushing the competencies out away from any central team. Self-service, whatever that is, only works if data is assured to be fresh, correct, and reliable (more on this later).

Unfortunately, the **data mesh** demands a new organizational philosophy, and requires what amounts to the role of a data product manager to coordinate service level agreements (SLAs) between members for participation in the shared data lake and compute space. Ultimately, though, having good tools dramatically lowers the friction in the interfaces between technical and non-technical users and accelerates data maturity. 

----
## Building Maturity

Adapted from [Sean Taylor](https://twitter.com/seanjtaylor)

As a leader, the most important skill you can have is the ability to get a big group of people to agree to working on the same thing for an extended period of time. The second most important is coordinating the effort of all those you convinced so that it scales well with the number of people.

To some extent, we all harbor the conceit that alone we could do something really amazing. But all the most impressive stuff is accomplished through monumental coordination of talent and labor. Organizations are the best technology we've invented as humans.

We get so frustrated when a big group of people cannot make progress on a problem, even if they all care about it. We've *seen* groups of people succeed in other contexts. Why is the effort of *this* specific group of people not coordinated and scaling well?

I am recognizing how organization theory matters now, more than ever. A useable implication of this worldview is that the most impactful thing you can do today is ensure that it's desirable and easy for others to build on top of your work. To see why you're doing it and join you in working on it.

----
## A Data Validation Ecosystem

![](./blogging.svg)

Data quality monitoring is an essential part of any data analysis or business intelligence workflow. As such, an increasing number of promising tools (i.e. dbt, datafold, Soda, Great Expectations, and Monte Carlo) have emerged as part of the [Modern Data Stack](https://moderndatastack.xyz/) for robust orchestration, testing, and reporting.

In this [short post](https://emilyriederer.netlify.app/post/data-valid-lightweight/), Emily Riederer proposes a lightweight system that leverages R, GitHub Actions, and Slack. For many organizations, data engineers may find that these "right-sized" solutions achieve the best balance. 

----
## Analytics vs Engineering: a false dichotomy

Adding the word [Engineer to the word Analyst](https://locallyoptimistic.com/post/analytics-engineer/) was a hot topic in 2019. On that theme, [Anna Filippova](https://twitter.com/anna_fil) responds to the Tom Davenport articles with her post [We the purple people](https://blog.getdbt.com/we-the-purple-people/). She writes that

*Adopting a modern data stack goes hand in hand with some serious rethinking of the [role of data humans in an organization](https://wraptext.equals.app/every-analyst-is-a-finance-analyst/). A tell tale sign of this happening: teams adding the word 'Analytics' behind a growing list of business functions like Finance, Product, Marketing, Engineering, Operations, Sales, Support...*

*Analytics* **is engineering**.

*Success in modern software engineering isn't measured by technical complexity but by clarity, reliability, agility and impact — it is a collaborative practice, grounded in an ecosystem of open tools that enable automating the rote mechanics and focusing on the higher order problems. Good analytics isn't measured by the complexity of the methodology, but by the impact of the insight. Analytics is ingenuity. It is finding something novel, and saying — "Oh, now that's interesting!" – and then turning it into a meaningful abstraction to help others see what we see.*

So purple teams need purple tools, to move with urgency and agility.

She writes: *Purple people aren't interested in solving the same problem over and over again. They'd like to do it once, learn a whole ton, and then automate it for everyone else. Purple people will therefore be the organizational champions for technology that reduces time to insight for everyone else. We are already seeing a shift in our industry towards automation and abstraction in [MLOps](https://towardsdatascience.com/ml-ops-machine-learning-as-an-engineering-discipline-b86ca4874a3f) (e.g. DataRobot, AzureML Studio) and Analytics (e.g. Sisu, ThoughtSpot) — solutions that represent data paths well traveled. These tools aren't optimizing for purple people directly, but purple people get excited about them because they help everyone move up the stack and refocus on solving new problems.*

The future of purple tools is open source.

*The day to day of what a purple team works on will always look different — it's shaped by a combination of the business problem that needs solving, the blend of purple experiences that lend themselves best to the problem, the state of tools in the modern data stack, and the reusable abstractions that already exist in the ecosystem. Purple people are frequently first to a problem — and first to a solution — in their respective organizations. This means that as we develop more purple people, they will want to build more and more abstractions, helping others move up the stack in the process.*

*The data stack of the future will make sure these abstractions are modular, reusable, that they are able to integrate flexibly into many scenarios, and that we share them with one another. This means continuing to make the purple parts of our data stack open in the same way all of the foundational tools and frameworks in a software engineer's toolkit are open — to foster collaboration, remixing and innovation. The foundation of our data ecosystem began with open source tools —  Databricks, PyTorch, Pandas, NumPy, RStudio, Jupyter... As we all move up the stack and stand on the shoulders of these giants, we continue to create space for purple people to do what they do best — make our data solutions better in new and exciting ways.*

So the data stack and the skill sets we build must enable us to spend less time engineering, eliminate the gatekeeping, assure that the security is built in from the start, and open up more time for innovating. An open stack is not built exclusively for a particular set of practitioners or to solve a particular problem. Rather, building a stack and the skill sets that support the integration of modules provide the flexibility to solve new types of problems as they emerge. 

----
## The North Star for the Modern Data Experience

[Benn Stancil](https://twitter.com/bennstancil) publishes short articles on Substack on analytics topics. Subscribe and buy him a coffee.  In his [gerrymandering](https://benn.substack.com/p/gerrymandering) piece, he notes that historically, the front end consumption layer’s architecture looks something like the diagram below. Data is used by two groups of people, bifurcated along an arbitrary technical boundary. One group, typically represented by analysts, data scientists, and engineers, use SQL, Python, and R to answer [strategic questions](https://benn.substack.com/p/big-whiff). The second group, vaguely defined as [business users](https://benn.substack.com/p/self-serve-shibboleth), work in code-free BI platforms backed by data models pre-built directly into the tool. 

<img src="https://cdn.substack.com/image/fetch/w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F04a63431-bf36-4235-84c4-eb34a0378be3_1788x800.jpeg" data-attrs="{&quot;src&quot;:&quot;https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/04a63431-bf36-4235-84c4-eb34a0378be3_1788x800.jpeg&quot;,&quot;height&quot;:651,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:116222,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null}" alt="">

There’s a problem: This isn’t how information is actually consumed. The line between BI reporting and analytical research isn’t a hard line; it’s a fluid, shifting continuum. As Anna Filippova notes above, we have to “put aside skillset dichotomies, and learn to feel comfortable in the space between.” 

In Stancil's [The Modern Data Experience](https://benn.substack.com/p/the-modern-data-experience), he writes that to most people, the modern data stack isn’t an architecture diagram or a gratuitous think piece on Substack. It’s an experience, and often, it’s not a great one.

*It’s trying to figure out why growth is slowing before tomorrow’s board meeting; it’s getting everyone to agree to the quarterly revenue numbers when different tools and dashboards say different things; it’s sharing product usage data with a customer and them telling you their active user list somehow includes people who left the company six months ago; it’s an angry Slack message from the CEO saying their daily progress report is broken again.*

Our reaction as engineers is to add more tools and make even more elaborate data maps. Our other scapegoat is “culture,” loosely defined as some combination of the skills we have (or don’t have), the organizational structures of our teams, privileged access to licenses for tools like Matlab and Qliksense, and squishy terms like data literacy. 

If people aren’t excited about the future we’re promising them or are put off by work required to be “data driven,” we can’t just ask them to please get on board. We have to earn their enthusiasm. To do that, the modern data stack isn't enough. We have to create a modern *data experience*.

Stancil proposes a set of North Star principles for the modern data experience, that:

- ...enables everyone to do their job rather than asking them to be an analyst.
- ...merges BI and data science.
- ...makes status and trust explicit. (see the Barr Moses video above)
- ...remembers what we’ve learned. (see Sean Taylor above)
- ...governs business logic globally.
- ...doesn’t communicate in only tables. (the future is nested JSON)
- ...builds a bridge between the past (yes, that's Excel) and the future.
- ...is elastic. (no pausing to ask for more licenses.)
- ...is a melting pot. (in the community, come as you are.)

-----
## How to Manufacture Feelings

Suspend all disbelief for a moment and, at some point in the distant future (i.e. a Star Trek scale future), 

- imagine a complete project that perfectly models the entire business. The model accounts for every conceivable metric and every possible dimension you might group by. If a question can be asked, it can be answered in a single pre-built view. The catch is that you have to choose the right mix of dimensions and measures from a list of thousands of options.

- imagine an analytical (and automatically updating) Wikipedia. Outside of approved analysts, nobody can create new articles, but the encyclopedia is so rich that there’s rarely a need for new content. Nearly everything that people ask is already answered. All people have to do is search for it.

- imagine a room in which your office maintains a physical library of charts and graphs, bound together in paper volumes and stored in neatly organized shelves. When people have a question, a tiny card catalogue directs them to the answer’s exact address.

- imagine a code interface, where you type what you want and it gives you the data you need. Though you can’t converse with it like you would a person, it uses a simple intuitive language built for easily extracting metrics. The interface is full of helpful features that guide you through your inquiry, offering tips that correct your syntax and show you what data is available. 

- imagine a code interface that’s more abstract, though still rooted in English. While it’s got a steep learning curve, it’s structured and standardized, and there are tons of resources available to help you learn it. Once you’re versed in how it works, you can ask nearly any question of it, including things that nobody else has ever thought of before.

Are any of these self-serve? Are all of them?

One way to answer is creating a list of “self-serve requirements,” and seeing how many boxes each option checks. Some might even pull the latest Gartner report out :flushed:. But if you’re like me, that’s not how you think about it. For each idea, we each imagine ourselves using it. 

Do I think I could use it without asking for help? 

Was it sufficiently painless? 

Would I trust the answer I got from it? 

Our answers to those questions really aren’t objective, and are fully dependent on the skills we have, the interactions we’re comfortable with, and the technologies we trust. Companies are bloated with initiatives that over promise and under deliver.

As analytics teams, we have lots of paths to solve problems, and we get to choose which best fits what we want to create and what other people at our company want to consume. If we don’t want to build and support one version, or people aren’t comfortable interacting with another version, so be it. There are plenty of other ways to solve the problem. 

If people love Excel, self-serve can be a OneDrive folder of regularly updated CSVs. If they love MS Teams, self-serve could be web-hook alerts posted to curated chat channels. If drag-and-drop tools aren’t well adopted because people feel overwhelmed by them, self-serve can be a handful of well-organized dashboards that answer the most common questions. If people constantly request metrics, self-serve can be a query interface into a metrics layer. If analysts don’t want to rebuild messy analytical work as BI dashboards, self-serve can be a few tightly-governed tables and a bit of education on how to write basic statements in SQL.

So often, as data teams, we chase the self-serve experience that we think we’re supposed to build. We should be more critical of that assumption, and chase the self-serve experience that makes our clients feel most at home.

----
## Enterprise Data Skills Training 

Let's come full circle then on skills development and what individuals need to know to grow organizational capabilities. 

Step 1 is sponsoring and engaging communities of practice where practitioners meet frequently and share what they have learned, at any level. Yes, the goals include making Excel users into better Excel users. Making the small jumps to topics like SQL and data visualization are so much easier with an MS Teams book club or MS Teams chat room support network. Generally speaking, open source tools are free and accessible and available immediately to anyone. Create something simple like a Shiny App, an R Markdown document, or an AngularJS animated graphic. Share it. Get feedback.

Consider joining the [R4DS community](https://www.rfordatasci.com/) on Slack. The resource is free. They offer channels that serve as help desks, birds-of-a-feather industry conversation rooms, and chapter-a-week virtual book clubs. 

Read. I curate [a list of useful books, courses, and expert blogs](https://jimgruman.netlify.app/post/education-r/). Most are free. These could be departure points for your own learning journey, starting from any point. My hope is that you take and copy sections for sharing with your own community of practice.

On-line programs like [DataCamp](https://learn.datacamp.com/) and [many others](https://github.com/Chris-Engelhardt/data_sci_guide) are self-paced and not expensive. In my case, I found myself needing to journal on what I had just done to retain and find the resources later. Be aware that some of the material is stale. 

[Coursera](https://www.coursera.org/specializations/jhu-data-science)'s catalog is broader. The Roger Peng / Jeff Leek / Brian Caffo series on data science has an enrollment of 438,000+. Some of it is re-purposed college lecture media. Google also offers a new [professional Data Analytics credential](https://grow.google/certificates/) through Coursera, and the material is fresh and very relevant. Google Collab is a nice cloud compute resource for teaching, and for those that want a sandbox to try concepts, Google owns Kaggle. 

Matt Dancho's [Business Science](https://www.business-science.io/) is very good. It's hosted on the Teachable platform. His focus is very much on solving immediate business challenges. I am currently subscribing to his weekly "Learning Labs Pro" and Python materials. 

Brandon Rohrer's [End to End Machine learning](https://end-to-end-machine-learning.teachable.com/) (also on Teachable) is also worthwhile. Brandon's program covers more of deep learning, in python. There is foundational math ML material here for engineers in vision systems and speech.

----
## Recruiting Talent 

The Burtch Works Recruiting team conducts surveys with data professionals and recently had this to say about [working with the latest and greatest technology](https://www.burtchworks.com/2021/08/24/why-are-so-many-data-scientists-data-engineers-leaving-their-jobs/).

*Along the same lines as career growth and the other pain points mentioned previously, we know that data scientists, analytics professionals, and data engineers are very concerned with the importance of the technology stack and/or the applications that they’re working on for the business. This helps advance their skills and keeps them on the “cutting edge” of the industry evolution, which also makes your team better equipped to deal with new challenges.*

*Also, we know that strong data science and analytics talent will want to work on interesting or important projects and applications that “move the needle” for the business.  Clearly articulating the impact team members have on their company is an important best practice for engagement. This is a big piece when it comes to data professionals considering a career move and finding ways to address this can help decrease attrition.*

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
## Book Recommendation

<a href="https://www.routledge.com/Supervised-Machine-Learning-for-Text-Analysis-in-R/Hvitfeldt-Silge/p/book/9780367554194"><img class="t-cover-img" src="https://images-na.ssl-images-amazon.com/images/I/41y5DvIzBFS._SX314_BO1,204,203,200_.jpg" alt="Supervised Machine Learning for Text Analysis in R"></a>

An **HTML version** of the text can be found at [https://smltar.com/](https://smltar.com/).

This book focuses on supervised modeling for text, using it to make predictions about the world around us. Text data contains latent information that can be used for insight, understanding, and better decision-making, and predictive modeling with text can bring that information to light. Natural language must be dramatically transformed to a machine-readable, numeric representation to be ready for computation. This book explores typical text preprocessing steps from the ground up, and considers the effects of these steps on models. This book covers categories of supervised machine learning that can be used with text data from regularized linear models to deep learning models, including how to tune and evaluate models.

----
## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-08-13-data-evangelist-part-16/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
