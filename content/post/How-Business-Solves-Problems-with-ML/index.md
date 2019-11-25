---
date: '2019-11-24'
diagram: true
image: 
  caption: 'Image credit: [**Museums Victoria**](https://unsplash.com/photos/jc_WMrSJ8EY)'
  placment: 3
markup: mmark
math: true
title: How Your Business Can Solve Problems with Machine Learning
author: Jim Gruman
projects: []
slug: how-business-solves-problems-with-ml
categories:
  - R
tags:
  - R Markdown
---

Adapted from Jason's Bowling's November 2019 Medium article:

{{< tweet 1195750863765229568 >}}

---

Ads for artificial intelligence enhanced products are everywhere — if you’ve been to a business conference or talked to a tech vendor in the last several years, you’ve  certainly heard about it. Promises are everywhere that AI will streamline your business, provide valuable insights into your company’s existing data, and improve operations. The promises tend to be a little thin on detail — what, exactly, can it do?

All business leaders are asking the same question. This article presents a concise introduction to what AI can do, right now. Don't get bogged down in the math or programming techniques — the goal is to know what can be done to figure out how it might be applied to real business cases. Let’s get started.

First, a little terminology. Machine learning and deep learning are different methods of problem solving that fall under the umbrella of “artificial intelligence (AI)”. The way these are used is not particularly consistent, especially in marketing literature. For the purposes of this article, the key takeaway for the business person is that deep learning allows solving different kinds of problems than traditional machine learning algorithms, but is generally more expensive and time consuming to implement. It’s also under more active development, and is on the leading edge of what is possible, but you can do a great deal with traditional approaches at less cost.

---

> 1. If you have known categories of something, machine learning can sort things into those categories.

This is called classification. We can categorize visitors to a website into buckets based on click patterns, gaining insights to what the visitor is likely to buy or be interested in. Given some data about a person, a machine learning algorithm can categorize them as likely having an illness or not. Network traffic can be classified as malicious or not. Email can be classified as spam, or not spam. Machines which are likely to fail soon can be identified and maintenance performed prior to failure, based on vibration, current consumption, or other measurements.

Doing this requires a pile of examples that have been sorted into categories already, likely by a human expert. This is the hard and potentially expensive part, and it means that a business should consider collecting data for future use on a problem like this NOW, even if it’s not immediately clear how data might used later. You can’t train an algorithm to recognize a failing machine if you don’t have examples of both healthy and not healthy machines, and the business may not know that until after a machine fails.

Algorithms that learn from a set of carefully tagged examples are broadly categorized as supervised learning algorithms.

> 2. If the business has a bunch of examples of values, such as what something costs, a machine learning algorithm can learn to predict the value of something that is similar.

An excellent example of this is Zillow’s estimate of what a property is worth if you were to sell it today. Given the number of rooms, square footage, location, number of baths, and other variables, the algorithm makes a prediction based on what similar houses sold for. This is called a regression problem.

There are numerous ways regression problems might be useful to a business. Given the day of the year and load over the last few days, what load are we likely to see on our server today? How much sunscreen are we likely to sell? What’s a reasonable salary for a person, given experience and a list of skills? Regression can also be used to make financial forecasts.

Like classification, regression is a supervised learning technique and relies on having a significant set of tagged examples that the algorithm can learn from. Think of regression as an “eyeballed” value — a person can take a reasonable stab at it, and get fairly close. The power in machine learning regression is that of scale — it’s easy for a person to make a few dozen such estimates, but a machine can make tens of thousands of such predictions daily. It can be trained on new examples of data in minutes to hours, rather than years.

> 3. Machine learning can help you find underlying patterns in data that you didn’t know were there.

Supervised learning is powerful, but it has one major limitation — you have to have a good idea what you are looking for, and be able to generate a bunch of carefully tagged examples for the algorithm to learn from.

Algorithms can also be used to look at data and identify clusters of similar entries. This is a kind of unsupervised learning, since it’s not using tagged examples. The classic example is to identify various categories of visitor to your website by demographics and spending patterns.

> 4. Deep learning can learn to do things by trial and error.

