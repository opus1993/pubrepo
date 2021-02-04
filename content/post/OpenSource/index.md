---
date: "2020-03-24"
diagram: true
image: 
  caption: 'Image credit: [Thinkstock](https://images.techhive.com/images/article/2016/05/open_source_keyboard-100659887-primary.idge.jpg)'
  placement: 1
markup: goldmark
math: true
title: Open Source Is Good for Business
author: Jim Gruman
projects: []
slug: Open Source
categories:
  - Open Source, R
tags:
  - Open Source, R
draft: true
---

Inspired by:
> Ben Balter's [6 motivations for consuming or publishing open source software](https://opensource.com/life/15/12/why-open-source)

> Gordon Shotwell's [Why I use R](https://blog.shotwell.ca/posts/why_i_use_r/) 

> Tina Amirtha's [Why The R Programming Language Is Good For Business](https://www.fastcompany.com/3030063/why-the-r-programming-language-is-good-for-business)

(August 2020 update) Recommended Reading:

> Nadia Edhbal's [Working in Public, the Making and Maintenance of Open Source Software](https://a.co/hAhGgvA)

----

Businesses large and small are embracing open source solutions like `Linux`, `Spark`, `Python`, `GeoMesa`, and `R` for more and more of their software functions. Over time it has become increasingly clear that price is not the only advantage. If it were, companies that adopted open source solutions during the Great Recession of 2008 would have switched back to the expensive proprietary stuff as soon as conditions began to be eased, and that's clearly not the case. 

The array of open source software solutions available is huge and relevant to all enterprises - corporations, non-profits, academia, and government agencies. As software has become a critical component of modern economies, open source communities have sprung up to fill the needs. Open source software is increasingly transforming everyday life, from womb to grave. 

One example: With petabytes of data at hand, businesses are trying to figure out the best way to understand their customers and themselves. But using Excel pivot tables to analyze massive quantities of information is absurd, so in the recent past companies would invest in a commercially available, proprietary, tools like `SAS` to harvest business intelligence.

But `SAS` is no match for the open-source tools that pioneering data scientists use in academia, built largely on `R`. The `R` programming language environment is at the cutting edge of data science, supported by a very large, global community, advancing the very latest in analysis tools. And the rapid evolution of `R` and a wide variety of other open source tools is driven in large part by community-driven open source development advantages. 

An outline of several open source advantages:

## Microeconomic motivations

**Lower total cost of ownership:** Between the purchase price of software itself, on-going support charges, ongoing upgrade expenses and the costs associated with being locked in, proprietary software takes more out of the business than most users probably even realize. And for what? Open source software yields a lower total cost of ownership when compared to closed source and proprietary alternatives. Adopting open source software generally has a lower up-front cost because the software often comes at no cost or relatively low cost, and shifts the investment focus from licensing to customization and implementation. Additional costs like training, maintenance, and support are sunk. What makes open source unique is that there is no fee for the right to use the underlying intellectual property.

| Cost | Open source | Proprietary |
|---|---|---|  
| Licensing | No | Yes |
| Implementation | Yes | Yes |
| Maintenance | Yes | Yes |
| Support | Yes | Yes |

