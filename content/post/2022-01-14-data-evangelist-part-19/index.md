---
title: The Data Evangelist
subtitle: "Perspectives on building the data science community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2022-01-14
featured: false
draft: false
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Anna Goncharova for Unsplash"
  focal_point: "Bottom"
  preview_only: false
projects: []
---

I had the pleasure of pitching some new ideas to a big audience in a talk provocatively titled **Data Science for Everybody** this week. I am grateful for the questions posed during the talk and the follow up that continues. 

One message that I struggle to convey is how delivering best-in-class AI solutions requires more than a solo code writer on a laptop. Again and again in Bryar and Carr's book [Working Backwards: Insights, Stories, and Secrets from Inside Amazon](https://www.amazon.com/dp/B08N5LPVY3), they name drop "Jeff" [Bezos] and how "two-pizza" teams have this singular focus on resolving customer pain points and driving input metrics. All across the company there are cross-functional team efforts to remove friction from their customer's experiences. 

During my talk, an audience member Teams chatted "*What should be the starting point for who wants to start to work with data analytics?*" Like most of you all, I certainly have my own opinions. In this blog I'll explore other answers from notable leaders in the field that I respect, comment on a few core collaboration concepts, note valuable upcoming events, and recommend another book. My thesis is that there is a place for everyone to engage here.

Whatever prompted you to read this blog post, I hope that you come away with a handful of useful insights for your own work.

-----
## Core Data Science Skills 

Over this past weekend, Vicki Boykis published her blog post, "[Git, SQL, CLI](https://email.mg2.substack.com/c/eJwtkEtuwzAMRE8T7Wrob3uhRTe9hkFLrKPGlhx90rqnr5wUIIaQSGIwz0LBJabD7DEXcspUjh1NwO-8YimYSM2YJu-MknIcBSPOSMcGNRCfp8-EuIFfTUkVyV7n1VsoPobzgPeDHMnVMNCSjdQKDXpmanQgRM_dMA96VJKKly1U5zFYNPjAdMSAZDXXUvZ8Ee8X_tHq4e3Nz_G4-dzZuLUfTjlvjbJTxiaLL2_5vr7Z1bcX8ebcoIxJJqgSquOdkAyAjRoEc4C67_C4c_hNPxdJt4V3uc65gL2dDiSZL791S6obhDZfzqjPQUs6tb7V4MsxYYB5RfeCUF4on1imBQOmhthNUAzTkjOtWuRe_odulKQelOADJc3ZxXYVjI01FB-WPxqyh_U)." She posits that there are 3 basic “tools” that are essential for working with data, based on her experiences working across several companies and environments. Essentially, these are what someone who’s interested in learning data science today should learn first because they provide portable skills and a foundation for learning other skills that will be relevant for decades to come.

