---
title: The Data Evangelist
subtitle: "Perspectives on building the Data Science Community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-03-11
lastmod: 2021-03-11
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "a chair"
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

Working at an equipment OEM offers something most will never experience in the [FAANG](https://www.businessinsider.com/what-is-faang) “tech” companies: the chance to see ideas come to life in farm fields and on jobsites all over the world. What we imagine and ultimately make a reality will help customers work more safely, more efficiently and more productively. And it's also better than making things like chairs (more on this later).

Artificial Intelligence is becoming an increasingly important aspect of the smart way of doing all the things that we do, and not just in vehicle autonomy and telematics. It is vital to ensure the right part is at the right place before the customer needs it, ensure technicians service machines correctly, and make all of this cost effective. Consider the full enterprise view of AI opportunities related to supply streamlining, dealer operations, inventory management, demand planning, and equipment repair, among many others. Data-driven AI also has the potential to allow brand marketing to deliver a much more personalized customer experience. So it's a big deal in a big organization. On that note, this short post explores 

- how a huge organization makes the pivot, 
- extreme ownership,
- an honest assessment of analytics maturity,
- learning resources, and
- 2 book recommendations.

Whatever prompted you to read this blog post, I hope that you come away with a handful of useful insights for your own work.

----

> "Happy families are all alike; every unhappy family is unhappy in its own way." Leo Tolstoy

> "Tidy datasets are all alike; but every messy dataset is messy in its own way." Hadley Wickham

A challenge shared with most other organizations is realizing that we all are still in the early stages of AI. It’s not off-the-shelf prepackaged software, and most likely will never be. AI requires volumes of quality data, solid analytics capabilities, and strong business acumen. In most AI use cases we have to create the data, do the labeling, and train the models. It also requires new ways of assessing the talent and capabilities of the people within most every functional group. 

One size doesn’t fit all for every project or team. Sometimes the first solutions delivered are too brittle, and thus difficult to flex when the marketplace evolves. They will have to iterate. On the one hand, understanding how to get AI capabilities to the front lines, or even the edge, is essential. On the other hand, there are areas that must be strategically coordinated through a centrally driven project. With a large global dealer network, customer facing operations are fairly decentralized already, so leaders need to be thinking about AI in contexts that span the entire range. 

Another challenge is establishing trust in AI deployments. The increased use of deep learning techniques has some demanding explanations of how they work and the ethics involved. People don’t want AI to be a black box. Instead they really want explainability, that is, to understand what is driving the decision recommendations. That’s a good problem to have, though, because it shows that people see the value in making business decisions driven this way. 

----

## Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

⭐️ April 6-7th [ISU Analytics Symposium](https://www.ivybusiness.iastate.edu/analytics-symposium/)

⭐️ April 12-14th
[INFORMS Business Analytics Conference](http://meetings2.informs.org/wordpress/analytics2021/)

⭐️ September 6-10th [EARL Conference 2021]( https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

----

> "It doesn't make sense to hire smart people and then tell them what to do; we hire smart people so they can tell us what to do." - Steve Jobs

## Extreme Ownership

In their book [Extreme Ownership](https://echelonfront.com/extreme-ownership/), authors Jocko Willink and Leif Babin reflect that leadership, at every level, is the most important thing on the battlefield. An entire chapter is dedicated to decentralized command. They argue that you can really only manage about 6 people: larger organizations need decision-makers below them. We need to address a preparedness gap in our inventory of skills, from how we hire to how we ensure our employees have the tools they need to build up AI acumen within their own functions and markets. 

When I look at the **Industry 4.0** basket of manufacturing and supply chain technologies like RFID, torque tool monitoring, wearables, PLC automation monitoring, and other digital controls, in most every case a digital map is built that links up each employee's workmanship today to an individual customer operating that machine tomorrow. In a healthy environment, the technologies drive accountability and positive conversations about improving, every day. Maybe the magic of the Amazon Alexa or Google Maps has misled us into believing that AI is easy. What is more often the case is that AI drives us to understand our customers' experiences more than ever, and that is often hard.

<a href="https://www.grainger.com/product/31CC54"><img alt="Air Powered Staple Gun" src="https://static.grainger.com/rp/s/is/image/Grainger/31CC54_AS01?hei=536&amp;wid=536" width="300"></a>

Many years ago I worked as an engineer at an office chair factory. The components were simple:  fabric, adhesive, foam, plywood, hardware, and staples. In my role, besides product and tooling design in Pro/E, one project required videotaping for time studies of assemblers. It was noisy with air compressors and staple guns firing constantly. The data we analyzed was used to set productivity quotas and incentives. There were also periodic kaisen events with a visiting consultant to sweep up, touch up the paint, and strip down to one piece flow to reduce waste. Outside of the kaisen, from time to time, near the end of a shift when workers were fatigued and trying to make quota, everything would stop. It wasn't unusual that there would be a staple gun incident, where an assembler had stapled his gloved hand to the plywood.😧

When I think of achieving analytics maturity, the first thing that I think of is candor. The furniture factory is different today. Little changes to reduce fatigue reduced the lost time incident counts by a little. Eliminating the staples from the design reduced the lost time accidents by a lot. The effort in driving the needed change was far more than just statistics or data visuals. Candor was required to honestly and transparently engage to find solutions and deliver.

Consultancies like Accenture, the [International Institute for Analytics](https://www.iianalytics.com/), [Princeton Consultants](https://www.princeton.com/), and others offer valuable analytics maturity frameworks and assessments. These and other firms interview business leadership to assess the enterprises' journey through building **Descriptive > Diagnostic > Predictive** decision support tools. As with the kaisen events, maturity assessments are worthwhile. But in my own view, the critical foundation is built on sound, rigorous communities of practice where the craft of analytics is advanced by practitioners. The hard part isn't the math or coding. It is the candor required to face the business and drive needed change. Extreme Ownership, indeed.

----

{{<tweet 1333033134481420289>}}

## Analytic Maturity

The [National Science Foundation](https://twitter.com/NSF), through a 5-year, $26 million grant, has established the [NSF Engineering Research Center for the Internet of Things for Precision Agriculture](https://iot4ag.us/). Better known as [IoT4Ag](https://iot4ag.us/), the project unites faculty and students from the University of Pennsylvania, Purdue University, the University of California Merced, and the University of Florida with industry and government partners to transform agriculture. 

The mission: To ensure food, energy, and water security by advancing technology to increase crop production, while minimizing the use of energy and water resources and the impact of agricultural practices on the environment. The Center will create internet of things (IoT) technologies to optimize practices for every plant; from sensors, robotics, and energy and communication devices to data-driven models constrained by plant physiology, soil, weather, management practices, and socio-economics.

A few weeks back I posed several [change management and leadership questions](https://jimgruman.netlify.app/post/2021-02-05-data-evangelist-part-2/). Two of them, in the series:

- Where is the analytics leadership forum, and how are they delivering to the business?

- What best practices opinionated framework guides our selection of the primary tool stack and skills definitions?

A sizable portion of advanced AI efforts is investigating potential partners and knowledge resources, like IoT4Ag, both in industry and in academia. The focus goes well beyond mandating the choice of a single tool or a programming language. An **AI Center of Excellence** is a small cross-functional business leadership team that coordinates these activities. No one person is expected to read every academic paper, participate in all the conferences, or be an expert on every algorithmic technique. But the coordination and dissemination of AI needs to be driven for the portfolio of projects that are strategic to the business, to the wider community of practice.

Business leaders recognize the importance of starting with a clear requirements definition for the business opportunity. Product owners know that insights accumulated on the AI journey may cause directional adjustments as the team uncovers the truth from the data. At every level, teams must avoid having the pursuit of business value turn into simply a lab experiment with new technology. The promise of AI is real, but as data is explored, the findings may surprise everyone. This doesn’t mean making everybody a data scientist, but it calls for establishing data literacy throughout the extended enterprise. The community of practice is also an opportunity for individuals to share the rigor of what they are doing and how they are doing it. 

{{<tweet 1369738859248971776>}}

----

## Learning Resources

<a href="https://t.co/eZ2bbpDzwV?amp=1"><img alt="Machine Learning Flash Cards" src="https://pbs.twimg.com/profile_banners/11518572/1503261622/600x200" width="600"></a>

Machine learning is a broad field, encompassing aspects of computer science, statistics, and business communications. There are hundreds of concepts to learn. Chris Albon's hand drawn [flashcards](https://t.co/eZ2bbpDzwV?amp=1) are designed to help memorize key concepts in machine learning rapidly and enjoyably. I bought a set as a self-assessment, to walk through what I may need to learn (again?) to fill gaps. How many of the 300 have you mastered?

{{<youtube duMcYRtQITA>}}

The [Google Data Analytics Professional Certificate](https://grow.google/dataanalytics/#?modal_active=none) program has been released to the Coursera online learning platform. It it is self-paced, though they recommend a commitment of 10 hours per week. I expect that it will be very popular. Google is positioning the credential as the equivalent of a 4-year degree in their hiring process. No doubt this will influence many other companies to do the same, especially for professionals looking to change mid-career. If you enroll, I'd like to hear about your experience.

----

## Book recommendations

<a href="https://www.amazon.com/dp/B075DCKP7V"><img alt="The Book of Why: The New Science of Cause and Effect" src="https://images-na.ssl-images-amazon.com/images/I/417Y78D+TeL._SX331_BO1,204,203,200_.jpg" width="400"></a>

"Correlation is not causation." This mantra, chanted by scientists and engineers for more than a century, has led to a virtual prohibition on causal talk. **Today, that taboo is dead.** The causal revolution, instigated by Judea Pearl and his colleagues, has cut through a century of confusion and established causality -- the study of cause and effect -- on a firm scientific basis.

<a href="https://r4ds.had.co.nz/"><img alt="R for Data Science" src="https://d33wubrfki0l68.cloudfront.net/b88ef926a004b0fce72b2526b0b5c4413666a4cb/24a30/cover.png" width="400"></a>

**[R for Data Science](https://r4ds.had.co.nz/)** by [Hadley Wickham](https://twitter.com/hadleywickham) and [Garrett Grolemund](https://twitter.com/StatGarrett) is an excellent introduction to R and the Tidyverse. The [R for Data Science Online Learning Community](https://www.rfordatasci.com/) hosts book club-style weekly chapter discussions through their [Slack channels](http://r4ds.io/join). [Vebash Naidoo](https://twitter.com/sciencificity) has assembled a related [solutions guide supplement](https://sciencificity.github.io/R4DS_study_exams/index.html).

----

## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-03-01-data-evangelist-part-3/)

[AI and Data Strategy](https://jimgruman.netlify.app/post/ai-and-data-strategy/)

----

### Did you find this page helpful? Consider sharing it 🙌