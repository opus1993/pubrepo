---
title: Practical Machine Learning in R
author: Jim Gruman
date: '2020-08-05'
format: hugo
slug: practical-machine-learning-in-r
categories:
  - Education, R
tags:
  - Education, R
featured: no
---

First, a disclosure. I know the authors of [Practical Machine Learning in R](https://www.wiley.com/en-us/Practical+Machine+Learning+in+R-p-9781119591535), as both professors [Fred Nwanganga](https://twitter.com/gangafred) and [Mike Chapple](https://twitter.com/mchapple) teach courses in the Notre Dame Mendoza MSBA program. It is a rare pleasure to be able to read a book and to hear the actual author's voice in the words. After finishing the MSBA program, I felt compelled to take this book up and explore the topics again. 

Over the last few years, machine learning has become the hot topic as a critical value creation tool. Executive leadership expects that robust data driven predictive tools be brought into their decision-making processes. Because machine learning spans several knowledge domains, best-selling books fall into a couple of categories. 

The first category are business books, focused on helping people by leveraging information technology. The world is changing rapidly in all fields. We all have a stake in defining AI ethics, security expectations, and even how best to deploy the tools. Among the books in this category, be sure to read Foster Provost & Tom Fawcett's [Data Science for Business: What You Need to Know About Data Mining and Data-Analytic Thinking](http://data-science-for-biz.com/) 

A second category of books are the technical guides written by academics and software providers. Many of these are also very good. See Garrett Grolemund and Hadley Wickham's [R for Data Science](https://r4ds.had.co.nz/) for an example.

As a bridge between these two categories, this book is billed as approachable and  hands-on, meant to provide readers with the step by step knowledge to harness algorithms along with business context. All of the code examples are presented in the R language. R is popular because it is free and easy to start working with. R's open-source community spans academia and industry, with thousands of mature open-source add-on packages available.

----

### Contents

> Explore data management techniques, including data collection, exploration and feature selection

> Describe the principles behind Nearest Neighbor, Decision Tree and Naive Bayes classification techniques

> Explain how to evaluate models, as well as improving model performance using ensemble methods such as Random Forest and XGBoost

> Briefly cover unsupervised learning techniques to identify patterns using approaches such as apriori, eclat and clustering

----

### What's missing from **Practical Machine Learning in R**?

Readers should look elsewhere for detailed instruction on crucial skills in statistics, SQL, data visualization, and computing architectures. Time series forecasting and geospatial topics warrant their own books as well. 

This book's section on linear regression models explores stepwise feature selection. This approach is problematic for several reasons, and a large literature exists that critiques the method (see Steyerberg, Eijkemans, and Habbema ([1999](https://bookdown.org/max/FES/references.html#ref-Steyerberg)), Whittingham et al. ([2006](https://bookdown.org/max/FES/references.html#ref-Whittingham)), and Mundry and Nunn ([2009](https://bookdown.org/max/FES/references.html#ref-Mundry))), and Harrell ([2015](https://bookdown.org/max/FES/references.html#ref-rms)).

The [`glmnet`](https://glmnet.stanford.edu/articles/glmnet.html) methodology offers a more robust technique for fitting generalized linear models and offers solutions to overfitting problems that can plague stepwise regression. Bradley Boehmke at the [University of Cincinnati R Programming Guide](http://uc-r.github.io/regularized_regression) offers a nice overview.

[Platt scaling](https://en.wikipedia.org/wiki/Platt_scaling) and model calibration should be explored in a practical course, along with weights, as more robust techniques for modeling for the imbalanced challenges that are more the rule than the exception.

Max Kuhn and Kjell Johnson's [Feature Engineering and Selection: A Practical Approach for Predictive Models](https://bookdown.org/max/FES/) offers a more thorough exploration of several other predictive modeling methods.

**Practical Machine Learning in R** uses R libraries that are mature, stable, and widely available, including the `tidyverse` and a little bit of `caret`. As of early 2021, the [`tidymodels`](https://www.tidymodels.org/) and [`mlr3`](https://mlr3book.mlr-org.com/) frameworks have emerged as the professional tools of choice. Watch for the release of the book [Tidy Modeling with R](https://www.tmwr.org/index.html) by Max Kuhn and Julia Silge as well.

----

### My Conclusion

*Practical Machine Learning in R* is a useful guide for aspiring business analysts. The publisher makes [code examples and exercise solutions](https://www.wiley.com/en-us/Practical+Machine+Learning+in+R-p-9781119591535) available. Independent learners will appreciate the approach that the authors have taken in carefully explaining every step. The book only just scratches the surface of what is available in the R ecosystem. In a learning journey with analytics, [Practical Machine Learning in R](https://www.wiley.com/en-us/Practical+Machine+Learning+in+R-p-9781119591535) sets a high standard for a solid, foundational instructional text.

----

### Did you find this page helpful? Consider sharing it 🙌

