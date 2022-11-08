---
date: "2021-01-26"
diagram: true
image: 
  caption: 'art by Allison Horst'
  focal_point: "TopRight"
  preview_only: false
title: 'Exploratory Data Analysis'
author: "Jim Gruman"
output: 
 blogdown::html_page:
  toc: false
categories: [R]
description: "Crafting a Data Narrative"
featured: false
draft: false
---

More often than not, the most impactful analytics projects do not involve any artificial intelligence. The real financial return comes from insights delivered to the organization via Exploratory Data Analysis, or EDA.

Analytics professionals who focus on decision science, that is, people that use data to provide ground truth to the business, must be able to articulate what the EDA process is and what the standards are for the process. Analysts should be the best people available to find meaning in the data.

Crafting an analysis that takes a vast amount of privileged company data and converts it into a concise result could be considered an art. The act of figuring out what is meaningful mathematically, what the business cares about, and how to bridge the gap between the two is not something that most people will know how to do naturally.

This post will be a short outline of the major elements of Exploratory Data Analysis. 

# What makes a good analysis?

According to the 2020 book [Build a Career in Data Science](https://www.manning.com/books/build-a-career-in-data-science):

-   *It answers the question*. An analysis starts with someone asking a question, and it must provide an answer to that question.

-   *It is made quickly*. Businesses have deadlines. If the analysis takes too long to create, the decision will be made without the analysis.

-   *It can be shared*. The work product needs to be shared, not only with the person that asked for the analysis, but also with whomever that person wants to share it with in turn.

-   *It is self-contained*. Because you can't predict who will see the analysis, it needs to be understandable on its own. Plots and tables have to have clear annotations, axes must be labeled, and explanations should be written down.

-   *It can be revisited*. Most questions will be asked again in the future. Sometimes, answering subsequent versions of the same question is a matter of running the same script on fresh data.

Ultimately, a good analysis is simply the work product that helps non-analysts do their own jobs.

The American mathematician John Tukey formally introduced the concept in 1961. The idea of summarizing a dataset's key characteristics coincided with the development of early programming languages. This was also a time when scientists and engineers were working on new data-driven approaches related to early computing. For more than 60 years, EDA has been widely adopted as a core tenet of data science.

## The analysis plan

Knowing whether the data that could plausibly answer the question is available is *really* important. An analysis plan should consist of actionable tasks that drill down into the dimensions of the business question and how they should be addressed. It should be shared with both the team manager and the client to secure an agreed-upon foundation for the work. For example, importing and cleaning data will require that files and security access be made available. Given the size and the nature of the dataset, cloud resources may need to be provisioned.

So, where do analytics plans fail? The most common mistake is to solve the problems that nobody has.

Every EDA plan steps through identifying potential issues that require remedial work before moving forward. This could be characterized as data cleaning or data checking. Generally speaking, the pattern here is:

1.  Generate questions about the data.

2.  Search for answers by visualizing, transforming, and modeling the data.

3.  Use what is learned to refine the questions and generate new questions.

Bear in mind that EDA is never a single linear process with a strict set of rules. During the initial phases of EDA every idea will be investigated. Some of these ideas will pan out, and most will be dead ends. As exploration continues, the analyst will discover a few particularly productive areas to write up and communicate.

> "Far better an approximate answer to the right question, which is often vague, than an exact answer to the wrong question, which can always be made precise." John Tukey

EDA is fundamentally a creative process. And like most creative processes, the key to asking *quality* questions is to generate a large *quantity* of questions. It is always difficult to ask revealing questions at the start of the analysis because the analyst does not yet know what insights are contained in the dataset. On the other hand, each new question asked will expose a new aspect of the data and increase the chance of making a discovery.

In my experience its best to have familiarity with tooling at several levels of abstraction, whether python or R, Tableau or PowerBI. High level interfaces to auto-generate certain types of exploratory analysis are handy when they provide just what is needed. However, the majority of EDA is more creative in nature and becoming expert with data manipulation tools like dplyr and pandas in combination with graphical tools like matplotlib and ggplot2 provides finer control and fewer restrictions on creativity.

The main point here is that exploratory data analysis cannot and should not be automated, because it is a process to support human learning, and to do that well there are few shortcuts. As an analogy, think of this like running a document through a spellchecker versus reading it yourself. While software is useful for spotting typos and grammatical errors, only a critical human eye can detect the nuance. EDA is similar in this respect, in that tools can help, but it requires our own intuition to make sense of it. This personal, in-depth insight will support detailed data analysis further down the line.

------------------------------------------------------------------------

[TL;DR - skip to the Conclusion](#Conclusion)

------------------------------------------------------------------------

At this point, all of the technical tools of EDA will be needed: visualization, transformation, and modeling. For the purposes of this blog post, we will organize activities under these headings:

-   Feature names and types

-   Missingness

-   Variance and covariance

-   Patterns and modeling feature inferences

For illustrative purposes, let's load a few libraries with plotting functions and a sample [penguin](https://allisonhorst.github.io/palmerpenguins/) dataset.




```r
suppressPackageStartupMessages({
library(tidyverse) # tidy data manipulation, including dplyr and ggplot
library(systemfonts) # register Windows Fonts
library(palmerpenguins) # penguin sample dataset
library(GGally) #ggplot2 extensions
library(correlationfunnel)
})

theme_set(theme_minimal())  # a clean style for plotting 
```

### Feature names and types

Analysts are often handed sample data in Excel or a .csv text file at the first engagement of a project. In my experience, always, always check for the correctness of the column types. Expect to find integers incorrectly coded as strings, dates coded as strings, timestamps in odd time zones, non-English character sets, and other issues. Sometimes a column that should be numeric has the occasional string entry. Perhaps the query did not specify the correct schema when reading the database, or the data are encoded in an ambiguous way that results in an inappropriate type, or maybe some earlier data manipulation caused a problem.

Going further, let's define some terms:

-   A **variable** is a quantity, quality, or property that is measured. Often shown in columns, these are also known in data science as features.

-   A **value** is the state of a variable when measured. The value of a variable may change from measurement to measurement.

-   An **observation** is a set of measurements made under similar conditions. Usually all of the measurements in an observation are taken at the same time and on the same object. An observation will contain several values, each associated with a different variable. We sometimes refer to an observation as an instance.

-   **Tabular data** is a set of values, each associated with a variable and an observation. Tabular data is *tidy* if each value is placed in its own "cell", each variable in its own column, and each observation in its own row.

-   **Dimensionality** represents the number of variables, or features, of a dataset. The higher the dimensionality, the more we know about the data, but also the higher the computational complexity. There are approaches to reducing the dimensionality without losing predictive power.

-   **Sparsity and Density** describe the degree to which data exists for the features in a dataset. For example, if 20 percent of the values in a dataset are missing, the dataset is said to be 20 percent sparse. Density is the complement of sparsity. Geospatial, survival, natural language processing, and text mining datasets are often sparse.

-   **Resolution** describes the grain or level of detail in the data. The more detailed the data, the finer (or higher) the resolution. Satellite imagery consists of pixels on a grid spaced at some 3 meters or so on the ground. Aerial imagery has somewhat higher resolution, and images taken at ground level can have very high resolution.

Descriptive statistics are useful in building understanding. They involve the use of measures to describe characteristics of variables. For example, categorical variables are described in the frequencies, or counts, of their occurrence in the dataset. For continuous variables, summary measures like mean and median are often useful.

For the penguins dataset:


```r
summary(penguins)
```

```
##       species          island    bill_length_mm  bill_depth_mm  
##  Adelie   :152   Biscoe   :168   Min.   :32.10   Min.   :13.10  
##  Chinstrap: 68   Dream    :124   1st Qu.:39.23   1st Qu.:15.60  
##  Gentoo   :124   Torgersen: 52   Median :44.45   Median :17.30  
##                                  Mean   :43.92   Mean   :17.15  
##                                  3rd Qu.:48.50   3rd Qu.:18.70  
##                                  Max.   :59.60   Max.   :21.50  
##                                  NA's   :2       NA's   :2      
##  flipper_length_mm  body_mass_g       sex           year     
##  Min.   :172.0     Min.   :2700   female:165   Min.   :2007  
##  1st Qu.:190.0     1st Qu.:3550   male  :168   1st Qu.:2007  
##  Median :197.0     Median :4050   NA's  : 11   Median :2008  
##  Mean   :200.9     Mean   :4202                Mean   :2008  
##  3rd Qu.:213.0     3rd Qu.:4750                3rd Qu.:2009  
##  Max.   :231.0     Max.   :6300                Max.   :2009  
##  NA's   :2         NA's   :2
```

### Missingness

We must check the prevalence of missing values and their relationship with other features. There is a story about a marine mammal weights dataset where the missing values are those whales that exceeded the capacity of the scale. Remedies here might include dropping or transforming columns, imputing missing values as the median, or choosing an algorithm that handles missingness out of the box. As a worse case, it may be necessary to solicit more data.

We should make every effort to understand what makes observations with missing values different versus observations with recorded values. For example, in the sample dataset `nycflights13::flights`, missing values in the `dep_time` variable indicate that the flight was cancelled. It is important to compare the scheduled departure times for cancelled and non-cancelled times.


```r
nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
  ggplot(mapping = aes(sched_dep_time)) + 
    geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-1.png" width="672" />

This is also a good example of an unbalanced dataset, where the class of a variable of interest may be overwhelmed by the other classes. There are analytics techniques for synthesizing upsampling, or resampling, to prepare the data to better understand the underlying patterns.

### Variance and covariance

**Variance** is the tendency of the values of a single variable to change from measurement to measurement. Variation is easily observed in real life; measuring any continuous variable twice, there will often be two different results. This is true even when measuring quantities that are constant, like the speed of light. Each measurement will include a small amount of error that varies from measurement to measurement. Every variable has its own pattern of variation. The best way to understand that pattern is to visualize the distribution of the variable's values.

The means of visualizing the distribution of a variable will depend on whether the variable is categorical or continuous. A variable is **categorical** if it can only take one of a small set of values. To examine the distribution of counts of a categorical variable, use a bar chart:


```r
ggplot(data = penguins) +
  geom_bar(mapping = aes(x = island, fill = island), show.legend = FALSE)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

The height of the bars displays how many observations occurred with each value. A table that displays the same information:


```r
penguins %>% 
  count(island)
```

```
## # A tibble: 3 × 2
##   island        n
##   <fct>     <int>
## 1 Biscoe      168
## 2 Dream       124
## 3 Torgersen    52
```

A variable is **continuous** if it can take any of an infinite set of ordered values. Numbers and date-times are two examples of continuous variables. To examine the distribution of a continuous variable, use a histogram:


```r
ggplot(data = penguins) +
  geom_histogram(mapping = aes(x = bill_length_mm), binwidth = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-5-1.png" width="672" />

Or, as a summary table, in bins:


```r
penguins %>% 
  count(cut_width(bill_length_mm, 2))
```

```
## # A tibble: 16 × 2
##    `cut_width(bill_length_mm, 2)`     n
##    <fct>                          <int>
##  1 [31,33]                            1
##  2 (33,35]                           10
##  3 (35,37]                           31
##  4 (37,39]                           40
##  5 (39,41]                           38
##  6 (41,43]                           34
##  7 (43,45]                           23
##  8 (45,47]                           58
##  9 (47,49]                           31
## 10 (49,51]                           47
## 11 (51,53]                           20
## 12 (53,55]                            4
## 13 (55,57]                            3
## 14 (57,59]                            1
## 15 (59,61]                            1
## 16 <NA>                               2
```

A histogram divides the x-axis into equally spaced bins and then uses the height of a bar to display the number of observations that fall in each bin. In the graph above, the tallest bar shows that almost 58 observations have a `bill_length_mm` value between 45 and 47, which are the left and right edges of the bar.

More than one histogram could be plotted together, but a better approach graphically may be to use lines instead, as it's often easier to understand overlapping lines than bars.


```r
ggplot(data = penguins, mapping = aes(x = bill_length_mm, colour = species)) +
  geom_freqpoly(binwidth = 2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-7-1.png" width="672" />

Now that we can visualize variation, what should we look for in plots? And what type of follow-up questions should we ask? I've put together a list below of the most useful types of information that to find in graphs, along with some follow-up questions for each type of information. The key to asking good follow-up questions will be to rely on curiosity as well as skepticism (How could this be misleading?).

In both bar charts and histograms, tall bars show the common values of a variable, and shorter bars show less-common values. Places that do not have bars reveal values that were not seen in the data. To turn this information into useful questions, look for anything unexpected:

-   Which values are the most common? Why?

-   Which values are rare? Does that match expectations?

-   Can we see any unusual patterns? What might explain them?

Clusters of similar values suggest that subgroups exist in the data. To understand the subgroups, ask:

-   How are the observations within each cluster similar to each other?

-   How are the observations in separate clusters different from each other?

-   How can you explain or describe the clusters?

-   Why might the appearance of clusters be misleading?

The histogram below shows the length (in minutes) of 272 eruptions of the Old Faithful Geyser in Yellowstone National Park. Eruption times appear to be clustered into two groups: there are short eruptions (of around 2 minutes) and long eruptions (4-5 minutes), but little in between.


```r
ggplot(data = faithful, mapping = aes(x = eruptions)) + 
  geom_histogram(binwidth = 0.25)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-1.png" width="672" />

Many of the questions above will prompt us to explore a relationship *between* variables to see if the values of one variable can explain the behavior of another variable.

**Outliers** are observations that are unusual; data points that don't seem to fit the pattern. Sometimes outliers are data entry errors; other times outliers suggest important new science. When there is a lot of data, outliers are sometimes difficult to see in a histogram. For example, take the distribution of the `y` variable from the diamonds dataset. The only evidence of outliers is the unusually wide limits on the x-axis.


```r
ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-1.png" width="672" />

It's good practice to repeat the analysis with and without the outliers. If they have minimal effect on the results, it may be reasonable to replace them with missing values and move on. However, if they have a substantial effect on the results, do not drop them without justification. Figure out what caused them (e.g. a data entry error) and disclose that they were removed in the write-up.

If variation describes the behavior *within* a variable, covariation describes the behavior *between* variables. **Covariation** is the tendency for the values of two or more variables to vary together in a related way. The best way to spot covariation is to visualize the relationship between two or more variables.

It's common to want to explore the distribution of a continuous variable broken down by a categorical variable, as in the previous frequency polygon. To make the comparison easier we need to swap what is displayed on the y-axis. Instead of displaying count, we'll display **density**, which is the count standardized so that the area under each frequency polygon is one.


```r
ggplot(data = penguins, mapping = aes(x = body_mass_g, y = ..density..)) + 
  geom_freqpoly(mapping = aes(colour = species), binwidth = 100)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-10-1.png" width="672" />

This may be a little hard for most audiences to interpret. There's a lot going on in this plot.

An alternative: a **boxplot** is a type of visual shorthand for a distribution of values that is popular among statisticians. Each boxplot consists of:

-   A box that stretches from the 25th percentile of the distribution to the 75th percentile, a distance known as the interquartile range (IQR). In the middle of the box is a line that displays the median, i.e. 50th percentile.

-   Visual points that display observations that fall more than 1.5 times the IQR from either edge of the box. These outlying points are unusual so are plotted individually.

-   A line (or whisker) that extends from each end of the box and goes to the farthest non-outlier point in the distribution.

Let's take a look at the distribution of body mass by species:


```r
ggplot(data = penguins, mapping = aes(x = species, y = body_mass_g       )) +
  geom_boxplot()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-11-1.png" width="672" />

We see less information about the distribution, but the boxplots are much more compact so we can more easily compare them (and fit more on one plot).

With long variable names, the boxplot works better if flipped by 90°. In this case, we will add the original data points, with "jitter" (random spacing off from the center axis), and color for each species.


```r
ggplot(data = penguins, 
       mapping = aes(y = reorder(species, body_mass_g, FUN = median), 
                     x = body_mass_g,
                     color = species)) +
  geom_boxplot(show.legend = FALSE) +
  geom_point(alpha = 0.5, position = "jitter", show.legend = FALSE) +
  labs(y = NULL)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-12-1.png" width="672" />

To visualize the covariation between categorical variables, we will need to count the number of observations for each combination. One approach:


```r
ggplot(data = penguins) +
  geom_count(mapping = aes(x = island, y = species))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-13-1.png" width="672" />

The size of each circle in the plot displays how many observations occurred at each combination of values. Covariation will appear as a strong correlation between specific x values and specific y values.

Another approach is to calculate the counts:


```r
penguins %>% 
  count(species, island)
```

```
## # A tibble: 5 × 3
##   species   island        n
##   <fct>     <fct>     <int>
## 1 Adelie    Biscoe       44
## 2 Adelie    Dream        56
## 3 Adelie    Torgersen    52
## 4 Chinstrap Dream        68
## 5 Gentoo    Biscoe      124
```

Then visualize as a tile map with a fill aesthetic:


```r
penguins %>% 
  count(species, island) %>%  
  ggplot(mapping = aes(x = species, y = island)) +
    geom_tile(mapping = aes(fill = n))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-15-1.png" width="672" />

We've already seen one great way to visualize the covariation between two continuous variables: draw a scatterplot. Note the covariation as a pattern in the points. For example, observe the relationship between the body mass and bill length of the penguins:


```r
ggplot(data = penguins) +
  geom_point(mapping = aes(x = body_mass_g, y = bill_length_mm    ))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-16-1.png" width="672" />

Scatterplots become less useful as the size of the dataset grows, because points begin to overplot and pile up into areas of uniform black. One way to fix the problem is to add transparency (here, called `alpha`). Again, we will add color as species.


```r
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = body_mass_g, 
                           y = bill_length_mm, 
                           color = species), alpha = 0.5)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-17-1.png" width="672" />

Another option is to bin one continuous variable so it acts like a categorical variable. Then use one of the techniques for visualizing the combination of a categorical and a continuous variable. For example, bin body_mass_g and then for each group, and then display a boxplot:


```r
ggplot(data = penguins, mapping = aes(x = body_mass_g, y = bill_length_mm)) + 
  geom_boxplot(mapping = aes(group = cut_width(body_mass_g, 100)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-18-1.png" width="672" />

The cuts as used above divides `x` into bins of width `width`. By default, boxplots look roughly the same (apart from number of outliers) regardless of how many observations there are, so it's difficult to tell that each boxplot summarizes a different number of points.

Another approach is to display approximately the same number of points in each bin:


```r
ggplot(data = penguins, mapping = aes(x = body_mass_g, y = bill_length_mm)) + 
  geom_boxplot(mapping = aes(group = cut_number(body_mass_g, 20)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-19-1.png" width="672" />

For small datasets, a combination `GGally` ggpairs() visualization illustrates  pairwise relationships. Unfortunately, the graphic that looks reasonable with only three variables can be overwhelming with more, particularly for non-technical audiences. 


```r
GGally::ggpairs(data = penguins, 
                columns = c("island", 
                            "bill_length_mm", 
                            "body_mass_g"),
                mapping = aes(color = species),
                progress = FALSE) 
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-20-1.png" width="672" />

Another option for exploring many pairwise relationships is the [`brinton`](https://sciencegraph.github.io/brinton/) package by Pere Millán-Martínez. The 2019 CRAN research article "[The Landscape of R Packages for
Automated Exploratory Data Analysis](https://journal.r-project.org/archive/2019/RJ-2019-033/RJ-2019-033.pdf)" by Mateusz Staniak and Przemysław Biecek surveys another 15 Automated EDA R packages to identify areas where automated data exploration could be improved. 

Predictive power scores are a more advanced technique for providing measures of the strength of features, particularly where relationships could be non-linear and with category levels. Matt Dancho's [`correlationfunnel`](https://cran.r-project.org/web/packages/correlationfunnel/vignettes/introducing_correlation_funnel.html) is a package that provides a fast and useful exploratory data visual of Pearson correlation coefficients.

As an example, the sample dataset `customer_churn_tbl` contains 20 features related to a telecommunications customer-base and whether or not the customer has churned. In this example, the `customerID` field is removed, and the missing `TotalCharges` are imputed with the `MonthlyCharges` figure. The `binarize()` function takes data in a "normal" format and converts it to a binned binary format (1s and 0s). Next, we use `correlate()` to correlate the binary features to a target (in our case Customer Churn). Finally, we visualize the correlation using the `plot_correlation_funnel()` function.

Note that assumptions have to be made in the number of bins and that this approach risks missing detail in imbalanced data sets.


```r
customer_churn_tbl %>%
  select(-customerID) %>%
  mutate(TotalCharges = ifelse(is.na(TotalCharges), MonthlyCharges, TotalCharges)) %>%
  binarize(n_bins = 5, thresh_infreq = 0.01, name_infreq = "OTHER", one_hot = TRUE) %>% 
  correlate(Churn__Yes) %>% 
  plot_correlation_funnel()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-21-1.png" width="672" />

As business insights, we see that these features are correlated with Churn:

|     |
|:----|
|“Month to Month” Contract Type |
|No Online Security |
|No Tech Support |
|Customer tenure less than 6 months |
|Fiber Optic internet service |
|Pays with electronic check |

We can also see that the following features are correlated with Staying (No Churn):

|     |
|:----|
|“Two Year” Contract Type
|Customer Purchases Online Security
|Customer Purchases Tech Support
|Customer tenure greater than 60 months (5 years)
|DSL internet service
|Pays with automatic credit card

As a response, the business can then choose to develop targeted strategies to retain high risk customers. 

### Models

Data models also provide clues about relationships. If a systematic relationship exists between variables it will appear as a pattern in the data. When spotting a pattern, ask:

-   Could this pattern be due to coincidence (i.e. random chance)?

-   How strong is the relationship implied by the pattern?

-   What other variables might affect the relationship?

-   Does the relationship change if you look at individual subgroups of the data?

**Survival** analysis is one of the oldest subfields of statistics. Today survival analysis models are important in Engineering, Insurance, Marketing, Medicine, Econometrics, and many other application areas.

A simpler characterization of Survival might be time-to-event analysis. These are use cases where we are concerned with the time it takes for an *event* to occur after an *exposure*. As an example, an exposure might be the date of a medical diagnosis. Or it could be the moment of childbirth. Or the date of delivery of a new tractor to a customer. Survival analysis data is aligned for all participants to zero at each participants exposure time. The event of interest could be the failure of a component of the tractor.

Most survival datasets have some censoring. A censored study subject may be censored due to:

-   Loss to follow-up (i.e. undocumented, not recorded)

-   Withdrawal from study

-   No event of interest by the end of the fixed study period

Censored subjects still provide information so must be appropriately included in the analysis. Ignoring censoring leads to an overestimate of the overall survival probability, because the censored subjects only contribute information for part of the follow-up time, and then fall out of the risk set, thus pulling down the cumulative probability of survival.

In the heavy equipment industry it is necessary to track component warranty claims and cost on machines sold. Warranty datasets are heavily censored because the study period rarely aligns with the warranty period for each machine delivered in a fleet. The study time period and fleet population membership must be carefully considered and explicitly defined.

We have special methods in survival for time to event data, first, because duration times are always positive. Traditional regression models make a number of assumptions for independence and normality that are no longer valid in this domain. There are distributions, like Weibull, that better represent the problem space.

**Time Series** modeling, sometimes also called forecasting, seeks to leverage the underlying patterns in data with a timestamp feature to make statements about causal inference or to predict the future. Time is a challenging feature to work with, in that the variables are not observations taken at once. Further, they are almost never independent, and will often be auto-correlated and have seasonality. This time series example is annual US Gross Domestic Product, in Billions of \$US, pulled from the Federal Reserve web API with the `fredr` package.


```r
fredr::fredr(series_id = 'GDPC1') %>% 
  ggplot() +
  geom_line(aes(x = date, y = value)) +
  labs(caption = "Federal Reserve Economic Data | US Real Gross Domestic Product")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-22-1.png" width="672" />

**Geospatial** and geospatial time-series modeling combine all of the challenges above and warrant their own detailed blog posts.

<a id="Conclusion"></a>

# Conclusion

> Your goal during EDA is to develop an understanding of your data. The easiest way to do this is to use questions as tools to guide your investigation. When you ask a question, the question focuses your attention on a specific part of your dataset and helps you decide which graphs, models, or transformations to make. [R for Data Science](https://r4ds.had.co.nz/) by Hadley Wickham

Cassie Kozyrkov at Google, in [The ultimate guide to starting AI](https://www.linkedin.com/pulse/ultimate-guide-starting-ai-cassie-kozyrkov/), argues that:

> You can't expect to get anything useful by asking wizards to sprinkle machine learning magic on your business without some effort from you first.

In my workplace, domain expert most often has the title "engineer," though it could as easily be "scientist" or "product manager." The key here is not about checking for correctness, but to grow the enterprise's understanding of the data and elicit valuable insights from it.

{{<tweet user="hadleywickham" id="804838201047339009">}}

Excellent book references on the topics covered by this post:

> [R for Data Science](https://r4ds.had.co.nz/) Chapter 7

> [Practical Machine Learning in R](https://www.wiley.com/en-us/Practical+Machine+Learning+in+R-p-9781119591535) Chapter 3

> [Build a Career in Data Science](https://www.manning.com/books/build-a-career-in-data-science) Chapter 10

> [Feature Engineering and Selection](http://www.feat.engineering/exploratory-visualizations.html) Chapter 4

Other posts:

> [Opinionated Analysis Development](https://rstudio.com/resources/rstudioconf-2017/opinionated-analysis-development/) Hilary Parker video

> [What Is Exploratory Data Analysis?](https://careerfoundry.com/en/blog/data-analytics/exploratory-data-analysis/)

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it 🙌
