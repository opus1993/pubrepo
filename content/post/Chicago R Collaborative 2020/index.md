---
title: Chicago R Collaborative 2020
author: Jim Gruman
date: '2020-04-19'
slug: Chicago-r-collaborative-2020
categories:
  - Open Source
markup: mmark
diagram: true
lastmod: '2020-04-19T20:06:16-05:00'
featured: yes
image:
  caption: ''
  placement: 3
  focal_point: ''
  preview_only: no
---

This weekend was my first ever Open Source R hackathon. This post covers my observations about what we set out to do, who I met, what I learned, and what we accomplished.

----

## What we set out to do

The [Chicago R Collaborative](https://chircollab.github.io/#page-top
) is an annual activity funded with an [R Consortium](https://www.r-consortium.org/projects/awarded-projects)-funded grant that supports community-led, locally-organized R development events around the world.

The challenge this weekend was to team up with other R users to contribute to open source packages, work on data tools, pursue projects we wish we had time for in our day-to-day work, and learn from others in our local R community. Collaboratives all over the world are dedicated to inspiring those new to open source to contribute to the R community. 

The event hosts marketed the event through social media channels about 3 months in advance. We each applied for an invitation after committing to the [code of conduct](https://chircollab.github.io/coc/). When invitations were sent, the event hosts solicited input on projects at a [Github Issues](https://github.com/chircollab) repository. 39 issues were submitted by 16 authors on a wide range of topics. For topics with a higher level of interest, slack channels were created on the topics themselves, as well as for #Announcements and #Community forums. 

The event originally was planned to be held on-campus at the University of Chicago. With the pandemic, the organizers regrouped and put together this remote hackathon. We convened via Zoom starting on Saturday at 10am.

----

## Who was involved

The four event organizers arranged for 13 mentors and ultimately [37 participants](https://chircollab.github.io/#team) for two days. Our backgrounds varied, including academia, consulting, several industries, and all levels of experience. 

After introductions, we had icebreaker discussions on topics including: 

1. What is one thing you don’t like about R, or what’s one thing you wish R did better? 

1. What are your favorite online resources, Twitter accounts, blog posts, talks, tutorials, etc. to learn about new topics in R, or to get inspiRation? (shameless plugs 100% allowed)

1. Are there fast ways to get a GitHub repo set up for “optimal” collaboration?

1. How do people go about visualizing data with lots of observations without aggregating them?

1. How do you feel about R 4.0? Is there anything that particularly excites or concerns you?

1. Do you use any of the R stuff in the PyData ecosystem (R and R packages with conda? R kernel(s) with Jupyter notebooks)? Do you know anyone who does?

1. What are challenges you face (cultural or technical) using R professionally and how do you handle these?

A takeaway: My challenges are in no way unique. After the preliminaries, the rest of the day was broken into time blocks of asynchronous work time and reservable tutorials, with three discrete zoom facilities and lots of Slack.

----

## What I learned

In addition to networking, I took a lot of notes on the topics most relevant to me. They included GitHub Therapy, Communities of Practices, and Learning Resources.

### GitHub Therapy

[John Blishak](https://twitter.com/jdblischak) and [Mauro Lepore](https://twitter.com/mauro_lepore) led an excellent tutorial on GitHub for Open Source community development. The video here is actually their practice run. In the live demo, we each forked their GitHub repo, pulled the upstream remote, modified an example file, committed it, pushed it back, and made a pull request for review. We also previewed new [`usethis`](https://usethis.r-lib.org/reference/index.html) R package functionality for setting up and managing from the R IDE. Continuous integration features were left out of this specific tutorial, but I'd like to follow up at a later time to learn about their view of the differences between GitHub Actions and Travis.

{{< youtube y8lOGz1yAj4 >}}

### Communities of Practice

[Adam Austin](https://twitter.com/just_add_data) hosted an open conversation on enterprise communities of practice. Some of the high points:

>How do you motivate yourself and your peers to learn more and keep up with development? **Find an accountability buddy** to keep on track and draw from their expertise

>**Advocacy and teaching** go together. Make your business partners look like heroes

>Save $$$ by reducing dependencies on legacy/licensed software

>Foster **inclusivity**. Welcome newcomers and beginners to empower them, and provide resources for learning

>Encourage development of junior staff on general topics, like how to give an effective presentation. Even engaged audience members won't look super enthusiastic. Ignore the gloomy stares and focus on your message. **Engage the audience early and often**

>The bar for meaningful contributions is lower than you think it is. **Imposter syndrome** might intimidate you, but you surely have something valuable that someone needs to hear, no matter how trivial it feels to you

>Encourage people to **pay it forward**. When they learn something new and exciting, ask them to mentor others around them. This scales knowledge and solidifies the mentors' understanding of what they know

>**Be accessible**. Have a resource for asking and answering questions, such as slack, teams, etc. Build a network of experts who can help new users troubleshoot and resolve problems

>Be sensitive that newcomers will have to learn on their free time. They still have to produce "real work" while learning on the side. They'll need a lot of support!

>How do you KEEP people engaged? They have to see the value. **Learning any new tool is HARD** and that's okay, but people will need motivation to keep going when it seems too hard. They have to have powerful end goals to keep them going

**Book Recommendation:**
[Cultivating Communities of Practice](https://www.amazon.com/Cultivating-Communities-Practice-Etienne-Wenger/dp/1578513308)

**Short article:**
[Seven Principles for Cultivating Communities of Practice](https://hbswk.hbs.edu/archive/cultivating-communities-of-practice-a-guide-to-managing-knowledge-seven-principles-for-cultivating-communities-of-practice)

### Learning resources

Prior to the event, [Sharla Gelfand](https://twitter.com/sharlagelfand) had prepared an empty bookdown framework to build a new [kableExtra Cookbook](https://sharlagelfand.github.io/kableExtra-cookbook/index.html) reference for the `kableExtra` R package. The package is widely used to make tables pretty in Rmarkdown document publication, and the package authors have already prepared good detailed technical vignettes. However, for most of us, a cookbook-style desk-side reference with native real-world examples can often be more handy and inspirational. As a team, our mission was to create page content examples from available datasets.

[Brooke Anderson](https://twitter.com/gbwanderson) did a lot of the work, and I was fortunate to have had the opportunity to follow along. If you look closely, Sharla was kind and added my name as an author, so I now feel obligated to come back and live up to that standing by providing more work beyond my meager submissions so far.

----

## What we accomplished

As of mid-afternoon on Sunday, 90 changes to 29 repositories were pushed via 16 contributors. Many of the improvements are very likely to be accepted by package maintainers.

Other accomplishments include an updated R interface package for the Google Civic API, numerous fixes to improve http behavior, a general xaringan template for other R Collaborative events, and `takehomecarpetries` take home tutorials.

Special thanks to Angela Li for all her efforts in orchestrating this event.
{{< tweet 1251994675281563651 >}}

----

### Did you find this page helpful? Consider sharing it 🙌