**Given enough eyeballs, all bugs are shallow** (Linus's Law): Empirically, open source [tends to produce better quality software than its proprietary or alternative counterparts](https://dwheeler.com/oss_fs_why.html). With closed source software, the only developers that can potentially detect, diagnose, and resolve software bugs are those that happen to be employed by the company that publishes the software (or the arms-length contractor they paid to build it). Open source provides three advantages here: first, the opportunity to tap the knowledge of the world's best developers, not just those on one organization's payroll. Second, the number of potentially contributing developers and thus the potential knowledge pool is orders of magnitude larger. Finally, open source software gets adapted in variety of use cases, not just the one the publisher originally intended, surfacing bugs and edge cases much more rapidly than traditional QA processes.

**Modern software development practices:** Open source software is more than simply "published" code. You'd be hard-pressed to find an open source project that follows outdated command-and-control development philosophies. By virtue of being distributed and unburdened by technical debt, open source projects all but necessitate modern software development workflows. These workflows are electronic (meaning process is naturally captured and exposed), asynchronous (meaning decisions are time and location agnostic), and lock-free (meaning contributors can rapidly experiment without prior approval). These three workflow characteristics yield more rapid development cycles and more frequent releases without sacrificing quality.

**Open source is the future:** There is no startup today worth it's venture capital funding without being based, at least in part, on open source tools. Open source isn't a fad. Open source is how modern organizations, and increasingly more traditional organizations, build software. It's becoming exceedingly challenging to make the argument that five-or-ten years from now the technology landscape is going to be less collaborative and more closed. Even Microsoft, traditionally one of the biggest opponents to open source, has recently open sourced their primary development framework (along with Apple, Facebook, and Google). Today, the largest names in technology, from IBM, to SAP, to Adobe actively participate in the open source community. It's inaccurate to say that "open source is the future." Open source has already won.

**Patch on your own schedule:** So long as software is written by humans, bugs and security vulnerabilities are inevitable. When a vulnerability is discovered in a proprietary software project, developers have to wait for the workday to begin in the company's timezone, for meetings to be held, tasks delegated, and code written, all before overhead teams like legal, sales, and marketing have to coordinate how to get the fix into the next regularly-scheduled release. For proprietary software, bugs and vulnerabilities affect the bottom line, and thus there's a disincentive to make details widely publicized. With open source, not only can leaner, more agile, non-profit-oriented organization move faster, since all have access to the source code, developers can often apply fixes, both large and small, at the developer's convenience, not at the convenience of the publishing organization's release cycle.

**Upstream improvements:** When consuming open source software, it's in your best interest to contribute back. Contributions can be in the form of reporting bugs, or even submitting proposed fixes. Since software is written by humans, it's highly unlikely to be perfect, and even if so, likely doesn't satisfy every use case. Rather than forking the project and implementing changes into your own version (closed source), submitting bug reports and improvements upstream, open source allows the consumer to more easily continue to benefit from the subsequent fixes and improvements submitted by others.

**Interoperability:** Open source software is much better at adhering to open standards than proprietary software is. If interoperability with other businesses, computers, and users has a high value, and B2B parties don't want to be limited by proprietary data formats, open source software is definitely the way to go.

**Auditability:** With closed source software, there is little but the vendor's claims assuring that they're keeping the software secure and adhering to standards. It's basically a leap of faith. The visibility of the code behind open source software, however, means all developers can monitor compliance and be confident.

Finally, **Shifting development from low-value work to high-value work:** In open source communities we often hear that all the easy problems have already been solved. Blogging, content management, and operating systems are all problems with established (and mainstream) open source solutions, to name a few. While your developers could spend their time reinventing wheels that the open source community have already perfected, it's far preferable to use the worlds best wheel, especially when that wheel comes at no cost to you. This frees developers up to work on yet-unsolved challenges, the types of challenges that are unique to and add value to your organization's mission. Why not stand on the shoulders of technology giants?

Taking the matter of software updates further, when a proprietary application stops being developed, it's not uncommon for its updates to stop as well. With open source software, interested parties can fork or adopt the code for a given application and continue releasing updates. 

Another significant reason to use open source software is to prevent vendor lock-in. For example, let's say the company is using a proprietary publishing application. One day, the company releases a new version and explains that going forward, older file versions for the application won't be supported by the new version. This means if you have an older version of one PC, and the latest version on the second PC, they can't exchange files due to compatibility issues. The company's motivation is for you to run the latest version of the software on BOTH computers.

Consider also that companies rely on software support. Getting proprietary software support means getting it from the original software vendor. If that company goes under or stops supporting the application, you're out of luck. But even if they still support the software, perhaps you have had lousy experience with the provider's customer service. And why should they care – if you want support, you're forced to come to them.

In the open source world, especially in terms of enterprise applications, there are diverse support providers willing to help. In many cases these separate companies are part of a certification process for that particular open source project. Examples include the `Linux` certifications.

### `GitHub` Cofounder Tom Preston-Werner lays out additional arguments in his 2011 post [Open Source (Almost) Everything](https://tom.preston-werner.com/2011/11/22/open-source-everything.html):

**Force multiplication:** Open source is a force multiplier for developers. This happens in three ways: First, when communities form around shared challenges, the diversity of ideas that naturally emerges surfaces better solutions than if the marketplace of ideas was limited to just your organization, meaning developers are working smarter. Second, exposing the problem space to other interested organizations provides additional human capital to tackle the challenge, meaning the solution has more developer hours thrown at it, at no additional cost. Finally, "more users means more use cases being explored, which means more robust code."

**Modularity:** Open source projects tend to be more modularly architected, improving both the flexibility, and the robustness of the code. When building software for a single use case, the developer is able to take some technical short cuts. The problem comes when the enterprise would like to use that software in a different use case, or when requirements change. Open source, by its nature, is built for a variety of use cases, environments, and users. This means more options, and a tendency to encourage more modularity, resulting in greater flexibility and lower customization costs in the long run. Put another way, open source necessitates cleaner, more maintainable code. "Even internal code should pretend to be open source code".

> The 2002 [Amazon API Mandate](https://www.cio.com/article/3218667/have-you-had-your-bezos-moment-what-you-can-learn-from-amazon.html) drove similar principles, in an effort to be agile and drive innovation, by requiring developers to scale technology assets with APIs–externalizable services–so the broader organization could independently reuse and leverage code assets to drive business outcomes through other use cases. It is the foundation of AWS. [Amazon continues to be a large contributor to several open source community efforts](https://aws.amazon.com/opensource).

**Reduce duplication of effort:** Each company should focus on a set of core competencies. What makes it unique or gives it an advantage? Everything else is the work everyone else is also doing: or put another way, the work you need to do so that you can do the work that you want to do. It doesn't have to be that way. Open source reduces duplication of efforts, both within an organization and across organizations, by allowing for individual components to be shared. Coca-Cola's secret sauce is the formula for its syrup, not its ability publish blog posts or post press releases. Using an open source CMS, or sharing their built-in-house blog components with the world, doesn't make Pepsi taste any better. 

**Great advertising:** Maintainers of successful open source projects are often seen as industry leaders, providing themselves with the ability to shape the conversation around particular software problems and associating their brand with the preferred solution. `CNHIndustrial`, for example, is a founding member of the [OATSCenter](https://oatscenter.org/) and `AirBNB` is a primary developer of `Apache Airflow`.

**Attract talent:** Developers want to work on yet-unsolved problems. Open source allows you to showcase the interesting challenges you face and how you think about solving them. Open source developers can casually contribute to projects, to learn how you work, and what it's like developing software for a particular set of challenges. If they like what they see, there's a much better chance that they'll apply for a job, than if your organization was a black box when it comes to what it's like to work there. "Smart developers like to hang out with smart code."

**Best technical interview possible:** Technical interviews traditionally involve working on a simulated problem that can be tackled in a set amount of time with little additional context. Such simulations, by definition, aren't real world use cases, nor do they show what working with an applicant would be like. Open source provides visibility into both how a candidate solves problems, and how they work with others. A business can hire much more confidently if, for the past six months, the candidate has been contributing meaningfully to an open source project relevant to the hiring company. 

![IMAGE: FLICKR USER: _SARCHI](https://images.fastcompany.net/image/upload/w_562,ar_16:9,c_fill,g_auto,f_auto,q_auto,fl_lossy/fc/3030063-poster-p-1-why-the-r-programming-language-is-good-for-business.jpg)

## Macroeconomic motivations

By augmenting parallel efforts, open source makes a society more efficient at producing higher quality software.

**Efficiency:** Many of the microeconomic arguments above, in the aggregate, have a macroeconomic impact. When firms work more efficiently, the economy produces more (and better) software, software that can in turn, improve lives. If you believe that all the easy problems have already been solved, then on a macroeconomic level, open source allows you to move firms from lower-level work to higher level, yet-unsolved challenges. The results of this higher level work tends to be disruptive, rather than iterative, creating the churn that invigorates the economy. If every technology company must devote a few years of R&D solving the same 5-10 problems, that delays (or at the very least shifts capital from) the company's ability to be productive and produce technology that's valuable to society, not to mention, it raises the barrier for new market entrants to offer alternatives to established firms.

**Stand on the shoulders of giants:** Today, truly innovative technologies, the types that improve quality of life in meaningful ways, aren't created in a vacuum. The full value is only realized when it can be integrated from multiple, context-rich sources in ways that adhere to the trust requirements of its owners. Even closed source technology, from the cell phone in your pocket to the car you drive to the Fortune 500 company that produced them, rely heavily on open source. Just take a look at your phone's "settings -> about" page. Open source allows developers to take already-solved problems as a given, to rely on the knowledge of experts beyond their own domain of expertise, and unlocks their potential to create new inventions otherwise not possible.

**Fuel the marketplace of ideas:** Software is nothing more than technical knowledge. There was once a time when alchemists would withhold the results of their work, claiming their discoveries as proprietary. Each had to learn the hard way the result on the human body of drinking lead. When those alchemists began sharing their work, we began calling them scientists, and the scientific revolution was born. The same is true of computer software. Two developers working individually may come up with two solutions to a given problem, but through dialog and collaboration, each bringing their own knowledge and experience, will often discover many other solutions to the same challenge, and society is better as a result.

> At `Facebook`, the data science team’s data visualizations in `R` give it the best overview of what kind of data it is dealing with. The data can range from something like News Feed numbers to correlations with the amount of connections a user has. “Generally, we use `R` to move fast when we get a new data set,” says Solomon Messing, data scientist at `Facebook`. “With R, we don’t need to develop custom tools or write a bunch of code. Instead, we can just go about cleaning and exploring the data.” Messing and the other `Facebook` data scientists regularly use open-source `R` packages from Hadley Wickham, chief scientist at `RStudio`. Wickham’s packages, like ggplot2 and the tidyverse, allow the team to explore new data through custom visualizations. The `Facebook` data science team uses `R` so ardently to visualize data that it even created a [MOOC](https://www.udacity.com/course/data-analysis-with-r--ud651) that teaches students what it knows. 

![Visualizations from Messing’s colleagues at Facebook, done in collaboration with Stanford University’s HCI Group](https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/fc/3030063-inline-screenshot-2014-05-02-140959.png)

## Moral motivations

The formal name for open source is free/libre open source software. As such, open source motivations have a strong moral component. The most notable example, the [Apache Software Foundation](http://www.apache.org/), has for over 20 years embraced their original goals of transparent, community-driven collaboration in a vendor-neutral environment that is accessible to all.

A core tenet of The Apache Way is "Community Over Code", which encapsulates the premise that a healthy community is a higher priority than good code. A strong community can always rectify a problem with the code, whereas an unhealthy community will likely struggle to maintain a codebase in a sustainable manner. Healthy communities ensure that the Foundation has the stability to thrive for the next 20 years and beyond. Apache projects do not suffer from scaling and governance issues that closed software does. This is no accident. 

**Free as in speech, not as in beer**: Open source software is not without cost. When open source software is called "free," it is a reference to the rights the software consumers receive, not the cost they must pay. Adobe's Flash player, for example, is free software in the economic sense, but is still at the core of proprietary (non-free) software (and formats). Specifically, free software refers to four core freedoms: the freedom to run the software, the freedom to study and modify the software, the freedom to redistribute the software, and the freedom to distribute your modifications. Free software places power back in the hands of users and ensures users control the software they use, not the other way around.

**Obligation to give back:** Open source is the give-a-penny-take-a-penny jar of software. If you consume open source, be it a server, a desktop publishing application, or a software library, you have an obligation to give back to the community. After all, without the contribution of others, the micro- and macroeconomic motivations would no longer hold true, and open source as we know it would cease to exist. This is the Golden Rule, or in traditional philosophical terms, a categorical imperative.

**Governments** should give what they've developed to the people who pay for their development: If the development costs are paid by a government, then there's an additional argument for giving back. Governments take money (taxes) to perform services for citizens. For example, the US federal government was established through its Constitution to perform a number of important tasks. If the populace are paying for the development of software, it stands to reason that we should receive what we paid to develop, including the software that we paid to develop.

**Teaching the next generation:** Many of the industry's most prominent engineers today cut their teeth by learning from open source. When software's underlying code is made available for inspection, consumers can learn how their favorite software works and computer science courses can analyze how the industry's cutting edge technology is built. This goes a long way to train the next generation of software engineers, who without open source would be left guessing at the inner-workings of prior iterations.

## Transparency motivations

Open source allows for greater transparency of process, whether that's the transparency necessary to check a government action or the quasi-governmental function of a private company's software.

**Showing your work:** As the government increasingly relies on technology to regulate industries and deliver services to citizens, being able to see the underlying algorithms and processes are essential to checking the government's work. If a closed-source software package is used to calculate taxes or allocate broadcast frequencies, how would one know that the process, our process, is fair and accurate? Closed source IP solutions often resemble a black box, diminsihing the potential for transparency.

**Positions of public trust:** As the software produced by private corporations are increasingly placed in positions of public trust, the transparency obligation extends into the private sector as well. Did the voting machine accurately count my vote? When given a lose-lose choice, does the self-driving car conform to community norms? For example, if a closed-source software package is used to compare DNA at a crime scene, unlike a medical expert who can be cross examined, that proprietary algorithm is shielded from scrutiny by copyright (or patent) law. Open source, or at least partial open source of particular components, will become essential as private companies automate quasi-government functions.

## Participatory motivations

Open source affords software stakeholders, both technical and non-technical, the opportunity to shape any given software development project.

**Direct democracy:** True direct democracy, where every citizen votes on every issue, isn't tenable given the size of most democracies. Nor have citizen been able to participate directly in most issues, due to technical constraints. Open source changes that by allowing software stakeholders to participate directly in the software development process. Think the process of buying health care is confusing? Open an issue. Believe the government should use more open source, submit a pull request. The White House is already doing this for some IT-centric policies like the Digital Services Playbook, HTTPS, and open data policies.

> Gordon Shotwell explains in his [Why I use R](https://blog.shotwell.ca/posts/why_i_use_r/) article how the R-Project Consortium package repository [CRAN](https://cran.r-project.org/) has created a strong consensus on how to package and distribute code extensions, which means that nine times out of ten a package will install and run with no user configuration. This feature is important because we want code to be usable and installable by people who do not think of themselves as programmers and do not have any tolerance for the command line. His goal for all the products he develops is that they are installable and runnable with a single user action, and that action cannot take place in the terminal. CRAN moves a lot of the setup and configuration pain from the end user to the package maintainer, and while this probably slows down development and release of packages, it vastly improves the user experience of the average user.

**Customer feedback:** Open source empowers consumers to have a combined, powerful voice in the private sector development process. Think of it like `Yelp` for software. Without `Yelp`, a restaurant is free to upset a single customer. At most, the dissatisfied patrons could dissuade 5-10 other potential patrons. In a post-`Yelp` world, customers read the reviews of strangers before they choose where to go. Open source amplifies the voice of software consumers within the consumer-publisher relationship. Not to mention, the feedback the private company receives can go towards better informing product decisions and improve the overall product. Open source gives companies a direct line to their most passionate customers.

## Personal motivations

Whether you are a developer or an aspiring developer, open source can provide an inexpensive onramp to a path for personal growth within the software development community.

**Learn to code:** Open source is a great way to learn how to code. Want to know how your favorite website works? Clicking "view source" in your web browser can go a long way to point you in the right direction. You can read the documentation of the software that powers it, and potentially even stand up your own clone. Want to learn more? Join the local meetup for the framework or language, like the [Chicago R User Group](https://www.meetup.com/Chicago-R-User-Group/). Better still, submit a pull request to the project to fix a bug or add a feature. While there are certainly time and opportunity costs involved, all of this comes without any direct cost to the aspiring developer, at least not in terms of software, and is infinitely more inclusive than doing the same within a proprietary community. There's a reason nearly every coding school today teaches open source.

**It's fun:** In the distant past, open source had the reputation of being the product of hobbyists. Yes, open source is fun. If you're a hacker it provides an endless stream of ever-changing Rubix cubes to solve on weekends. Just as puzzles provide bite-sized intellectual escapes, the order and symmetry of open source can be a rock garden of coding challenges.

There are likely other reasons to prefer consuming, publishing, collaborating on, and supporting open source beyond those listed here. Whatever the rationale, it's clear open source isn't the next big thing. Open source is already here.


### Did you find this page helpful? Consider sharing it 🙌


