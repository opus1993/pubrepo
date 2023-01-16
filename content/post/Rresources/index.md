---
date: "2023-01-16"
diagram: true
image: 
  caption: 'Image credit: [Artwork by @allison_horst](https://github.com/allisonhorst/stats-illustrations/blob/master/rstats-artwork/code_hero_rstats.png)'
  placement: 10
markup: goldmark
math: true
title: R Resources
author: Jim Gruman
projects: []
slug: Education, R
categories:
  - Education, R
tags:
  - Education, R
---
My short list of useful books, courses, and expert blogs. Many are free. These could be departure points for your own learning journey. My hope is that you take and copy sections for sharing with your own community of practice. 

Yes, I am giving away all of the secrets. One of the things that I spend a lot of time thinking about is how to communicate about data science with other human beings. It is often too easy to focus on “just” the technical skills like being able to wrangle, explore, analyze, and visualize data. Describing, documenting, planning, collaborating, questioning, and communicating effectively is harder than it sounds. When team members each have a baseline of shared competencies, we work better together on the problems we face.

I re-visit the content of this list a few times a year as my work takes me further away from coding and more into defining how best to build production solutions. Many of you, too, will eventually be drawn into roles somewhere between educator, developer advocate, [R admin](https://kelly-obriant.medium.com/r-in-production-devops-and-the-importance-of-empathetic-witnesses-78ecf4430e36), and devops engineer. Every R user also needs to have some exposure to a handful of Python libraries, YAML, DevOps and other tools that I mark with stars :star:.  Tell me about what is good here, and what was missed.

Inspired by these excellent pages:
> Paul VanDerLaken's [R resources](https://paulvanderlaken.com/2017/08/10/r-resources-cheatsheets-tutorials-books/?blogsub=confirming#533)

> Nathan Stephens's [Professional R Tooling and Integration](https://www.rstudio.com/resources/webinars/professional-r-tooling-and-integration/)

> Oscar Baruffa's [Big Book of R](https://www.bigbookofr.com/) 

> Martin Monkman's [Data Science with R: A Resource Compendium](https://bookdown.org/martin_monkman/DataScienceResources_book/)

----
## The R Community

R is incredible software for statistics and data science. But while the bits and bytes of software are an essential component of its usefulness, software needs a community to be successful. And that's an area where R really shines, as Shannon Ellis explains in this lovely [ROpenSci blog post](https://ropensci.org/blog/blog/2017/06/23/community). For software, a thriving community offers developers, expertise, collaborators, writers and documentation, testers, agitators (to keep the community and software on track!), and so much more. 

A brief list of sources that has helped me feel informed and included in the community:

|    |    |
|:---|:---|
| [R for Data Science Online Learning Community](https://www.rfordatasci.com/)|R4DS hosts interactive Slack channels (button in the upper right hand corner) for community news, book clubs, meetup events, birds-of-a-feature groups, and career tips |
| [bookdown.org](https://bookdown.org/) | Bookdown is an open source R-package that makes writing and publishing technical books easy. This website is a collection of recent books. |
| **[#TidyTuesday](https://github.com/rfordatascience/tidytuesday/blob/master/README.md)** | [R4DS](https://twitter.com/rstats4ds)'s weekly data project aimed at creating opportunities to develop understanding in how to summarize data to make meaningful charts. You will find the hashtag in use by the community over on Twitter.|
| [Data Science StreamRs](https://rpodcast.shinyapps.io/shinycal/)| Several data science professionals and hobbyists video stream their projects and share their knowledge |

----
## Introductory Books

Every one of us starts our journey from somewhere. 

|     |    | 
|:---|:---:|
|**[R for Data Science](https://r4ds.had.co.nz/)** by [Hadley Wickham](https://twitter.com/hadleywickham) and [Garrett Grolemund](https://twitter.com/StatGarrett) is an excellent introduction to the Tidyverse. The [R for Data Science Online Learning Community](https://www.rfordatasci.com/) hosts book club-style weekly chapter discussions through their Slack channels. [Vebash Naidoo](https://twitter.com/sciencificity) has assembled a related [solutions guide supplement](https://sciencificity.github.io/R4DS_study_exams/index.html).|<a href="https://r4ds.had.co.nz/"><img alt="R for Data Science" src="https://d33wubrfki0l68.cloudfront.net/b88ef926a004b0fce72b2526b0b5c4413666a4cb/24a30/cover.png" width="250"></a>|
|**[R Cookbook](https://rc2e.com/)** by [JD Long](https://twitter.com/CMastication), [Paul Teetor](https://twitter.com/pteetor) and [R-Cookbook](https://twitter.com/R_cookbook) is full of how-to recipes, each of which solves a specific problem. The recipe includes a quick introduction followed by a discussion that unpacks the solution and provides insight into how it works.|<a href="https://rc2e.com/"><img alt="R Cookbook, 2nd Edition" src="https://rc2e.com/images_v2/book_cover.jpg" width="250"></a>|

Other books for those starting from Excel and basic statistics:
|   |    | 
|:---|:---|
| [Data Science: A First Introduction](https://ubc-dsci.github.io/introduction-to-datascience/) | by [Tiffany-Anne Timbers](https://twitter.com/TiffanyTimbers), Trevor Campbell, and Melissa Lee |
| [R Programming for Data Science](https://bookdown.org/rdpeng/rprogdatascience/) | by [Roger Peng](https://twitter.com/rdpeng)|
| **[YaRrr! The Pirate’s Guide to R](https://bookdown.org/ndphillips/YaRrr/)** |by [Nathaniel D Phillips](https://twitter.com/YaRrrBook)|
| [ModernDive Statistical Inference via Data Science](https://moderndive.com/index.html)|by [Chester Ismay](https://twitter.com/old_man_chester) and [Albert Kim](https://twitter.com/rudeboybert)|
| [Learning Statistics with R](https://learningstatisticswithr.com/) |by [Danielle Navarro](https://twitter.com/djnavarro)|
| [Statistical Inference via Data Science (2018)](https://moderndive.com/2-viz.html) |by [Chester Ismay](https://twitter.com/old_man_chester) and [Albert Y. Kim](https://twitter.com/rudeboybert)|
| [Answering questions with data](https://crumplab.github.io/statistics/) |by [Matt Crump](https://twitter.com/MattCrump_)|
| [Statistical Thinking for the 21st Century](https://statsthinking21.github.io/statsthinking21-core-site/) | by [Russ Poldrack](https://twitter.com/russpoldrack) |

Read the [basic R manual](https://cran.r-project.org/doc/manuals/r-release/R-intro.html), or at least the early chapters. It's not as well written as more modern documentation, but it is important in being able to understand older legacy code.

----
## Online Courses

Many of us want to try before we buy. Making the investment of time into reading a book (even a free one) could still be too much to ask. These materials, some even with interactive notebooks and project examples, may be a better path for you.

|     |    | 
|:---|:---|
| [Kaggle](https://www.kaggle.com/learn)   | An online community of data scientists and machine learning practitioners, now part of Google. |
| [Linkedin Learning: Fred Nwanganga](https://www.linkedin.com/learning/instructors/frederick-nwanganga)    |  A sequence of introductory :star: Python ML video courses |
| [Linkedin Learning: Keith McCormick](https://www.linkedin.com/learning/instructors/keith-mccormick) | Look for Keith's Data Mining, CRISP-DM, and executive training materials |
| The [R-Studio Cloud Primers](https://rstudio.cloud/learn/primers)
| [Data Science in a Box](https://datasciencebox.org/index.html)
| **[STAT545](https://stat545.com/)** |by [Jenny Bryan](https://twitter.com/JennyBryan)|
| [Tidy Data Science with the Tidyverse and Tidymodels](https://tidyds-2021.wjakethompson.com) |by Jake Thompson |
| [Dublin City University R Tutorials](https://dcu-r-tutorials.netlify.com/)
| [R Programming](https://www.coursera.org/learn/r-programming) |by [Roger Peng](https://twitter.com/rdpeng)|
| [Statistical Computing with R Programming Language: a Gentle Introduction](https://www.ucl.ac.uk/short-courses/search-courses/statistical-computing-r-programming-language-gentle-introduction) |by [Max Reuter](https://twitter.com/MaxReuterEvo) and [Chris Barnes](https://twitter.com/cssb_lab)|
| :star: **[Happy Git and GitHub for the useR](https://happygitwithr.com/)** |by [Jenny Bryan](https://twitter.com/JennyBryan)|
| :star: **[STAT 447 : Data Science Programming Methods](https://stat447.com/)** |by [Dirk Eddelbuettel](https://twitter.com/eddelbuettel)|
| [Contribute to an open-source project on GitHub](https://docs.microsoft.com/en-us/learn/modules/contribute-open-source/?WT.mc_id=opensource-0000-davidsmi)| Microsoft|
| [A Very Short Course on Time Series Analysis](https://bookdown.org/rdpeng/timeseriesbook/) |by [Roger Peng](https://twitter.com/rdpeng) |
| [Learn R by R-Exercises](https://www.r-exercises.com/start-here-to-learn-r/)
| [YaRrr! The Pirate’s Guide to R (Video)](https://www.youtube.com/playlist?list=PL9tt3I41HFS9gmeZFEuNrnu_7V_NFngfJ) |by [Nathaniel D Phillips](https://twitter.com/YaRrrBook)|
| [Johns Hopkins Chromebook Data Science (CBDS)](http://jhudatascience.org/chromebookdatascience/cbds.html)
| [University of Cincinnati Introduction to R](https://github.com/uc-r/Intro-R) |by [Bradley Boehmke](https://twitter.com/bradleyboehmke) |
| [University of Cincinnati Intermediate R](https://github.com/uc-r/Intermediate-R) |by [Bradley Boehmke](https://twitter.com/bradleyboehmke) |

----
## Data Visualization
If your toolkit has been limited to Powerpoint and Excel, you might not yet appreciate that there is so much more to crafting effective visual communication materials. In addition to the learning resources listed here, look for the recent books by Alberto Cairo and David McCandless at your local library.
|     |    | 
|:---|:---|
| **[Data Visualization, a Practial Introduction in R](https://socviz.co/index.html)** |by [Kieran Healy](https://twitter.com/kjhealy)|
| [ggplot2: Elegant Graphics for Data Analysis](https://ggplot2-book.org/) |the online version of work-in-progress 3rd edition by Hadley Wickham, Danielle Navarro, and Thomas Lin Pedersen|
| [Hands-On Data Visualization](https://handsondataviz.org/) |by Jack Dougherty and Ilya Ilyankou|
| [Custom fonts and plot quality with ggplot on Windows](https://www.williamrchase.com/post/custom-fonts-and-plot-quality-with-ggplot-on-windows) |by [W R Chase](https://twitter.com/W_R_Chase)|
| [How to Create BBC Style Graphics](https://bbc.github.io/rcookbook/#how_to_create_bbc_style_graphics)| |
| [R Graph Gallery](https://www.r-graph-gallery.com/)
| **[Fundamentals of Data Visualization](https://clauswilke.com/dataviz/)** |by [Claus Wilke](https://twitter.com/ClausWilke)|
| [Exploratory Data Analysis & Visualization](https://edav.info/index.html) |by [Zach Bogart](https://twitter.com/zachbogart) and [Joyce Robbins](https://twitter.com/jtrnyc)|
| [The Complete ggplot2 Tutorial](http://r-statistics.co/Complete-Ggplot2-Tutorial-Part1-With-R-Code.html)
| [flowingdata.com](https://flowingdata.com/)
| [How to standardize group colors in data visualizations in R](https://paulvanderlaken.com/2020/03/20/how-to-standardize-group-colors-in-data-visualizations-in-r/) |by [Paul van der Laken](https://twitter.com/paulvanderlaken)|

----
## Empirical Bayes
In this little book David Robinson introduces a powerful tool for handling uncertainty across observations. It teaches both the math behind these and the code that you can adapt to your own data through the detail of a single case study: batting averages in baseball. He wrote it for people (like me) who need to understand and apply methods, but would rather work with real data than face down pages of equations.

So why is Empirical Bayes worth learning? These methods are especially well suited for many modern applications of data science.

<a href="https://gumroad.com/l/empirical-bayes"><img alt="Introduction to Empirical Bayes" src="https://public-files.gumroad.com/variants/070hlmq86og1qo2kgb3tl2fgwkbi/35a9dc65b899b4bc9688c9aa5d9d6d5f21c77fd36a53b6adc66ca71a81bc9933" width=335 ></a>

----
## Shiny

Shiny is an R package that makes it easy to build interactive web apps for non-programmers. You can host standalone apps on a webpage or embed them or build dashboards to be served from a cloud facility. You can also extend Shiny apps with CSS themes, htmlwidgets, and JavaScript actions.

|     |    | 
|:---|:---|
| [Mastering Shiny](https://mastering-shiny.org/)  |  <a href="https://mastering-shiny.org/"><img alt="Mastering Shiny" src="https://d33wubrfki0l68.cloudfront.net/0c97eee3d8fc820f3a8d670c08b286e8a524257b/e426c/cover.png" width="250"></a>  |
| [Engineering Production-Grad Shiny Apps](https://engineering-shiny.org/index.html) |by [Colin Fay](https://twitter.com/_ColinFay), [Sébastien Rochette](https://twitter.com/StatnMap), [Vincent Guyader](https://twitter.com/VincentGuyader), & [Cervan Girard](https://twitter.com/CervanGirard) on the {`golem`} package|
| [R Views Enterprise-ready dashboards with Shiny and Databases](https://rviews.rstudio.com/2017/09/20/dashboards-with-r-and-databases/)
| [R Shiny upgrade packages](http://enhancedatascience.com/2017/07/10/the-packages-you-need-for-your-r-shiny-application/)
| [Advanced Shiny Tips and Tricks](https://github.com/daattali/advanced-shiny#readme) |by [Dean Attali](https://twitter.com/daattali)|

----
## RMarkdown and Quarto

R Markdown is a file format for building dynamic documents that contain both code and document text. The package has been extended to provide systems for authoring and publishing books, presentations, blogs, and dashboards. 

[Quarto](https://quarto.org/) is a newer open-source, multi-language scientific and technical publishing system built on Pandoc. Like R Markdown, Quarto uses Knitr to execute code.

|     |    | 
|:---|:---|
| [R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/) |
| [Rmarkdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) |by [Yihui Xie](https://twitter.com/xieyihui), [JJ Allaire](https://twitter.com/fly_upside_down), and [Garrett Grolemund](https://twitter.com/StatGarrett)|
| [RMarkdown Tips and Tricks](https://www.richardshanna.com/tutorial/rmarkdown_tutorial_1/) |by [Richard Hanna](https://twitter.com/Richard_S_Hanna)|
| [Blogdown: Creating Websites with R Markdown](https://bookdown.org/yihui/blogdown/) |by [Yihui Xie](https://twitter.com/xieyihui), [Amber Thomas](https://twitter.com/ProQuesAsker) and [Alison Presmanes Hill](https://twitter.com/apreshill)|

----
## NLP: Text Mining, Document Classification, Sentiment Analysis, and Topic Modeling
|     |    | 
|:---|:---|
| [Supervised Machine Learning for Text Analysis in R](https://smltar.com/)| by [Julia Silge](https://twitter.com/juliasilge) and [Emil Hvitfeldt](https://twitter.com/Emil_Hvitfeldt)
| [Text mining](https://www.tidytextmining.com/) |by [Julia Silge](https://twitter.com/juliasilge) and [David Robinson](https://twitter.com/drob)|
| [Learn Tidytext](https://juliasilge.shinyapps.io/learntidytext/) | by [Julia Silge](https://twitter.com/juliasilge)|
| [Text as Data: An Overview](https://kenbenoit.net/pdfs/CURINI_FRANZESE_Ch26.pdf) |by [Ken Benoit](https://twitter.com/kenbenoit)|
| [word2vec in R](https://www.bnosac.be/index.php/blog/100-word2vec-in-r) |Belgium Network of Open Source Analytical Consultants|
| [Learn Regular Expressions](https://regexone.com/)

----
## More Advanced Books
|     |    | 
|:---|:---|
| **[Hands-On Programming with R](https://rstudio-education.github.io/hopr/)** | by [Garrett Grolemund](https://twitter.com/StatGarrett)|
| [Advanced R (Wickham, 2018)](https://adv-r.hadley.nz/introduction.html) |by [Hadley Wickham](https://twitter.com/hadleywickham)|
| [R Packages](https://r-pkgs.org/) |by [Hadley Wickham](https://twitter.com/hadleywickham) and [Jenny Bryan](https://twitter.com/JennyBryan)|
| [Efficient R programming](https://csgillespie.github.io/efficientR/) |by [Colin Gillespie](https://twitter.com/csgillespie) and [Robin Lovelace](https://twitter.com/robinlovelace)|
| [Advanced R](https://github.com/uc-r/Advanced-R) |by [Bradley Boehmke](https://twitter.com/bradleyboehmke)|
| [A data.table and dplyr tour](https://atrebas.github.io/post/2019-03-03-datatable-dplyr/)

----
## Machine Learning
Mastery of the wide array of Machine Learning techniques in real business contexts requires a broad and deep study. Long-time engineers like me often make the mistake of skipping ahead to the Kaggle award winning algorithms and the CV buzzwords. We're smart. Just wing it, right? *This is a bad idea.*

The leading edge of thinking in many ML areas is changing rapidly. These are just a starting point:

|     |    |
|:----|:---|
| [Data Science for Business](http://pages.stern.nyu.edu/~fprovost/) |by Provost and Fawcett ([2013 O'Reilly](https://www.oreilly.com/library/view/data-science-for/9781449374273/))| 
|:star: [Machine Learning Engineering in Action](https://www.manning.com/books/machine-learning-engineering-in-action) | Ben Wilson |
|:star: [Designing Machine Learning Systems](https://www.amazon.com/Designing-Machine-Learning-Systems-Huyen-ebook-dp-B0B1LGL2SR/dp/B0B1LGL2SR) | Chip Huyen |
| [Introduction to Computational Thinking and Data Science](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-0002-introduction-to-computational-thinking-and-data-science-fall-2016/)| Grimson, Guttag, and Bell |
| [Tidy Modeling with R](https://www.tmwr.org/) |by [Max Kuhn](https://twitter.com/topepos) and [Julia Silge](https://www.tmwr.org/)|
| [Feature Engineering and Selection: A Practical Approach for Predictive Models](http://www.feat.engineering/) |by [Max Kuhn](https://twitter.com/topepos) and Kjell Johnson|
| [An Introduction to Statistical Learning](https://www.statlearning.com/) | 2nd edition |
| [An Introduction to Statistical Learning Labs](https://emilhvitfeldt.github.io/ISLR-tidymodels-labs/index.html) | `tidymodels` examples |
| [Practical Machine Learning in R](https://www.wiley.com/en-us/Practical+Machine+Learning+in+R-p-9781119591535) | by Nwanganga and Chapple (2020)  [reviewed here](https://jimgruman.netlify.app/post/practical-machine-learning-in-r/). |

Find other materials on AI ethics in your specific working domain and be prepared to consider the impacts of validating and generalizing your work. No computing tool does this for you by itself, even if it claims to be automatic.

Machine learning modeling frameworks offer streamlined solutions for pre-processing, scoring, and publishing models. The most popular is arguably [scikit-learn](https://scikit-learn.org/stable/index.html) over in the Python world. There are also fully supported proprietary systems available from SAS and Mathworks, at a cost. The most popular deep learning neural-net frameworks at this point in time are Tensorflow and Torch, with interfaces from several programming languages. In R the widely used frameworks are `caret`, `tidymodels`, and `mlr3`. Any machine learning solution put into production will require proper orchestration and monitoring to assure delivery to the enterprise's service level requirements. 

|    |    |
|:---|:---|
| :star:  [Building Machine Learning Powered Applications: Going from Idea to Product](https://www.amazon.com/Building-Machine-Learning-Powered-Applications-ebook-dp-B0842ZD3Y7/dp/B0842ZD3Y7) | by Emmanuel Ameisen
| :star: [The Phoenix Project](https://www.amazon.com/Phoenix-Project-DevOps-Helping-Business/dp/0988262592) | by Gene Kim, Kevin Behr, and George Spafford
| [MLOPS with R: An end-to-end process for building machine learning applications](https://github.com/revodavid/mlops-r-gha) | on Azure
| [Interpretable Machine Learning](https://christophm.github.io/interpretable-ml-book/)
| [Deep Learning](https://www.deeplearningbook.org/)

----
## Geospatial

<a href="https://walker-data.com/census-r/index.html" ><img src="https://walker-data.com/census-r/07-spatial-analysis-census_files/figure-html/show-min-times-1.png" alt="Map of travel-times to trauma centers by Census tract in Iowa" width="50%"></a>

|   |   |
|:---|:---|
| [Analyzing US Census Data: Methods, Maps, and Models in R](https://walker-data.com/census-r/index.html) | The goal of this book, by [Kyle Walker](https://walker-data.com/) is to illustrate the utility of R to prepare, map, and present data products| 
| [Map Plots Created With R And Ggmap](https://www.littlemissdata.com/blog/maps) |by [Laura Ellis](https://twitter.com/LittleMissData)|
| [Making Maps with R](http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html) | by Eric Anderson for (NOAA/SWFSC)|
| [Spatial Data Science](https://keen-swartz-3146c4.netlify.app/) |by [Edzer Pebesma](https://twitter.com/edzerpebesma) and [Roger Bivand](https://twitter.com/RogerBivand)|
| [Introduction to Spatial Data Programming with R](https://geobgu.xyz/r/) |by [Michael Dorman](https://twitter.com/MichaelDorman84)|
| [Predictive Soil Mapping with R](https://soilmapper.org/) |by [Tomislav Hengl](https://twitter.com/tom_hengl) and [Robert A. MacMillan](https://twitter.com/opengeohub)|
| [Reproducible road safety research with R](https://www.racfoundation.org/research/safety/reproducible-road-safety-research-with-r)
| [Spatial Data Science](https://spatialanalysis.github.io/tutorials/) |by [Angela Li](https://twitter.com/CivicAngela)|
| [The GDSL Big List of Teaching Links](https://github.com/GDSL-UL/Teaching_Links) | University of Liverpool|
| [Geocomputation with R](https://geocompr.robinlovelace.net/) |by [Robin Lovelace](https://twitter.com/robinlovelace)|
| [another collection of geospatial sources](https://github.com/sshuair/awesome-gis#r) |[sshuair](https://twitter.com/sshuair)|

----
## Meetups, Blogs, and User Groups

A seasoned [useR group](https://www.r-consortium.org/projects/r-user-group-support-program) organizer reminded me recently that a non-trivial amount of effort is required to organize meetups, find speakers, get locations (non-covid times), market the meetups, etc. One way we all can help is to volunteer to speak, volunteer a location, help market, farm for speakers, etc. There is a moral motivation in the [open source](https://jimgruman.netlify.app/post/open-source/) R community to lift one another up and recognize efforts. The software is "free" as in speech, not as in beer. If you learn something useful and encounter a [buy me coffee](https://www.buymeacoffee.com/) button, be sure to offer  a cup of java to the presenter in return.

|    |    |
|:---|:---|
| [R Views](https://rviews.rstudio.com/)| the RStudio blog |
| [TidyTuesday Tweets](https://www.notion.so/8cfed86c707e4974b2f483716c35bac3?v=7e87113d8a7946fdaeeafd7cdaf69598) |  curated by [Silvia Canelón](https://twitter.com/spcanelon) |
| [Simply Statistics](https://simplystatistics.org/) |by Rafa Irizarry, Roger Peng, and Jeff Leek|
| [R User Group Meetups Worldwide](https://www.meetup.com/pro/r-user-groups/) | ~89 chapters sponsored by the R Consortium |
| [themockup](https://themockup.blog/)|by [Thomas Mock](https://twitter.com/thomas_mock) |
| [Win Vector blog](https://win-vector.com/blog-2/) | by Dr. John Mount and Dr. Nina Zumel|
| [RevolutionAnalytics](https://blog.revolutionanalytics.com/)| by [David Smith](https://twitter.com/revodavid)|
[Business Science Blog](https://www.business-science.io/blog/index.html) |by [Matt Dancho](https://twitter.com/mdancho84)|
| [Julia Silge](https://juliasilge.com/blog/)
| [Variance Explained](http://varianceexplained.org/posts/) | by [David Robinson](https://twitter.com/drob)|
| [Ken Benoit](https://kenbenoit.net/posts/) |on Text and NLP|
| [Data Imaginist](https://www.data-imaginist.com/) |by [Thomas Lin Pederson](https://twitter.com/thomasp85) on ggplot2|
| [Alison Hill](https://alison.rbind.io/) |by [Alison Hill](https://twitter.com/apreshill) on education|
| [Thomas Neitmann](https://thomasadventure.blog/posts/) | Biostatistics|
| [Edward Visel](https://alistaire.rbind.io/) |by [Edward Visel](https://twitter.com/alistaire)|
| [Plant out of Place](https://plantoutofplace.com/) |by [Andrew Kniss](https://twitter.com/WyoWeeds) on agriculture|
| [Ag Data News](https://asmith.ucdavis.edu/news) | by [Aaron Smith](https://twitter.com/ASmithUCD)|
| [AllYourBayes](https://www.allyourbayes.com/)| by [Domenic  Di Francesco](https://twitter.com/Domenic_DF)|
| [Data Meets Narrative](http://www.rebeccabarter.com/blog/) |by [Rebecca Barter](https://twitter.com/rlbarter)|
| [Jake Rozran Learns Data Science](https://www.jakelearnsdatascience.com/post/) | by [Jake Rozran](https://twitter.com/StatsManPHL) |
| [RCrastinate ](http://rcrastinate.rbind.io/) | by [Sascha Wolfer](https://twitter.com/sascha_wolfer)|
| [Colin Fraser](https://colin-fraser.net/)
| [rgeomatic](https://rgeomatic.hypotheses.org/category/r-en) | geospatial topics |
| [Arnaud Amsellem](http://www.thertrader.com) |for quantitative finance|
| [Ted Laderas](http://laderast.github.io/) |on Bioinformatics and Computational Biology|
| [r4stats.com](http://r4stats.com/blog/)
| [R-bloggers](http://www.r-bloggers.com/)
| [Karl Broman](http://kbroman.org/blog/) |by [Karl Broman](https://twitter.com/kwbroman) on Biostatistics|
| [Bruno Rodrigues](http://www.brodrigues.co/) |on Education Statistics|
| [Abdul Majed](https://www.programmingwithr.com/) |by [Abdul Majed](https://twitter.com/1littlecoder)|
----

### Did you find this page helpful? Consider sharing it 🙌