An approach called reinforcement learning can be used to let a computer figure out how to do certain tasks by trying different approaches and seeing what works. A supervisor program assigns a score to each performance based on how well it did, and the learning algorithm makes incremental improvements until goals are met. This approach is useful when even a human expert isn’t sure what the ideal approach is, or where it’s hard to codify the rules. This approach has been used to let multi-legged robots figure out how to walk efficiently and to play video games.

> 5. Deep learning can find things in pictures and identify them with excellent accuracy. It can also generate text descriptions of a scene.

Deep learning has had a tremendous impact on image recognition. In the last few years, it has become fairly easy to train a computer to find and label objects within images. Given a large set of tagged example images, an algorithm is trained, which takes a large amount of computing power. The results are stored as a model, which can be run on much lower power computers. These models are available for download or as software services — you don’t need to train your own unless your images contain something specialized. The models, once trained, can be run on very modest compute devices — they can even be embedded into cameras directly.

Once objects are identified in a video stream, the motion of that object can be tracked. This allows the computer to count people passing through a door, keep track of cars in a parking deck, or other similar tasks. Models are available to isolate and read license plates in an image.

Deep learning models have also been trained to generate descriptions of the overall scene in a picture, with no human input. Models are also being developed to assist radiologists in reading medical imagery, and are getting quite good at doing tasks like finding tumors in CT or MRI scans.

> 6. Deep learning can generate new images or video.

Deep learning models can be trained to take an image or video and output a modified version of the input. Examples include automatic coloring of black and white images or video frames and generating art. There has also been a great deal of progress on generating fake video streams based on example video. So called “deep fake” videos can generate surprisingly convincing videos of a politician or celebrity giving a speech they never gave. The technology can also generate modified videos where a different person’s face is overlaid on the actor or actress in the original scene in a video.
Deep learning algorithms are also being trained to detect when a video or photograph has been generated in this way, as a countermeasure to potential hostile use of the technology.

> 7. Machine learning can extract useful information from written text.

Machine learning models performing text analysis (also called natural language processing) can be fed blocks of text and determine if the sentiment is mostly positive or negative. It can be used for monitoring social media or other comments about your brand, product and services, or analyzing other text data for useful business intelligence.

Like other machine learning applications, the important advantages of doing this with a machine are scale, speed, and cost. It becomes possible to examine huge sets of text data and extract useful information far more rapidly than would be possible with a human team.

> 8. Deep learning can generate fairly good written text.

The OpenAI team recently released GPT2, a deep learning text generation model. Given a few sentences, this model and others like it can generate paragraphs of reasonably coherent text that can appear to have written by a human. GPT2 can be used online to get a feel for what it can do. Pasting in the first few lines of an article from a news site automatically returns a block of text that looks much like a valid news article. The facts are not reliably correct, but it is written in a manner that is fairly believable. The OpenAI team delayed release of GPT2 because of internal concerns that it could be used to generate misleading news articles automatically.

It’s quite possible that models like GPT2 could be used to generate drafts of novels or other books in the near future, perhaps even simulating the styles of established authors. It is unclear what the copyright status of such works would be.

> Key points to remember

Keep these points in mind when considering ways that AI can be used in business. First, these technologies are now quite accessible to people who are not data scientists. We don’t need a large team of specialized software engineers to write them from scratch — we can use cloud software providers with relative ease. For in-house or custom work, there are excellent libraries that do the heavy lifting.

Instead, the effort should be directed at ensuring the quality of the data and determining the best ways to apply the available techniques. Consider where doing tasks that are simple for a human, but in a way that is vastly faster and with increased scope might benefit the business.

Finally, consider that the goal of these technologies need not be to replace humans in the work force. It can be used to reduce drudgery, improve accuracy and speed, and free professionals to do more creative tasks. The most successful organizations of the future will likely be those which best adapt to the new capabilities of machines, and blend them with the parts of the enterprise that are uniquely human.


[Jason Bowling on Medium](https://medium.com/@kb8rnu)

### Did you find this page helpful? Consider sharing it 🙌
