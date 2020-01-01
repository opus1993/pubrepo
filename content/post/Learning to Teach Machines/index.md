---
date: "2019-12-29"
diagram: true
image: 
  caption: 'Image credit: [**Nikhita S @kryptonitenicky**](https://unsplash.com/photos/NsPDiPFTp4c)'
  placment: 3
markup: goldmark
math: true
title: Learning to Teach Machines
author: Jim Gruman
projects: []
slug: learning-to-teach-machines
categories:
  - R
tags:
  - Deep Learning
---

Alison Hill recently shared a more or less comprehensive list of resources, organized roughly in the order they are most helpful for beginners. These were all written before the release of the R Tidymodels, Recipes, and Drake packages. Even so, they provide a very good foundation and they execute well on Microsoft's dated R Open distribution currently provided with the Azure DSVM and HDInsight.

[Machine Learning for Everyone](https://vas3k.com/blog/machine_learning/)
**In simple words. With real-world examples.** The biggest hurdle to getting started is sifting through both the hype and the math. This is a readable illustrated introduction to key concepts that will help you start building your own mental model of this space. For example, “the only goal of machine learning is to predict results based on incoming data. That’s it.” There you go! Start here.

{{< figure src="./7w1.jpg" title="" lightbox="true" >}}

[Machine learning: a primer](https://www.nature.com/articles/nmeth.4526)
by Danilo Bzdok, Martin Krzywinski & Naomi Altman, from the Nature Methods Points of Significance collection. This collection in general is straight-forward with great visuals.

[Supervised Machine Learning by Julia Silege](https://supervised-ml-course.netlify.com/)
Taught with R and the caret package, this is a solid next step in your machine learning journey as you’ll start doing ML right away in your browser using an innovative course delivery platform. You’ll also get to play with data that is not iris, titanic, or AmesHousing. 

[Hands on Machine Learning in R](https://bradleyboehmke.github.io/HOML/) by Bradley Boehmke & Brandon Greenwell. Another great way to learn concepts plus code, and another one that focuses on the caret package. Each chapter maps onto a new learning algorithm, and provides a code-through with real data from building to tuning. The authors also offer practical advice for each algorithm, and the “final thoughts” sections at the end of each chapter will help you tie it all together.

[Interpretable Machine Learning: A Guide for Making Black Box Models Explainable](https://christophm.github.io/interpretable-ml-book/) the whole book is excellent and well-written.

Model evaluation, model selection, and algorithm selection in machine learning- a 4-part series by Sebastian Raschka. This is a a great evidence-based, thorough overview of the methods for machine learning. Alison noted that he walks you step-by-step from the simplest methods like the holdout method up to nested cross-validation:

- [Part 1: The Basics](https://sebastianraschka.com/blog/2016/model-evaluation-selection-part1.html)
- [Part 2: Bootstrapping and Uncertainties](https://sebastianraschka.com/blog/2016/model-evaluation-selection-part2.html)
- [Part 3: Cross-validation and hyperparameter tuning](https://sebastianraschka.com/blog/2016/model-evaluation-selection-part3.html)
- [Part 4: Part IV - Comparing the performance of machine learning models and algorithms using statistical tests and nested cross-validation](https://sebastianraschka.com/blog/2018/model-evaluation-selection-part4.html)

At this point, if you can read through the above resources and you are no longer feeling awash in new terminology, your vocabulary and mental model are in pretty good shape! That means you are ready for the next step, which is to read Max Kuhn and Kjell Johnson’s new book:

[Feature Engineering and Selection: A Practical Approach for Predictive Models](http://www.feat.engineering/)

------

[April Hill's post](https://alison.rbind.io/post/2019-12-23-learning-to-teach-machines-to-learn/)

### Did you find this page helpful? Consider sharing it 🙌


