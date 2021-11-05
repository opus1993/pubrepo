---
title: The Data Evangelist
subtitle: "Perspectives on building the Data Science Community"
summary: ""
authors: [Jim Gruman]
categories: 
  - Business, Data Science
tags: 
  - Data Science
date: 2021-06-21
featured: false
draft: false
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "image by Romain Vignes on UnSplash"
  focal_point: "Bottom"
  preview_only: false
projects: []
---

Back in January, in the [first Evangelist post](http://localhost:4321/post/2021-01-22-data-evangelist/), I proposed digital initiatives like workshops, newsletters and guest blogs, meetups, learning lunches, hackathons, and creating other opportunities. The thinking was that a culture that educates and empowers through data evangelism efforts will be one that would reap many benefits. 

As I encounter more and more stakeholders on this journey, I am discovering that there is a vocabulary that we may each think we know, but we don't share the same understandings of what the words mean. In a perfect world, every employee and executive works under a well-defined, shared vocabulary.

Data science isn’t that world.

So for this, the fifteenth post of the series, we will focus on the question:

> Just what is machine learning?

Whatever prompted you to read this, I hope that you come away with a handful of useful insights for your own work. The content:

- A Data Science Glossary
- Data Science Roles
- R for Excel Users
- Upcoming Events
- and a book recommendation

----

Tarun Kataria has accumulated experience leading analytics efforts at Coca-cola, Georgia Pacific and now Mars. In this podcast episode he offers a handful of useful frameworks to stay focused on the right things. Mars is a private company with a serious mission including climate change, food shortages, gender and racial equality, and other social issues. Behind the company’s many priorities lies a robust, highly intentional analytics capability that is a model for others to pay attention to. (26 minutes)

<iframe style="border: none" src="//html5-player.libsyn.com/embed/episode/id/18626267/height/90/theme/custom/thumbnail/yes/direction/backward/render-playlist/no/custom-color/72afff/" height="90" width="100%" scrolling="no"  allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>

----

## A Data Science Glossary

Artificial intelligence, machine learning, and neural networks are terms often used synonymously, but their distinctions are important and some general awareness is needed to be able to function effectively in cross functional teams. While there's no need for non-data scientists to understand exactly how machine learning (ML) works, we all should understand enough to use the basic terms correctly. The following [glossary](https://developers.google.com/machine-learning/glossary/) covers the fundamentals.  

**A/B testing** – a statistical user experience research methodology, used to compare two (or more) techniques, typically an incumbent against a new rival. A/B testing aims to determine not only which technique performs better but also to understand whether the difference is significant. 

**Bias** - Systematic error introduced by a sampling or reporting procedure. - or - Stereotyping, prejudice or favoritism towards some things, people, or groups over others. These will affect interpretation of data, the design of the system, and how users interact with a system.

**Categorical** - Features having a discrete set of possible values. 

**Clustering** – grouping objects based on similarity. Many clustering algorithms exist. 

**Decision tree** –  a flowchart-like structure in which each internal node represents a "test" on an attribute, each branch represents the outcome of the test, and each leaf node represents a class label. In machine learning, an optimized decision tree is one that minimizes a loss function, like miss-classification or regression error. Decision trees are simple to interpret and deploy.

**Deep learning** - a set of machine learning techniques that consist of sequences of layers, each consisting of a matrix of weights, with inputs and outputs to progressively extract higher-level features from the raw input. For example, in image processing, lower layers may identify edges, while higher layers may identify the concepts relevant to a human such as digits or letters or faces. The inter-connections of each layer resembles the neural connections in the human brain.

**Embeddings** - A categorical feature represented as a continuous-valued feature. Typically, an embedding is a translation of a high-dimensional vector into a low-dimensional space, built with a deep learning technique.

**False negative** – a result that the model predicts to be negative but is in fact positive.

**False positive** – a result that the model predicts to be positive but is in fact negative.

**Features** – input variables used for prediction or inference.

**Feature engineering** – the process of determining which combinations and transformations of features should be used in a machine learning model.

**Federated learning** - A distributed machine learning approach that trains machine learning models using decentralized examples residing on devices such as smartphones. In federated learning, a subset of devices downloads the current model from a central coordinating server. The devices use the examples stored on the devices to make improvements to the model. Since the training examples are never uploaded, federated learning follows the privacy principles of focused data collection and data minimization.

**Holdout data** – a random selection of data that is completely withheld from training data to be later used to test the model performance for overfitting.

**Inference** – the theory, methods, and practice of forming judgments about the parameters of a population and their statistical relationships on the basis of random sampling and bootstrapping. Inference may suggest causality or how much the outcome changes when a given parameter changes.

**Interpretability** - The degree to which a model's predictions can be readily explained to a general audience. Deep models are often non-interpretable; that is, a deep model's different layers can be hard to decipher. By contrast, linear regression models and decision trees are typically far more interpretable.

**K-means** – a clustering technique that uses a numeric distance function to determine the similarity of examples.

**Label** – a supervised set of results defined by humans to train the machine learning model for.

**Majority class** - The more common label in a class-imbalanced dataset. For example, given a dataset containing 99% non-spam labels and 1% spam labels, the non-spam labels are the majority class.

**Metric** - A performance number that you care about. It may or may not be directly optimized in a machine-learning system. A metric that your system tries to optimize is called an objective.

**Overfitting** - Creating a model that matches the training data so closely that the model fails to make correct predictions on new data.

**Perceptron** - A system that takes in one or more input values, runs a function on the weighted sum of the inputs, and computes a single output value. The function is typically nonlinear, such as *ReLU*, *sigmoid*, or *tanh*. Perceptrons are the nodes in deep neural networks. That is, a deep neural network consists of multiple connected perceptrons, plus a backpropagation algorithm to introduce feedback.

**Random forest** – an bootstrapped aggregation ensemble of several small decision trees built on randomized subsets of features. Random forests are often more accurate than a single decision tree but are not as interpretable.

**Reinforcement learning** – a type of machine learning that uses a system of rewards and penalties in place of some direct labels.

**Recommendation system** - A system that selects for each user a relatively small set of desirable items from a large corpus. For example, a video recommendation system might recommend two videos from a corpus of 100,000 videos, selecting *Casablanca* and *The Philadelphia Story* for one user, and *Wonder Woman* and *Black Panther* for another. 

**Sentiment analysis** - Using statistical or machine learning algorithms to determine a group's overall attitude—positive or negative—toward a service, product, organization, or topic. 

**SLA** - The service level agreement document that details the operational content, support quality measures, and the means of problem resolution. ML projects have unique challenges in ongoing performance monitoring, latency benchmarks, capacity, and deciding when to train new models.

**Supervised learning** – machine learning modeling that uses labeled data and the associated features.

**Survival analysis** - a branch of statistics for modeling the expected duration of time until an event of interest occurs, such as death in biological organisms and failure in mechanical systems. This topic is called reliability theory or reliability analysis in engineering, duration analysis or duration modelling in economics, and event history analysis in sociology. The training data in survival analysis is censored.

**Time Series** - A subfield of machine learning and statistics that analyzes temporal data and uses the time/date as an independent feature.

**Training set** – subsets of the data used for training.

**Unsupervised learning** – clustering techniques that infer data groupings and is often used to discover insights in patterns in language or human behavior.

**Validation set** – subsets of the training set used to tune the hyperparameters of many models and arrive at a best candidate model without overfitting.

Machine learning efforts should always be focused on a business objective and not only on accuracy. For example, the economic impacts of the deployed model are not likely balanced between false positives and false negatives. Consider, for example, the cost of acquiring a customer or the revenue associated with keeping them once acquired.

The ML techniques that data scientists use depend upon many factors including the business problem to be solved, the data available, the level of accuracy required, time, inference, interpretability, etc. Often the most elegant solution is the simplest, not the most sophisticated or complex.

For more Data Science terms and concepts, check out Chris Albon's flash cards:

<a href="https://t.co/eZ2bbpDzwV?amp=1"><img alt="Machine Learning Flash Cards" src="https://pbs.twimg.com/profile_banners/11518572/1503261622/600x200" width="600"></a>

----

{{<tweet user="DynamicWebPaige" id="1406300644567310340" >}}

## Data Science Roles

“Data Scientist”, “Machine Learning Developer”, “Deep Learning Engineer”, “Data Engineer”, “ML Ops Engineer”, and “Data Analyst” are often overloaded role titles -- and not necessarily indicative of the day-to-day work, or the tools they are using to accomplish that work.

To better understand and characterize these diverse user segments, [Paige Bailey](https://twitter.com/DynamicWebPaige) used tools, libraries, and frameworks referenced in the [Kaggle: State of Machine Learning and Data Science 2020 Survey](https://www.kaggle.com/kaggle-survey-2020) to cluster professionals into cohort groups. The full report is [here](https://github.com/dynamicwebpaige/kaggle-survey-spelunking/blob/main/README.md).

Her executive summary: 

> Survey respondents are overwhelmingly performing exploratory analysis using small- to medium-sized data sets stored as flat files, on local machines. Machine learning projects – if ML is being attempted at all – are in early stages, using traditional methods that are best-suited for high-RAM CPU rather than GPU SKUs.

> Based on responses, data science teams trend small (0-5 engineers), with light rigor on SDLC best practices (ex: version control); and most data scientists come from non-CS backgrounds, with minimal programming experience. Preferred tools are overwhelmingly open-source and non-proprietary. If Visual Studio Code is being used by survey respondents, it is most often being used for non-interactive, production machine learning and data science work.

| Cohort | Description | Most Common IDEs |
| ----------- | ----------- | ----------- |
| Beginners (new to programming) | New to programming, data science, and machine learning. Canonical example would be high school and college students. Primary mechanism to learn is video content (Coursera, YouTube, EdX, etc.). | Hosted notebooks (ex: Colab) or Jupyter notebooks |
| Beginners (current software engineers, new to ML) | New to data science and ML, and just beginning to learn. Most commonly come from an app development background. | PyCharm, VS Code, Visual Studio, other software IDE |
| Data Analyst | Use data to help understand business problems or research questions. Minimal (if any) statistics background. | Excel or Google Sheets | 
| Data Scientist – Business, EDA | Use data to help understand business, logistics, or supply chain problems. | Jupyter/JupyterLab, RStudio |
| (Data) Scientist – Academic, EDA | Use data to help understand problems in the physical, biological, social, or natural sciences. | MATLAB, Jupyter/JupyterLab, RStudio |
| Data Scientist – Business, Traditional ML | Just beginning to use machine learning methods to solve business problems, and to complement exploratory data analysis techniques. | Jupyter/JupyterLab, RStudio |
| ML Researcher – Academic, Traditional ML | Just beginning to use machine learning methods to solve research questions, and to complement exploratory data analysis techniques. | Jupyter/JupyterLab, MATLAB, RStudio |
| Deep Learning Researcher (small-scale) | Similar to the traditional machine learning segment; most comfortable with medium-sized data sets and local machines. | Jupyter/JupyterLab, PyCharm |
| ML Framework Builder, or High-Level Deep Learning API Builder | Authors of scikit-learn, Keras, PyTorch Lightning, and other similar tools. | Jupyter/JupyterLab, PyCharm or VS Code |
| Deep Learning Engineer (large-scale) | The NeurIPS, ICML, and ICLR contingent; these are the researchers you would expect to see hired at OpenAI, Google Brain, etc. | Jupyter/JupyterLab, PyCharm or VS Code |
| Deep Learning Framework Builder | Authors of low-level APIs for TensorFlow, JAX, and PyTorch; distributed training frameworks, like Ray; and similar. | PyCharm or VS Code |
| ML Ops Practitioner | The engineers who productionize ML systems; responsible for running, maintaining, and debugging ML pipelines (from ETL through deployment). Usually do not have a background in machine learning. | Visual Studio, VS Code, PyCharm (or other JetBrains tools) |

Teams that have the best understanding of how each fits into the company’s goals are best positioned to deliver successful outcomes. No matter the role, accelerated computing infrastructure is also key to powering success throughout the pipeline as capabilities move from analytics to advanced AI.

----

{{<youtube yT7QVwBGY-M >}}

----

Adel speaks here with [Barr Moses](https://www.linkedin.com/in/barrmoses/), CEO and co-founder of data reliability company Monte Carlo on the importance of data quality and how data observability creates trust in data throughout the organization. Previously, she was VP Customer Operations at Gainsight, a management consultant at Bain & Company, and served in the Israeli Air Force as a commander of an intelligence data analyst unit. (43 minutes)

<iframe width="100%" height="166" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1067345488&color=ff5500&hide_related=true&show_teaser=false"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/dataframed" title="DataFramed" target="_blank" style="color: #cccccc; text-decoration: none;">DataFramed</a> · <a href="https://soundcloud.com/dataframed/creating-trust-in-data-with-data-observability" title="#64 Creating Trust in Data with Data Observabilty" target="_blank" style="color: #cccccc; text-decoration: none;">#64 Creating Trust in Data with Data Observabilty</a></div>

----

## R for Excel users

In my senior year of undergraduate engineering, Lotus 1-2-3 replaced FORTRAN as the go-to tool for data analysis. Excel eventually replaced 1-2-3 as the killer app. The vast majority of users became fairly proficient with the tool in just days, building all sorts of reports and graphics. When you think about it, this is an amazing aspect of Excel. Every day, people open up a spreadsheet to do data entry and then, bit by bit, learn to do increasingly complex analytical tasks. Excel is a master at teaching people how to use Excel.

R is not like that. 

Like it or not, this is the pain of learning to write in code. Programming languages are designed to be general in their application and to accomplish a huge variety of complex tasks with the same basic set of tools. The cost of this generality is a learning curve. When you start learning to do basic tasks in R, you are also learning how to do complex things down the road. As you learn more and more, the marginal cost of complex analyses goes down.  

For many of us, the pain of learning to program feels like the pain of failure. When the program gives an incomprehensible error message it feels like it’s telling you that you’re stupid and lack the programming aptitude. Consider that the pain you feel is not the pain of failure, it’s just the pain of learning.

Some of the people that learn R have some background in programming. The mental models underlying languages like Matlab or Python have a lot in common with R, and there are many resources available for translating the bits that don’t make sense. Excel makes you think about analytical problems in a very different way, and there aren’t very many resources for translating the two paradigms.

On this digital journey, even in 2021 there remains a huge barrier between people that code and people that do not code to get work done. I am observing that, generally, the coders thrive in communities of practice and seek out new ways of building solutions. On the surface, non-coders appear to be... frustrated with the status of projects.

{{<tweet user="abhi1thakur" id="1407278287760543745" >}}

Consistent delivery to digital SLAs requires that every team member have a minimum of understanding of the common parlance of machine learning.

-----

## Upcoming Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

:star: June 24 [Data Science Leader Fireside Chat](https://www.meetup.com/RStudio-Enterprise-Community-Meetup/events/278386492/) with John Thompson, Global Head of Advanced Analytics & AI at CSL Behring

:star: July 5-9th [useR!2021](https://user2021.r-project.org/)

:star:️ September 6-10th [EARL Conference 2021](https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

:star: September 8-10 [New York R Conference](https://twitter.com/rstatsai)

:star: September 16-17 [INFORMS Midwest Regional Analytics Conference](http://meetings2.informs.org/wordpress/regional-analytics-midwest2021/) Chicago Chapter hosting, virtual event

{{<tweet user="MeganRisdal" id="1407010171755368448" >}}

----

## Book Recommendation

<a href="https://www.bigbookofr.com/"><img src="https://oscarbaruffa.com/wp-content/uploads/2020/12/Big-Book-of-R_header-1-1024x546.png" alt="Big Book of R" width="400"/></a>

This isn't a book to buy. Think of it as a page to bookmark as a resource to find other books. [Oscar Baruffa](https://twitter.com/OscarBaruffa) maintains the listing as a public service. He is writing another book on [Project Management for Data Analysts](https://oscarbaruffa.com/pm/) that I am very much looking forward to reading, and has recorded a handful of insightful videos on [job postings](https://oscarbaruffa.com/jobs/). 

<a href="https://oscarbaruffa.com/pm/"><img src="https://i1.wp.com/oscarbaruffa.com/wp-content/uploads/2021/06/Attachment_1622997724.jpeg" alt="Project Management Fundamentals for Data Analysts" width="400"/></a>

----

## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-06-09-data-evangelist-part-14/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
