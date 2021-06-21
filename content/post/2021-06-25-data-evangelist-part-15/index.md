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

Back in January, in the [first Evangelist post](http://localhost:4321/post/2021-01-22-data-evangelist/), I proposed digital initiatives like workshops, newsletters and guest blogs, meetups, learning lunches, hackathons, and creating opportunities for others to craft documentation. The thinking was that a culture that educates and empowers through data evangelism efforts will be one that would reap many benefits. 

As I encounter more and more stakeholders on this journey, I am discovering that there is a vocabulary that we may each think we know, but we don't share the same understandings of what the words mean. In a perfect world, every employee and executive works under a well-defined, well known set of duties and responsibilities.

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

Artificial intelligence, machine learning, and neural networks are terms often used synonymously, but their distinctions are important and some general awareness is needed to be able to function effectively in cross functional teams. While there's no need for non-data scientists to understand exactly how machine learning (ML) works, we all should understand enough to use the basic terms correctly. The following glossary covers the fundamentals.

**A/B testing** – a user experience research methodology, used to compare two versions of a single object, typically by testing a response to variant A against variant B, and determining which of the two variants is more effective in achieving an objective.

**Clustering** – grouping objects based on similarity. For example, within an M&M population, the individuals within that population might be grouped by color or by type.

**Decision tree** –  a hierarchical flowchart-like structure in which each internal node represents a "test" on an attribute, each branch represents the outcome of the test, and each leaf node represents a class label. In machine learning, an optimized decision tree is one that minimizes a loss function, like miss-classification or regression error. Decision trees are simple to interpret and deploy.

**Deep learning** - a set of machine learning techniques that consist of sequences of layers, each consisting of a matrix of weights, with inputs and outputs to progressively extract higher-level features from the raw input. For example, in image processing, lower layers may identify edges, while higher layers may identify the concepts relevant to a human such as digits or letters or faces. The inter-connections of each layer resembles the neural connections in the human brain. 

**False negative** – a result that the model predicts to be negative but is in fact positive.

**False positive** – a result that the model predicts to be positive but is in fact negative.

**Features** – input variables used for prediction or inference.

**Feature engineering** – the process of determining which combinations and transformations of features should be used in a machine learning model.

**Holdout data** – a random selection of data that is completely withheld from training data to be later used to test the model performance for overfitting.

**Inference** – the theory, methods, and practice of forming judgments about the parameters of a population and their statistical relationships on the basis of random sampling and bootstrapping. Inference may suggest causality or how much the outcome changes when a given parameter changes.

**K-means** – a clustering technique that uses a numeric distance function to determine the similarity of examples.

**Label** – a supervised set of results defined by humans to train the machine learning model for.

**Random forest** – an bootstrapped aggregation ensemble of several small decision trees built on randomized subsets of features. Random forests are often more accurate than a single decision tree but are not as interpretable.

**Reinforcement learning** – a type of machine learning that uses a system of rewards and penalties in place of some direct labels.

**Supervised learning** – machine learning modeling that uses labeled data and the associated features.

**Training set** – subsets of the data used for training.

**Unsupervised learning** – clustering techniques that infer data groupings and is often used to discover insights in patterns in language or human behavior.

**Validation** – subsets of the training data used to tune the hyperparameters of many models and arrive at a best candidate model without overfitting.

Machine learning efforts should always be focused on a business objective and not on some accuracy criteria. For example, the economic impacts of the deployed model are not likely balanced between false positives and false negatives. Consider, for example, the cost of acquiring a customer or the revenue associated with keeping them once acquired.

The ML techniques that data scientists use depend upon many factors including the business problem to be solved, the data available, the level of accuracy required, time, inference, interpretability, etc. Often the most elegant solution is the simplest, not the most sophisticated or complex.

For more Data Science terms and concepts, check out Chris Albon's flash cards:

<a href="https://t.co/eZ2bbpDzwV?amp=1"><img alt="Machine Learning Flash Cards" src="https://pbs.twimg.com/profile_banners/11518572/1503261622/600x200" width="600"></a>

----

{{<tweet 1406300644567310340>}}

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

🚨 sarcasm ahead 🚨

How to create a great developer experience at our company...
*in the style of Charlie Munger, by [Zev Averbach](https://twitter.com/zevav)*:

1) Don’t document anything. The best thing is to have an oral tradition where, if someone has a question about how something works/where a certain kind of data lives, you either schedule a meeting with multiple stakeholders or blast an email out to some suggested contacts.

1) Barring this, have terribly written, never edited or curated, PDFs or SharePoint documents living in some obscure corner of the company’s intranet. Most importantly, make it so the only way you could ever find these PDFs is via the oral tradition described above.

