---
title: The Data Evangelist
subtitle: "Perspectives on building the Data Science Community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-05-05
featured: false
draft: false
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Photo by Dylan Gillis for Unsplash"
  focal_point: "Bottom"
  preview_only: false
projects: []
---

In the news this month, my colleague Andrew Olliver was appointed Vice-Chairperson of the [Agricultural Industry Electronics Foundation](https://www.aef-online.org/home.html) (AEF). Numerous other engineering colleagues serve on standards committees with industry, academia, and regulatory experts all over the world. Developing and maintaining interfaces with [suppliers](https://supplier.cnhind.com/) and other [developers](https://www.developer.cnhindustrial.com/home) is a significant undertaking here and in most other companies involved in global agriculture.

My plan here is to explain why this fits with the mission and make a few observations about the rapidly expanding scope of digital in agriculture. I'll also throw in a handful of posts as seen on social media this week. On that theme, this brief post will cover:

-   A Book Recommendation,
-   Collaboration, Trust, Robustness, Sustainability, and Other Motivations,
-   Gartner Analytics Conference Debrief,
-   Upcoming Events,
-   and IIA Architecting a Modern Analytics Tech Stack Debrief.

Whatever prompted you to read this blog post, I hope that you come away with a handful of useful insights for your own work.

------------------------------------------------------------------------

## Book Recommendation

<a href="https://www.amazon.com/Loonshots-Nurture-Diseases-Transform-Industries/dp/1250185963"><img src="https://images-na.ssl-images-amazon.com/images/I/41xeO-IKMUL._SX327_BO1,204,203,200_.jpg" alt="Loonshots: How to Nurture the Crazy Ideas That Win Wars, Cure Diseases, and Transform Industries" width="400"/></a>

> Why do good teams kill great ideas? Loonshots reveals a surprising new way of thinking about the mysteries of group behavior that challenges everything we thought we knew about nurturing radical breakthroughs.

------------------------------------------------------------------------

## Industry Collaboration

The AEF counts eight manufacturers and three trade associations as core members together with over 200 general members. They have worked together for many years to improve cross-manufacturer compatibility and to establish transparency about compatibility issues, providing guidelines for internationally agreed best practices as well as technical specifications for tools, machinery and other products and processes. The organization's main workstreams have recently been expanded to include electric drives, camera systems, farm management information systems, high speed ISOBUS messaging, and wireless in-field communication.

{{< tweet 1386660651939123201 >}}

Greg Myers, Syngenta CIO, wrote an appeal last month imploring the industry, given climate change and other social challenges, move away from building "walled gardens" and towards even more collaboration and open environments. A couple of his key points:

> Agtech must avoid the progress-slowing pattern followed by such earlier novel and transformative technology advances as personal computing and the internet.

> Whichever software a farmer chooses as the main point of entry should benefit from the full breadth of innovation across the entire agriculture value chain - the same way all the apps on your phone work together, regardless of operating system or phone manufacturer.

Standards in agriculture really is an ancient topic. They explain how we ended up with units of measure like the bushel and the furlong. I am reminded here of the role that former US Commerce Secretary (and eventual President) Herbert Hoover played in the 1920s. Under his leadership, government departments concerned with international trade, the Census Bureau, and the Bureau of Standards were greatly expanded. He called over three thousand conferences to encourage efficiency, standardization, and the elimination of waste in industry. Hoover's Commerce Department played a key role in the development and regulation of several new technologies, including broadcast radio, passenger air travel, and mechanized agriculture.

Henry Ford became a folk hero of sorts that decade by championing technology sharing, standardized automotive parts and processes, and reforms in patent litigation. "No man has a right to profit by patent only," said Ford, in 1925. "That produces parasites, men who are willing to lay back on their oars and do nothing. If any reward is due the man whose brain has produced something new and good, he should get enough profits from the manufacture and sale of the thing."

Now, in the 21st century, the major growth businesses have benefited themselves from standardized and scaled infrastructure, often in the form of **open source** software frameworks, made possible with similar thinking. These include HTML, Unix, Android, Python, R, and many others. By augmenting parallel efforts, open source makes a society more efficient at producing higher quality products, like the mobile phone Mr. Myers mentioned above. 

<a href="https://agstack.org/about/"><img src="https://agstack.org/wp-content/uploads/sites/7/2021/04/agstack-color-site2-01.svg" alt="AgStack: A Linux Foundation Project" width="400"/></a>

Also announced this week, [AgStack](https://agstack.org/about/) is a new open source project designed to foster collaboration across global supply chains. Members and partners include Purdue University OATS, IBM, NIAB, Agralogics, OpenTeam, the Produce Marketing Association, and many others. Three reasons for getting involved:

1.  **Efficiency:** When firms work more efficiently, the economy produces more (and better) software, software that can in turn, improve lives. If you believe that all the easy problems have already been solved, then on a macroeconomic level, open source allows you to move firms from lower-level work to higher level, yet-unsolved challenges. The results of this higher level work tends to be disruptive, rather than iterative, creating the churn that invigorates the economy. If every technology company must devote a few years of R&D solving the same 5-10 problems, that delays (or at the very least shifts capital from) the company's ability to be productive and produce technology that's valuable to society, not to mention, it raises the barrier for new market entrants to offer alternatives to established firms.

2.  **Stand on the shoulders of giants:** Today, truly innovative technologies, the types that improve quality of life in meaningful ways, aren't created in a vacuum. The full value is only realized when it can be integrated from multiple, context-rich sources in ways that adhere to the trust requirements of its owners. Even closed source technology, from the cell phone in your pocket to the car you drive to the Fortune 500 company that produced them, rely heavily on open source. Just take a look at your phone's "settings -\> about" page. Open source allows developers to take already-solved problems as a given, to rely on the knowledge of experts beyond their own domain of expertise, and unlocks their potential to create new inventions otherwise not possible.

3.  **Fuel the marketplace of ideas:** Software is nothing more than technical knowledge. There was once a time when alchemists would withhold the results of their work, claiming their discoveries as proprietary. Each had to learn the hard way the result on the human body of drinking lead. When those alchemists began sharing their work, we began calling them scientists, and the scientific revolution was born. The same is true of computer software. Two developers working individually may come up with two solutions to a given problem, but through dialog and collaboration, each bringing their own knowledge and experience, will often discover many other solutions to the same challenge, and society is better as a result.

> The 2002 [Amazon API Mandate](https://www.cio.com/article/3218667/have-you-had-your-bezos-moment-what-you-can-learn-from-amazon.html) drove similar principles, in an effort to be agile and drive innovation, by requiring developers to scale technology assets with APIs--externalizable services--so the broader organization could independently reuse and leverage code assets to drive business outcomes through other use cases. It is the foundation of AWS. [Amazon continues to be a large contributor to several open source community efforts](https://aws.amazon.com/opensource).

Oddly, in the Cold War years after WWII, operations research analytics outputs were often "artisanal"---hand-crafted, slow, and expensive to create. The goal was typically to create a report using statistics and linear algebra, and maybe a regression model too. They were individually-oriented. Like an individual artist or craftsperson, the analytical artisan created analytics for him or herself, or with their team of practitioners. At most a more senior decision-maker might see the results of the analysis. After all, this was the "decision support."

Now we are in an era in which data, analytics, and AI have become critical organizational assets. They are created by teams for teams, serving colleagues, senior executives, customers, suppliers, or an entire information platform. Today, for an analytics artisan to create an analytical program for him or herself would be considered a waste of value and time. This shift to "collaborative analytics" has implications for the tools used, the processes employed to create and distribute work, and the way data science talent is deployed. We need to make it easy to share insights throughout, and even outside, our organizations.

{{< youtube aSpI8LtlAPg >}}

### Trust

A key element in building trust with data science algorithms is interpretability. While some algorithmic models are famously black box in nature, there are tools that shine light into the box and help the team to understand
the factors that drove the prediction. One approach is SHAP (SHapley Additive exPlanations), which can be used in all kinds of ways, such as showing the features that most impacted a forecast in demand sensing.

Another key element central to building trust is expanding access beyond the narrow cadre of data scientists. Trust in the fancy math is critical, but so is transparency in the data. People all along the supply chain, from the planners of materials, production, demand, inventory, etc. need to have visibility into some subsets of the same data at the same time. It's called a supply chain because the functions are linked, which means each impacts the other. Cascading information could mean waiting for an updates to be entered and creating latency that can lead to finger-pointing and erode trust. The impact of agility and the insights rendered by both humans and machines are limited if transparency is lacking.

To prevent planners from being mired in tedium, machine learning models can deliver insights that humans just cannot see. This opens up a world where planners can apply their domain expertise to focus on exceptions and manage the complexity. Planners can know what is happening sooner and act faster. People and algorithms work best together, with the lights on, so for supply chains the best direction is to augment people power.

Open source allows for greater transparency of process, whether that's the transparency necessary to check a government action (anywhere in the world) or the quasi-governmental functions of any private company's software, in two ways:

**Showing your work:** As the government increasingly relies on technology to regulate industries and deliver services to citizens, being able to see the underlying algorithms and processes are essential to checking the government's work. If a closed-source software package is used to calculate taxes or allocate broadcast frequencies, how would one know that the process, our process, is fair and accurate? Closed source IP solutions often resemble a black box, diminsihing the potential for transparency.

**Positions of public trust:** As the software produced by private corporations are increasingly placed in positions of public trust, the transparency obligation extends into the private sector as well. Did the voting machine accurately count my vote? When given a lose-lose choice, does the self-driving car conform to community norms? For example, if a closed-source software package is used to compare DNA at a crime scene, unlike a medical expert who can be cross examined, that proprietary algorithm is shielded from scrutiny by copyright (or patent) law. Open source, or at least partial open source of particular components, will become essential as private companies automate quasi-government functions.

### Robustness

**Given enough eyeballs, all bugs are shallow** (Linus's Law): Empirically, open collaborative work [tends to produce better quality software than its proprietary or alternative counterparts](https://dwheeler.com/oss_fs_why.html). With proprietary frameworks, the only developers that can potentially detect, diagnose, and resolve software bugs are those that happen to be employed by the company that publishes the software (or the arms-length contractor they paid to build it). Open source provides three advantages here: first, the opportunity to tap the knowledge of the world's best developers, not just those on one organization's payroll. Second, the number of potentially contributing developers and thus the potential knowledge pool is orders of magnitude larger. Finally, open source software gets adapted in variety of use cases, not just the one the publisher originally intended, surfacing bugs and edge cases much more rapidly than traditional QA processes.

**Modern software development practices:** Open source software is more than simply "published" code. You'd be hard-pressed to find an open source project that follows outdated command-and-control development philosophies. Open source projects all but necessitate modern software development workflows. These workflows are electronic (meaning process is naturally captured and exposed), asynchronous (meaning decisions are time and location agnostic), and lock-free (meaning contributors can rapidly experiment without prior approval). 

{{< tweet 1389442160106385409 >}}

### Sustainability

**Upstream improvements:** When consuming software in a trade group, it's in the institution's best interest to contribute back. Contributions can be in the form of reporting bugs, or even submitting proposed fixes. Since software is written by humans, it's highly unlikely to be perfect, and even if so, likely doesn't satisfy every use case. Rather than forking the project and implementing changes into your own version, submitting bug reports and improvements upstream allows the consumer to more easily continue to benefit from the subsequent fixes and improvements submitted by others.

**Interoperability:** Open source software is much better at adhering to open standards than proprietary software is. If interoperability with other businesses, computers, and users has a high value, and B2B parties don't want to be limited by proprietary data formats, open source software is definitely the way to go.

**Auditability:** Without AEF standards, there is little but the vendor's claims assuring that they're keeping the software secure and adhering to standards. It's basically a leap of faith. The visibility of the code behind open source software, however, means all developers can monitor compliance.

Finally, **Shifting development from low-value work to high-value work:** In communities we often hear that all the easy problems have already been solved. Blogging, content management, and perating systems are all problems with established (and mainstream) solutions, to name a few. While your developers could spend their time reinventing wheels that the community have already perfected, it's far preferable to use the worlds best wheel, especially when that wheel comes at no cost to you. This frees developers up to work on yet-unsolved challenges, the types of challenges that are unique to and add value to the organization's mission. Why not stand on the shoulders of technology giants?

`GitHub` Cofounder Tom Preston-Werner lays out additional arguments in his 2011 post [Open Source (Almost) Everything](https://tom.preston-werner.com/2011/11/22/open-source-everything.html)

![IMAGE: FLICKR USER:_SARCHI](https://images.fastcompany.net/image/upload/w_562,ar_16:9,c_fill,g_auto,f_auto,q_auto,fl_lossy/fc/3030063-poster-p-1-why-the-r-programming-language-is-good-for-business.jpg)

### Moral motivations

The formal name for open source is free/libre open source software. As such, open source motivations have a strong moral component. The most notable example, the [Apache Software Foundation](http://www.apache.org/), has for over 20 years embraced their original goals of transparent, community-driven collaboration in a vendor-neutral environment that is accessible to all.

A core tenet of The Apache Way is "Community Over Code", which encapsulates the premise that a healthy community is a higher priority than good code. A strong community can always rectify a problem with the code, whereas an unhealthy community will likely struggle to maintain a codebase in a sustainable manner. Healthy communities ensure that the Foundation has the stability to thrive for the next 20 years and beyond. Apache projects do not suffer from scaling and governance issues that closed software does. This is no accident.

**Free as in speech, not as in beer**: Open source software is not without cost. When open source software is called "free," it is a reference to the rights the software consumers receive, not the cost they must pay. Adobe's Flash player, for example, is free software in the economic sense, but is still at the core of proprietary (non-free) software (and formats). Specifically, free software refers to four core freedoms: the freedom to run the software, the freedom to study and modify the software, the freedom to redistribute the software, and the freedom to distribute your modifications. Free software places power back in the hands of users and ensures users control the software they use, not the other way around.

**Obligation to give back:** Open source is the give-a-penny-take-a-penny jar of software. If you consume open source, be it a server, a desktop publishing application, or a software library, you have an obligation to give back to the community. After all, without the contribution of others, the micro- and macroeconomic motivations would no longer hold true, and open source as we know it would cease to exist. This is the Golden Rule, or in traditional philosophical terms, a categorical imperative.

**Governments** should give what they've developed to the people who pay for their development: If the development costs are paid by a government, then there's an additional argument for giving back. Governments take money (taxes) to perform services for citizens. For example, the US federal government was established through its Constitution to perform a number of important tasks. If the populace are paying for the development of software, it stands to reason that we should receive what we paid to develop, including the software that we paid to develop.

**Teaching the next generation:** Many of the software industry's most prominent engineers today cut their teeth by learning in open source environments. When software's underlying code is made available for inspection, consumers can learn how their favorite software works and computer science courses can analyze how the industry's cutting edge technology is built. This goes a long way to train the next generation, who without open source would be left guessing at the inner-workings of prior iterations.

> Gordon Shotwell explains in his [Why I use R](https://blog.shotwell.ca/posts/why_i_use_r/) article how the R-Project Consortium package repository [CRAN](https://cran.r-project.org/) has created a strong consensus on
how to package and distribute code extensions, which means that nine times out of ten a package will install and run with no user configuration. This feature is important because we want code to beusable and installable by people who do not think of themselves as programmers and do not have any tolerance for the command line. His
goal for all the products he develops is that they are installable and runnable with a single user action, and that action cannot take place in the terminal. CRAN moves a lot of the setup and configuration pain from the end user to the package maintainer, and while this probably slows down development and release of packages, it vastly improves the user experience of the average user.

**Customer feedback:** Open source empowers consumers to have a combined, powerful voice in the private sector development process. Think of it like `Yelp` for software. Without `Yelp`, a restaurant is free to upset a single customer. At most, the dissatisfied patrons could dissuade 5-10 other potential patrons. In a post-`Yelp` world, customers read the reviews of strangers before they choose where to go. Open source amplifies the voice of software consumers within the consumer-publisher relationship. Not to mention, the feedback the private company receives can go towards better informing product decisions and improve the overall product. Open source gives companies a direct line to their most passionate customers.

{{< tweet 1389973284402384900 >}}

### Personal motivations

Whether you are a developer or an aspiring developer, open source can provide an inexpensive on-ramp to a path for personal growth within the software development community.

**Learn to code:** Open source is a great way to learn how to code. Want to know how your favorite website works? Clicking "view source" in your web browser can go a long way to point you in the right direction. You can read the documentation of the software that powers it, and potentially even stand up your own clone. Want to learn more? Join the local meetup for the framework or language, like the [Chicago R User Group](https://www.meetup.com/Chicago-R-User-Group/). Better still, submit a pull request to the project to fix a bug or add a feature. While there are certainly time and opportunity costs involved, all of this comes without any direct cost to the aspiring developer, at least not in terms of software, and is infinitely more inclusive than doing the same within a proprietary community. There's a reason nearly every coding school today teaches open source.

**It's fun:** In the distant past, open source had the reputation of being the product of hobbyists. Yes, open source is fun. If you're a hacker it provides an endless stream of ever-changing Rubix cubes to solve on weekends. Just as puzzles provide bite-sized intellectual escapes, the order and symmetry of open source can be a rock garden of coding challenges.

There are likely other reasons to prefer consuming, publishing,collaborating on, and supporting open source beyond those listed here. Whatever the rationale, it's clear open source isn't the next big thing. Open source is already here.

**Open source is the future:** There is no startup today worth it's venture capital funding without open source tools. Even Microsoft, traditionally one of the biggest opponents to open source, has recently open sourced their primary development framework (along with Apple, Facebook, and Google). Today, the largest names in technology, from IBM, to SAP, to Adobe actively participate in the open source community. It's inaccurate to say that "open source is the future." Open source has already won, even in agriculture.

------------------------------------------------------------------------

{{< tweet 1389672393484951560 >}}

### [Gartner Data & Analytics Summit -- Americas](https://reg.gartner.com/flow/gartner/bi19v/attportal/page/home) Debrief

This week's three days of polished virtual sessions covered a wide range of analytics topics. Most talks are presented at a technical level for a busy CIO or other C-suite executive responsible for analytics services delivery to a large business. The book recommendation above, "Loonshots," comes from one of the guest keynote addresses. I did notice, though, that our roundtable breakouts represented a wide variety of institutions. It has been difficult to realize the full value of engaging the community for advice in the COVID era, though Gartner's media tool is better than most. I've brought back some materials for sharing with peers.

------------------------------------------------------------------------

## Upcoming Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

:star: May 17 [Comparing {lightgbm} to other Gradient Boosted Decision Tree libraries](https://www.google.com/url?q=https://www.meetup.com/nyhackr/events/277831968&sa=D&source=calendar&usd=2&usg=AOvVaw34CH9FaHrV2CdwP-rXGWUh) with James Lamb 

:star: May 19 [No More Dashboards: Why Employees Aren't Using Data and What to do About It](https://www.meetup.com/acm-chicago/events/277629843/) with Nate Nichols of Narrative Science

:star: May 25 [R in Supply Chain Management](https://www.meetup.com/RStudio-Enterprise-Community-Meetup/events/277113742/) Nicolas Nguyen, Digital Supply Chain and Global S&OP Leader for Carl Zeiss Meditec

:star: May 26 [Automating business processes](https://www.meetup.com/Cleveland-UseR-Group/events/277370785/)
with [Frans van Dunné](https://www.fransvandunne.com/), Chief Data Officer at [ixpantia](https://www.ixpantia.com/)

:star: May 26 INFORMS Chicago Chapter College Resume Review & Mini Career Fair

:star: July 5-9th [useR!2021](https://user2021.r-project.org/)

:star:️ September 6-10th [EARL Conference 2021](https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

------------------------------------------------------------------------

### IIA Architecting a Modern Analytics Tech Stack

{{< youtube Vtwk2B--uL0 >}}

As a contrast to Gartner's generic, paywalled C-suite survey advisory approach, in this conversation IIA's Ken Sanford shares his hands-on experience along with a simple, effective framework for making data science tool stack choices, informed by specific needs, not by sales hype.

Buy or build? Packaged analytics software or custom? These are false choices. The challenges in terms of business opportunities, talent constraints, compute trade-offs and data availability are highly contextual, and each company needs to architect its own stack for its own needs.

------------------------------------------------------------------------

## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-04-30-data-evangelist-part-9/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