Like Randy Au notes in his [Counting Stuff](https://counting.substack.com/p/skill-windows-into-the-data-world) blog, I also had my doubts initially. Engineers start from calculus and physics, and move from there into laboratories, problem solving, and finally applications. Likewise, data science builds on statistics, AI/ML techniques, programming/computer science, and business communications. Even if any one of us lacks the full depth of domain expertise, we still have to fluidly use skills across all of them. 

There’s quite a bit of academic math theory that we learn, though all the  bits eventually have to find an applied interface with the real world. In the end data science is an applied discipline and needs to manifest itself in real world outcomes. Usually bar S, AKA $.

While some might have no problem learning a bunch of theory up front before touching coding tools, for many others project based learning approaches are more effective. This is where Vicki’s list comes in.

### SQL

The handful of SQL commands open up initial access to almost every data system. It is not really a full language in the strictest sense, and is relatively simple to pick up. People rightly complain about its quirky syntax and the odd dialects that do not port to one other. When a practitioner masters SQL, or a SQL-enhanced system like [**dbt**](https://www.getdbt.com/), they can execute relatively sophisticated data management tasks, including:

- Query optimization on indexes, partitions, row cardinality, and in the case of distributed noSQL data stores, aspects of optimizing workloads for distributed computing

- Creating data schema, including normalizing data and even de-normalizing data for performance reasons in specific contexts

- Learning how engineers and computer systems put data into databases, and observing how the data is a reflection of the business logic. 

So even though many start by learning SQL for requesting data out of a database, it bleeds into other crucial skills. In real life practice we are often re-learning these things on the fly. Optimization naturally happens when working with increasingly larger data sets. 

### Git

Version control is essential for building together as a team, and git is the de facto standard. It’s notorious for being confusing to use beyond the most basic commands for checking in and checking out work. My go-to resource is Jenny Bryan and her team's excellent reference in [Happy Git and Github for the UseR](https://happygitwithr.com/big-picture.html).

In certain data science tasks, like exploratory data analysis (EDA), version control isn’t used as often. On the other hand, the repository management skills are critical in production modeling and data pipelines. Depending on what the day-to-day work content is, one might not actually use git all the time. 

But in addition to merely handling code versioning, learning git opens up access to the underlying open source package codebase and all the tooling that developers use to launch code into production. If/when a developer ever starts putting code into production, or just needs to search for code to check for a metadata flag, they will be relying on these skills. Git is the primary gateway to working closely with engineering.

Through this gateway, data scientists touch the CI/CD systems, submit through code review systems, write tests where applicable, support QA processes, and beyond. A practitioner can’t really play with any of those things until they submit code in the way any other software developer submits code.

### CLI

I take Vicki to mean the command line interface as the typical Linux install that’s Unix-shell-like, though it could also mean Windows Powershell too. The text-only nature of the command line will be intimidating at the start compared to operating systems with graphical abstractions to guide us. But being super comfortable on the command line yields lots of benefits.

Comfort at the command line is the gateway to scripting, scheduling, and automating tasks. Much of the messy glue work that happens in data science effectively grows out of just chaining basic CLI commands together, even with the advent of tools like Airflow that take up some of the work. Diving even deeper into the world of CLI gets into the world of system administration and managing clusters, services and servers.

Everything we do as developers builds on the CLI knowledge: Kubernetes, compiling code, sending code to other servers, load management, looking at what’s going on with servers, committing code, looking at ports, adding files, etc. Having the command line terminal open is a constant throughout my day.

-----
## Collaboration

As mentioned in the introduction, best-in-class solutions require more than a code writer on a laptop. With a data science team, the members absolutely must work together; there's important information that needs to be known about data acquisition, transformations, results of prior projects, and the right way to deploy models.

Delivery speed and customer focus have to be the most important metrics. Today, for the cross functional "two-pizza" team to move faster, they need context, consistency, and venues for secure collaboration.

### Context

Model building is an iterative, try-it-and-fail experimental practice, and it has been true in the past that one data scientist at a time performed this work. A great deal of institutional knowledge is lost if that data scientist doesn't document and make their work searchable by others to build on later. Further, what happens with junior or citizen data scientists looking to jump into a project to improve their skills?

Context includes the knowledge of the data sources that analysts have looked at, how the enterprise addressed the problem in the past, and how prior work informs the landscape. 

Unfortunately, the process of documenting projects, models and workflows can feel distracting when faced with the pressure to immediately move a model into production. Leaders need to support a culture of knowledge sharing so the whole company benefits and the data science COE can build a foundation of expertise and knowledge.

For example, leaders might consider support allocating time to forum where data scientists contribute to the broader knowledge base as part of their standard review and feedback sessions so that collaboration is recognized as an essential principle at the company. Software systems, workbenches, and best practices can help streamline the process of capturing context that can improve discoverability in the future.

Without knowledge management and context, any new employee will struggle with on boarding, slowing their ability to contribute, and teams spend time re-creating projects from scratch instead of adding to previous work.

Building this foundation of knowledge also reduces "critical" person risk. If someone goes on vacation or leaves a project, other team members have the necessary base from which to jump in and keep that project going.

### Consistency

Financial services, pharma, manufacturing, and many other enterprises are going through foundational changes thanks to AI and ML. Many of these industries are also heavily regulated and for an AI project to genuinely succeed, it needs to be reproducible with a clear audit trail.

IT and business leaders need to know there's a consistency to the results that will give them confidence in making the strategic business shifts that AI can facilitate. With so much riding on these projects, data scientists need an infrastructure that gives them full reproducibility from beginning to end.

As data science teams grow and the variety of tools, training sets and hardware requirements becomes more complex, getting consistent, credible results from older projects can be challenging. Robust tools for environment management are a must for growing teams.

For example, if you're working off your laptop as a data scientist and the data engineer has a different version of a library running on a cloud VM, you may see your model generate different results from one machine to the next. Collaborators need a consistent way of sharing the exact same software environments through package managers and development environment templates.

Models evolve over time, and the test performance metrics will start to drift as more information is captured. Thinking of a model as "one and done" is incompatible with a changing business world that brings new customers and needs. The key is to recognize that when the business changes, the data changes, and the best leaders pay attention to refreshing and retraining their models continually.

An inventory of different model versions will help manage the changes and measure performance for different models over time.

### Secure Collaboration

We've argued above how a foundation of prior knowledge accelerates new projects and how we need consistent, audit able results when solving the complex questions that deliver value for businesses today.

We also need a third component.

How do we coordinate cross functional teams, along with IT, operations, and executive leadership, all while keeping the data secure?

How do we bring these different perspectives and ideas together, ensuring everyone is working from a single source of truth, and that this data is secured by scalable services.

Having to rely on a variety of sources just adds unnecessary cognitive load. By using a central cloud-based tool, data science professionals can manage enterprise security and leverage IT best practices.

-----
## Upcoming Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

:star: January 18 [Intro to Supply Chain Design & Forecasting Demand with R](https://www.meetup.com/RStudio-Enterprise-Community-Meetup/events/282384427/) with Ralph Asher and Laura Rose

:star: January 18 [Automating Workflows with GitHub Actions](https://www.meetup.com/data-umbrella/events/282772806)

:star: January 19 [RStudio x Saturn Cloud Meetup](https://www.meetup.com/RStudio-Enterprise-Community-Meetup/events/283202608)

:star: February 1 [Capacity Planning for Microsoft Azure Data Centers](https://www.meetup.com/RStudio-Enterprise-Community-Meetup/events/282661442)

:star: February 8 [Metrics Stores vs Feature Stores](https://www.meetup.com/Data-Science-DC/events/282785487)

:star: February 9 [Retail Analytics & Business Intelligence with Google Looker, BigQuery, and GCP](https://www.meetup.com/Serverless-Toronto/events/281002271)

:star: March 21-24 [NVidia GTC 2022](https://www.nvidia.com/gtc/) AI Developer Conference

:star: April 3-5 [INFORMS Business Analytics Conference](http://meetings.informs.org/wordpress/analytics2022/)

:star: June 9-10 [New York R Conference](https://rstats.ai/nyr/)

:star: June 20-23 [useR!2022](https://user2022.r-project.org/) Online Global Conference

----
## An MLOps Reference Architecture

Data science and analytics teams are nearly always squeezed between increasing deliverables expectations and deadlines. Their billable time is expensive. The pressure can manifest itself in two ways. In one, the company places big strategic bets on consultants like a VC firm would, looking for a single home run among many strike outs. In another, a reference architecture is built to accelerate and support collaborative team execution, to steadily improve the batting average across all teams. 

When an enterprise lacks the skills and architecture, they really only have the VC / consultant path available. Growing and building teams under these conditions, with few tools or guardrails is difficult to say the least.

How can teams tame complexity and live up to the expectations placed on them? MLOps provides some answers. There is no one size fits all, really. Like any other technical solution, MLOps implementations must satisfy project requirements across a wide array of use cases and end points.

For a much more complete introduction to MLOps, refer to [Engineering MLOps](https://mcas-proxyweb.mcas.ms/certificate-checker?login=false&originalUrl=https%3A%2F%2Fwww.yammer.com.mcas.ms%2Fcnhind.com%2F%3FMcasTsid%3D11522%23%2Ffiles%2F1171447521280&McasCSRF=871bc944df891ee02b3ca6f8ce651cae788378700d35e47f5245b02cef760350) by Emmanuel Raj.

### Key Components of an MLOps Solution
A quick summary list of the key components for implementing an MLOps solution:

-	A **version control** system to store, track, and version changes to code, like github.
-	A **version control** system to track and version changes to training datasets.
-	A **network layer** that implements the necessary network resources to ensure the MLOps solution is secured.
-	An **ML-oriented compute resource** to execute machine learning tasks. 
-	Use **infrastructure as code (IaC)** to automate the provisioning and configuration of cloud-based ML workloads and other IT infrastructure resources.
-	An **ML (training/retraining) pipeline** to automate the steps required to train/retrain and deploy ML models.
-	An **orchestration tool** to orchestrate and execute your automated ML workflow steps.
-	A **model monitoring solution** to monitor production models’ performance to protect against both model and data drift. You can also use the performance metrics as feedback to help improve the models’ future development and training.
-	A **model governance framework** to make it easier to track, compare, and reproduce your ML experiments and secure your ML models.
-	A **data platform** like Azure Blobstore to store datasets.

----
## Book Recommendation

<a href="https://www.amazon.com/Alignment-Problem-Machine-Learning-Values/dp/0393635821"><img class="t-cover-img" src="https://images-na.ssl-images-amazon.com/images/I/51FovqGPsKL._SX329_BO1,204,203,200_.jpg" alt="The Alignment Problem: Machine Learning and Human Values"></a>

The Alignment Problem by [Brian Christian](https://twitter.com/brianchristian) is going to be the book that I recommend to everyone coming to the field of machine learning. It’s accessible to the newcomer, but guaranteed to hold a couple of surprises even for veterans.

----
## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-10-29-data-evangelist-part-18/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