1) If anyone takes up an initiative to create better, more accessible documentation, stop them immediately and ask where they got permission to do this.

1) During a pandemic, make zero effort to inquire about people’s internet speeds at home. This will prevent creating a lot of new work around allocating money and effort towards making sure everyone has sufficient bandwidth to do their work efficiently.

1) Keep the VPNs and firewalls running exactly as they had been running before the pandemic, since even though they’re going to be much more taxed with people working from home, we don’t want to ruffle any feathers by declaring these a hindrance to productivity – even if true.

1) Super important: To keep people on their toes, make sure they have to re-log into firewalls at least every 90 minutes; otherwise they may get into too much of a “flow” state and clear their plate of work too quickly. Allow conda and package management systems to operate only inside VPN, and k8s only outside VPN. 

1) If a developer wants to create something new, make sure that the path to doing so is as labyrinthine and discouraging as possible. We wouldn’t want our Azure bills getting too big because some big-brain has an innovative idea.

1) At minimum, three different parties from three separate departments should gatekeep the creation of new technical solutions. Along the lines of #1, make sure there’s either:

    - zero documentation of how to create new cloud assets, or at least that
    - the documentation is difficult to find, or even better, fragmented into multiple documents, each owned by a separate group. Only hire the most hostile and/or low-skilled people into the departments who hold the keys to the aforementioned gates.

1) When doing a re-org, make as many decisions as possible behind closed doors and without consulting your developers. All technology is the same, as are all technologists. Did we hire someone on the strength of their Python skills? They’ll make a perfectly great DBA;

1) no need to consult them or the people who are currently doing that job. Is someone conversant in SQL? Great, they should definitely be writing Python scripts then, because all technology _is the same_.

1) When deciding who should manage your developers, only bring people in who have never touched a single line of SQL or other code, let alone managed servers or continuous integration pipelines.

1) There are two ways that this helps: 

    - It keeps an air of mystery between managers and developers, where one is never quite sure what the other is up to.
    - The company can be sure to contribute maximally to the economy by hiring people who can only do half of the job, at best, thus ensuring job security for all. Finally, hire in alignment with #1 by de-emphasizing writing skills.

1) If a developer wants the ear of someone with the power to make significant changes to any of the above three points, make sure that they have to go through at least four layers of management to do so.

1) If they reach out directly to decisionmakers, be firm and clear with them that this is a violation of chain of command. DO NOT reach out to developers with surveys or 1o1s about how they find the DX at the company. (See above points about not making more work than we have to)

🚨 end sarcasm 🚨

----

## R for Excel users

In my senior year of undergraduate engineering, Lotus 1-2-3 replaced FORTRAN as the go-to tool for data analysis. Excel eventually replaced 1-2-3 as the killer app. The vast majority of users became fairly proficient with the tool in just days, building all sorts of reports and graphics. When you think about it, this is an amazing aspect of Excel. Every day, people open up a spreadsheet to do data entry and then, bit by bit, learn to do increasingly complex analytical tasks. Excel is a master at teaching people how to use Excel.

R is not like that. 

This is the basic pain of learning to write in code. Programming languages are designed to be general in their application and to accomplish a huge variety of complex tasks with the same basic set of tools. The cost of this generality is a learning curve. When you start learning to do basic tasks in R, you are also learning how to do complex things down the road. As you learn more and more, the marginal cost of complex analyses goes down.  

For a lot of us, the pain of learning to program feels like the pain of failure. When the program gives an incomprehensible error message it feels like it’s telling you that you’re stupid and lack programming aptitude. The pain you feel is not the pain of failure, it’s just the pain of learning.

Many of the people who do learn R have some background in programming. The mental models underlying languages like Matlab or Python, as well as statistical packages like SPSS and SAS, have a lot in common with R, and there are many resources available for translating the bits which don’t make sense. Excel makes you think about analytical problems in a very different way, and there aren’t very many resources for translating the two paradigms.

Gordon Shotwell observes that there are [four fundamental differences between R and Excel](https://shotwell.ca/posts/r_for_excel_users/):

### Text-based analysis
Excel is based on the physical spreadsheet, or a ledger. At one time this was a large piece of paper with rows and columns. Records were stored in the first column on the left, calculations on those records were stored in the boxes to the right, and the sum of those calculations was totaled at the bottom. The data and computation are stored in the same place. Data is identified by its location on the grid. Usually you don’t name a data range in Excel, but instead refer to it by its location. 

In R, data and computation are separate. You have one file which stores the data and another file which stores the commands with instructions for manipulating the data. This leads to a procedural kind of model in which the raw data is fed through a set of instructions and the output pops out the other side. Data is generally referenced by name. 

### Data structures
Excel has only one basic data structure: the cell. Cells are extremely flexible in that they can store numeric, character, logical or formula information. The cost of this flexibility is unpredictability. For instance you can store the character “6” in a cell when you mean to store the number 6.

The basic R data structure is a vector. You can think of a vector like a column in an Excel spreadsheet with the limitation that all the data in that vector must be of the same type. If it is a character vector, every element must be a character; if it is a logical vector, every element must be TRUE or FALSE; if it’s numeric you can trust that every element is a number. There’s no such constraint in Excel: you might have a column which has a bunch of numbers, but then some explanatory test intermingled with the numbers. This isn’t allowed in R.

### Iteration
Iteration is one of the most powerful features of programming languages and is a big adjustment for Excel users. Iteration is just getting the computer to do the same thing over and over again for some period of time. Maybe you want to draw the same graph based on fifty different data sets, or read and filter a lot of data tables. In a programming language like R you write a script which works for all of the cases which you want to apply it to, and then tell the computer to do the application.

Excel analysts do a lot of this iteration manually. For instance if an Excel analyst wanted to combine ten different .xls files into one big file, they would probably open each one individually, copy the data, and paste it into a master spreadsheet. The analyst is effectively taking the place of a for loop by doing one thing over and over again until a condition is met.

### Simplification through abstraction
Another major difference is that programming encourages you to simplify your analysis by abstracting common functions from that analysis as entirely new functions. There’s really no analog for these kinds of functions in an Excel-based workflow.

{{<tweet 1407010171755368448>}}

-----

## Upcoming Events

These are opportunities to engage and learn about analytics, data science, and AI from peers.

:star: June 24 [Data Science Leader Fireside Chat](https://www.meetup.com/RStudio-Enterprise-Community-Meetup/events/278386492/) with John Thompson, Global Head of Advanced Analytics & AI at CSL Behring

:star: July 5-9th [useR!2021](https://user2021.r-project.org/)

:star:️ September 6-10th [EARL Conference 2021](https://info.mango-solutions.com/earl-2021#:~:text=EARL%202021%206%2D10th%20September,of%20the%20world%27s%20leading%20practitioners)

:star: September 8-10 [New York R Conference](https://twitter.com/rstatsai)

:star: September 16-17 [INFORMS Midwest Regional Analytics Conference](http://meetings2.informs.org/wordpress/regional-analytics-midwest2021/) Chicago Chapter hosting, virtual event

----

## Book Recommendation

<a href="https://www.bigbookofr.com/"><img src="https://rzine.fr/publication/20210102_big_book_of_r/featured_hu78e119a2b20a9729ac08e064cff5daba_50225_720x0_resize_lanczos_2.png" alt="Analytics How Intelligence" width="400"/></a>

This isn't a book to buy. Think of it as a page to bookmark as a resource to find other books. [Oscar Baruffa](https://twitter.com/OscarBaruffa) maintains the listing as a public service. He is writing another book on Data Science Project Management, and has recorded a handful of insightful videos on [job postings](https://oscarbaruffa.com/jobs/).

----

## Related posts

[the last post of the Data Evangelist series](https://jimgruman.netlify.app/post/2021-06-09-data-evangelist-part-14/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it :raised_hands:
