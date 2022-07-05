---
date: "2022-06-16"
title: 'Generations in America'
author: "Jim Gruman"
format: hugo
categories: [R]
summary: "The composition of American generations per Pew Research & US Census"
featured: false
draft: false
---



<script src="index_files\libs/kePrint-0.0.1/kePrint.js"></script>
<link href="index_files\libs/lightable-0.0.1/lightable.css" rel="stylesheet" />


Inspired and updated from

> [Jason Timm's
> post](https://www.jtimm.net/2020/06/10/american-generations/)

> Kyle Walker's [Analyzing US Census
> Data](https://walker-data.com/census-r/index.html) updates

### American Generations

Let's have a look at the composition of American generations with Pew
Research definitions and US Census data.

The outcome: a perspective on the changing demographics of America.

Four of America's seven living generations are more or less "complete,"
and only getting smaller: `Greatest`, `Silent`, `Boomers`, and `Gen X`.
The generation comprised of `Millenials` is complete as well, in that it
has been delineated chronologically; however, the group continues to
grow via immigration.

``` r
suppressPackageStartupMessages({
library(tidyverse) # tidy data manipulation, including dplyr and ggplot
library(lubridate)   # date manipulation tools
library(tidycensus)
  
library(tigris)

})
theme_set(hrbrthemes::theme_ipsum_tw())   # Set a ggplot color, font theme
showtext::showtext_auto() # helps to locate windows fonts

options(tigris_use_cache = TRUE, 
        tigris_class = "sf")

gen <- c('Post-Z',
         'Gen Z',
         'Millennial',
         'Gen X',
         'Boomers',
         'Silent',
         'Greatest')

range <- c('> 2012',    # post Z
           '1997-2012', # Gen Z
           '1981-1996', # Millenials
           '1965-1980', # X
           '1946-1964', # Boomers
           '1928-1945', # Silent
           '< 1927')    # greatest

gen_desc <- tibble(rank = 7:1,
                   gen = gen,
                   range = range) %>%
  arrange(rank)

gen_desc %>%
  knitr::kable(format = "html",
               booktabs = T,
               caption = "Pew Research Definitions") %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = F
  ) %>%
  kableExtra::add_footnote(
    c(
      "https://www.pewresearch.org/fact-tank/2019/01/17/where-millennials-end-and-generation-z-begins/"
    )
  )
```

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pew Research Definitions</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> rank </th>
   <th style="text-align:left;"> gen </th>
   <th style="text-align:left;"> range </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Greatest </td>
   <td style="text-align:left;"> &lt; 1927 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> Silent </td>
   <td style="text-align:left;"> 1928-1945 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> Boomers </td>
   <td style="text-align:left;"> 1946-1964 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> Gen X </td>
   <td style="text-align:left;"> 1965-1980 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> Millennial </td>
   <td style="text-align:left;"> 1981-1996 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> Gen Z </td>
   <td style="text-align:left;"> 1997-2012 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> Post-Z </td>
   <td style="text-align:left;"> &gt; 2012 </td>
  </tr>
</tbody>
<tfoot>
<tr>
<td style = 'padding: 0; border:0;' colspan='100%'><sup>a</sup> https://www.pewresearch.org/fact-tank/2019/01/17/where-millennials-end-and-generation-z-begins/</td>
</tr>
</tfoot>
</table>

While `Gen Z` has been tentatively stamped chronologically by the folks
at Pew Research, only about half have entered the work force. And though
we include them here, the `Post-Z` generation is mostly but a twinkle in
someones eye; half of the group has yet to be born.

### Monthly US population estimates

The *Monthly Postcensal Resident Population plus Armed Forces Overseas,
December 2021* is made available by the US Census
[here](https://www.census.gov/programs-surveys/popest/technical-documentation/research/evaluation-estimates/2020-evaluation-estimates/2010s-national-detail.html).
The census has transitioned to a new online interface, and this
particular file is built off of some of their projections.

``` r
pops <- read_csv(
  file = "https://www2.census.gov/programs-surveys/popest/datasets/2010-2020/national/asrh/NC-EST2020-ALLDATA-R-File24.csv",
  show_col_types = FALSE) %>% 
  filter(MONTH == '12' & YEAR == '2021') |> 
  pivot_longer(names_to = "race",
               values_to = "pop",
               cols = c(-UNIVERSE:-AGE)) |> 
  replace_na(replace = list(pop = 0))
```

A more detailed description of the population estimates can be found
[here](https://www2.census.gov/programs-surveys/popest/technical-documentation/file-layouts/2010-2018/nc-est2018-alldata.pdf).
Note: Race categories reflect non-Hispanic populations.

``` r
race <- c('NHWA', 'NHBA', 'NHIA', 
          'NHAA', 'NHNA', 'NHTOM', 'H')

race1 <- c('White Alone',
           'Black Alone',
           'American Indian Alone',
           'Asian Alone',
           'Native Hawaiian Alone',
           'Two or More Races',
           'Hispanic')

labels <- tibble(race = race, 
                 race1 = race1)

search <- paste(paste0('^',race, '_'), collapse =  '|')
```

The following table details **a random sample of the data set** -- with
Pew Research defined generations & estimated year-of-birth.

``` r
gen_pops <- pops %>%
  filter(grepl(search, race)) %>%
  mutate(race = gsub('_.*$', '', race)) %>%
  group_by(AGE, race) %>%
  summarise(pop = sum(pop),
            .groups = "drop") %>%
  left_join(labels, by = "race") %>%
  filter(AGE != '999') %>%
  mutate(yob = 2021 - AGE)  %>% 
  mutate(gen = case_when(
    yob > 2012 ~ 'Post-Z',
    yob < 2013 & yob > 1996 ~ 'Gen Z',
    yob < 1997 & yob > 1980 ~ 'Millennial',
    yob < 1981 & yob > 1964 ~ 'Gen X',
    yob < 1965 & yob > 1945 ~ 'Boomers',
    yob < 1946 & yob > 1927 ~ 'Silent',
    yob < 1928 ~ 'Greatest',
    TRUE ~ "big problem")) %>%
  left_join(gen_desc, by = "gen") %>%
  ungroup() %>%
  select(gen, rank, range, race, 
         race1, yob, AGE, pop)

set.seed(999)
gen_pops %>% sample_n(7)  %>%
  select(gen, range, race1:pop) %>%
  knitr::kable(format = "html",
               booktabs = T,
               caption = "Seven Sample Census Data Lines with Pew Generational Definitions") %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = F
  ) 
```

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Seven Sample Census Data Lines with Pew Generational Definitions</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> gen </th>
   <th style="text-align:left;"> range </th>
   <th style="text-align:left;"> race1 </th>
   <th style="text-align:right;"> yob </th>
   <th style="text-align:right;"> AGE </th>
   <th style="text-align:right;"> pop </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Gen X </td>
   <td style="text-align:left;"> 1965-1980 </td>
   <td style="text-align:left;"> Asian Alone </td>
   <td style="text-align:right;"> 1975 </td>
   <td style="text-align:right;"> 46 </td>
   <td style="text-align:right;"> 290698 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Post-Z </td>
   <td style="text-align:left;"> &gt; 2012 </td>
   <td style="text-align:left;"> Native Hawaiian Alone </td>
   <td style="text-align:right;"> 2013 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 8746 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Silent </td>
   <td style="text-align:left;"> 1928-1945 </td>
   <td style="text-align:left;"> Asian Alone </td>
   <td style="text-align:right;"> 1938 </td>
   <td style="text-align:right;"> 83 </td>
   <td style="text-align:right;"> 58785 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Gen X </td>
   <td style="text-align:left;"> 1965-1980 </td>
   <td style="text-align:left;"> American Indian Alone </td>
   <td style="text-align:right;"> 1970 </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 29663 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Silent </td>
   <td style="text-align:left;"> 1928-1945 </td>
   <td style="text-align:left;"> Black Alone </td>
   <td style="text-align:right;"> 1928 </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 25214 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Millennial </td>
   <td style="text-align:left;"> 1981-1996 </td>
   <td style="text-align:left;"> American Indian Alone </td>
   <td style="text-align:right;"> 1995 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 36466 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Post-Z </td>
   <td style="text-align:left;"> &gt; 2012 </td>
   <td style="text-align:left;"> Black Alone </td>
   <td style="text-align:right;"> 2020 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 520807 </td>
  </tr>
</tbody>
</table>

### Compositions of American Generations

The figure below summarizes the US population by generation. These
numbers will vary some depending on the data source.

``` r
gen_pops %>%
  group_by(gen, rank) %>%
  summarize(pop = sum(pop),
            .groups = "drop") %>%
  mutate(lab = round(pop/1000000, 1)) %>%
  ggplot(aes(x = pop, 
             y = fct_reorder(gen, rank), 
             fill = gen)) +
  geom_col(show.legend = FALSE)  +
  geom_text(aes(label = lab), 
            size = 6,
            nudge_x = 3000000) +
  hrbrthemes::scale_fill_ipsum() +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_blank(),
        plot.title.position = "plot",
        axis.text.y = element_text(size = 6*3)) +
  labs(title = 'Population by American Generation in Millions',
       caption = 'SOURCE: US Census, Monthly Postcensal Resident Population plus Armed Forces Overseas, December 2021.',
       x = NULL, 
       y = NULL)
```

<img src="index_files/figure-gfm/barchart-1.png" width="768" />

``` r
gg <- gen_pops %>% 
  group_by(yob, AGE, gen) %>%
  summarize(tot = sum(pop),
            .groups = "drop") %>%
  group_by(gen) %>%
  mutate(tot = max(tot)) %>% 
  filter(yob %in% c('1919', '1928', '1946', '1965', 
                    '1981', '1997', '2013'))
```

The figure below illustrates the US population by single year of age,
ranging from the population aged less than a year to the population over
100. Generation membership per single year of age is specified by color.

``` r
gen_pops %>%
  ggplot(aes(x = AGE, 
             y = pop, 
             fill = gen)) +
  geom_vline(xintercept = gg$AGE,
             linetype = 2, 
             color = 'gray', 
             size = .25) +
  geom_col(show.legend = FALSE,
           width = .7)   +
  annotate(geom = "text", 
           x = gg$AGE - 8, 
           y = gg$tot + 100000, 
           label = gg$gen,
           size = 8) +
  hrbrthemes::scale_fill_ipsum() +
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        plot.title.position = "plot") +
  scale_x_reverse(breaks = rev(gg$AGE)) +
  scale_y_continuous(labels = scales::comma_format()) +
  labs(title = 'American Population by Single-year Age & Generation',
       caption = 'SOURCE: US Census, Monthly Postcensal Resident Population plus Armed Forces Overseas, December 2021.',
       x = "Age",
       y = NULL)
```

<img src="index_files/figure-gfm/singleyear-1.png" width="768" />

Next, let's crosscut the single year of age counts presented above by
race & ethnicity.

``` r
gen_pops %>%
  ggplot(aes(x = AGE, 
             y = pop, 
             fill = race1)) +
  geom_area(stat = "identity",
            color = 'white') +
  geom_vline(xintercept = gg$AGE,
             linetype = 2, color = 'gray', size = .25) +
  annotate(geom = "text", 
           x = gg$AGE - 8, 
           y = gg$tot + 100000, 
           label = gg$gen,
           size = 8) +
  hrbrthemes::scale_fill_ipsum(guide = guide_legend(label.position = "bottom",
             nrow = 1 )) +
  theme(legend.position = "bottom",
        legend.justification = "center",
        legend.title = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        plot.title.position = "plot",
        legend.key.width = unit(5, "line")) +
  scale_x_reverse(breaks = rev(gg$AGE) ) +
  scale_y_continuous(labels = scales::comma_format()) +
  labs(title = 'US Population by Age, Race & Generation',
       caption = 'SOURCE: US Census, Monthly Postcensal Resident Population \nplus Armed Forces Overseas, December 2021.',
       x = "Age",
       y = NULL)
```

<img src="index_files/figure-gfm/ethnicity-1.png" width="768" />

``` r
white_label <- gen_pops %>% 
  group_by(gen, AGE) %>%
  mutate(per = pop/sum(pop)) %>%
  filter(race1 == 'White Alone') %>%
  group_by(gen) %>%
  mutate(per = max(per)) %>% #For labels below.
  arrange(yob) %>%
  filter(yob %in% c('1919', '1928', '1946', '1965', 
                    '1981', '1997', '2013'))
```

The last figure illustrates a **proportional perspective of race &
ethnicity in America** by single year of age. Per figure, generational
differences (at a single point in time) can shed light on (the direction
of) potential changes in the overall composition of a given populace, as
well as a view of what that populace may have looked like in the past.

``` r
gen_pops %>%
  group_by(gen, AGE) %>%
  mutate(per = pop/sum(pop)) %>%
  ggplot(aes(x = (AGE), 
             y = per, 
             fill = race1)) +
  geom_area(stat = "identity",
            color = 'white',
            alpha = 0.85) +
  geom_hline(yintercept = .5, 
             linetype = 4,
             color = 'white') +
  geom_vline(xintercept = gg$AGE,
             linetype = 2, 
             color = 'gray', 
             size = .25) +
  annotate(geom = "text", 
           x = gg$AGE - 4.5, 
           y = white_label$per - .09, 
           label = gg$gen,
           size = 8,
           color = "black") +
  hrbrthemes::scale_fill_ipsum(guide = guide_legend(label.position = "bottom",
             nrow = 1,
             label.theme = element_text(size = 18)
             )) +
  theme(legend.position = "bottom",
        legend.justification = "center",
        legend.title = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        plot.title.position = "plot",
        legend.key.width = unit(5, "line")) +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_x_reverse(breaks = rev(gg$AGE)) +
  labs(title = 'Portion of American Population by Age, Race & Generation',
       fill = "",
       x = "Age",
       y = NULL)
```

<img src="index_files/figure-gfm/ethnicityProportion-1.png"
width="768" />

### American generations in (apparent) time & space

Aggregate race-ethnicity profiles for America's seven living generations
are presented in the table below. Per [American Community Survey (ACS)
2018 5-year
estimates](https://github.com/jaytimm/tech-notes-american-politics/blob/master/notes/America_american.md),
the `Gen X` race-ethnicity profile (or distribution) is most
representative of American demographics overall.

``` r
sums <- gen_pops %>%
  group_by(rank, gen, race1) %>%
  summarize(pop = sum(pop),
            .groups = "drop") %>%
  group_by(gen) %>%
  mutate(per = round(pop / sum(pop), 3))

sums %>%
  select(rank, gen, race1, per) %>%
  mutate(per = scales::percent(per, accuracy = 0.1)) %>%
  pivot_wider(names_from = "race1",
              values_from = "per") %>%
  knitr::kable(format = "html",
               booktabs = T,
               caption = "Race-Ethnicity Distribution of American Generations") %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = F
  )  %>%
  kableExtra::row_spec(4, color = "white", background = "#D18975")
```

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Race-Ethnicity Distribution of American Generations</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> rank </th>
   <th style="text-align:left;"> gen </th>
   <th style="text-align:left;"> American Indian Alone </th>
   <th style="text-align:left;"> Asian Alone </th>
   <th style="text-align:left;"> Black Alone </th>
   <th style="text-align:left;"> Hispanic </th>
   <th style="text-align:left;"> Native Hawaiian Alone </th>
   <th style="text-align:left;"> Two or More Races </th>
   <th style="text-align:left;"> White Alone </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> Greatest </td>
   <td style="text-align:left;"> 0.4% </td>
   <td style="text-align:left;"> 5.7% </td>
   <td style="text-align:left;"> 7.7% </td>
   <td style="text-align:left;"> 7.3% </td>
   <td style="text-align:left;"> 0.1% </td>
   <td style="text-align:left;"> 0.8% </td>
   <td style="text-align:left;"> 78.0% </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> Silent </td>
   <td style="text-align:left;"> 0.5% </td>
   <td style="text-align:left;"> 4.7% </td>
   <td style="text-align:left;"> 8.4% </td>
   <td style="text-align:left;"> 8.5% </td>
   <td style="text-align:left;"> 0.1% </td>
   <td style="text-align:left;"> 0.8% </td>
   <td style="text-align:left;"> 76.9% </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> Boomers </td>
   <td style="text-align:left;"> 0.7% </td>
   <td style="text-align:left;"> 5.0% </td>
   <td style="text-align:left;"> 10.9% </td>
   <td style="text-align:left;"> 10.9% </td>
   <td style="text-align:left;"> 0.1% </td>
   <td style="text-align:left;"> 1.0% </td>
   <td style="text-align:left;"> 71.4% </td>
  </tr>
  <tr>
   <td style="text-align:right;color: white !important;background-color: #D18975 !important;"> 4 </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> Gen X </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> 0.7% </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> 6.8% </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> 12.6% </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> 18.9% </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> 0.2% </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> 1.4% </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> 59.5% </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> Millennial </td>
   <td style="text-align:left;"> 0.8% </td>
   <td style="text-align:left;"> 7.1% </td>
   <td style="text-align:left;"> 13.9% </td>
   <td style="text-align:left;"> 21.0% </td>
   <td style="text-align:left;"> 0.2% </td>
   <td style="text-align:left;"> 2.2% </td>
   <td style="text-align:left;"> 54.8% </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> Gen Z </td>
   <td style="text-align:left;"> 0.8% </td>
   <td style="text-align:left;"> 5.3% </td>
   <td style="text-align:left;"> 13.8% </td>
   <td style="text-align:left;"> 24.7% </td>
   <td style="text-align:left;"> 0.2% </td>
   <td style="text-align:left;"> 4.0% </td>
   <td style="text-align:left;"> 51.2% </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> Post-Z </td>
   <td style="text-align:left;"> 0.8% </td>
   <td style="text-align:left;"> 5.6% </td>
   <td style="text-align:left;"> 13.8% </td>
   <td style="text-align:left;"> 25.8% </td>
   <td style="text-align:left;"> 0.2% </td>
   <td style="text-align:left;"> 5.1% </td>
   <td style="text-align:left;"> 48.6% </td>
  </tr>
</tbody>
</table>

### Race-ethnicity profiles for US Counties

Here, we compare race-ethnicity profiles for US counties to those of
American generations. Using the `tidycensus` R package, we first obtain
county-level race-ethnicity estimates (ACS 2020 5-year);

``` r
#x <- tidycensus::load_variables(year = 2018, dataset = 'acs5/profile')
variable <- c('DP05_0071P', 'DP05_0077P', 'DP05_0078P',
              'DP05_0079P', 'DP05_0080P', 
              'DP05_0081P', 'DP05_0082P', 
              'DP05_0083P')

variable_name <- c('Hispanic', 'White Alone', 'Black Alone','American Indian Alone', 'Asian Alone','Native Hawaiian Alone', 'Some Other Race Alone','Two or More Races')

gen <-  tidycensus::get_acs(geography = 'county',
                            variables = variable,
                            year = 2020,
                            survey = 'acs5') %>%
  left_join(tibble(variable, variable_name)) %>%
  select(-variable, -moe) %>%
  rename(variable = variable_name) %>%
  select(GEOID:NAME, variable, estimate)
```

then, via the `tigris` library, we obtain shapefiles for (1) all US
counties and (2) US states.

``` r
nonx <- c('78', '69', '66', '72', '60', '15', '02')

us_counties <- tigris::counties(cb = TRUE) %>% 
  filter(!STATEFP %in% nonx)
us_states <- tigris::states(cb = TRUE) %>% 
  filter(!STATEFP %in% nonx)

laea <- sf::st_crs("+proj=laea +lat_0=30 +lon_0=-95")
us_counties <- sf::st_transform(us_counties, laea)
us_states <- sf::st_transform(us_states, laea)
```

### Comparing Distributions

The table below highlights the race-ethnicity distribution for my
hometown, in **Buchanan County, IA**, GEOID = 19019.

``` r
gen %>%
  filter(GEOID == "19019",
         estimate > 0) %>%
  mutate(estimate = scales::percent(estimate / 100, accuracy = 0.1)) %>%
  pivot_wider(names_from = "variable",
              values_from = "estimate") %>%
  select(-GEOID,-NAME) %>%
  knitr::kable(format = "html",
               booktabs = T,
               caption = "Race-Ethnicity Distribution of Buchanan County, Iowa") %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = F
  ) 
```

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Race-Ethnicity Distribution of Buchanan County, Iowa</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Hispanic </th>
   <th style="text-align:left;"> White Alone </th>
   <th style="text-align:left;"> Black Alone </th>
   <th style="text-align:left;"> American Indian Alone </th>
   <th style="text-align:left;"> Asian Alone </th>
   <th style="text-align:left;"> Two or More Races </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1.6% </td>
   <td style="text-align:left;"> 95.9% </td>
   <td style="text-align:left;"> 0.1% </td>
   <td style="text-align:left;"> 0.1% </td>
   <td style="text-align:left;"> 0.3% </td>
   <td style="text-align:left;"> 1.9% </td>
  </tr>
</tbody>
</table>

Via `Kullback–Leibler divergence` (ie, relative entropy), we compare the
demographic profile of Buchanan County to the demographic profiles of
each American generation. Per the table below, the Buchanan County
profile is most similar to that of the `Greatest` generation. Per the
lowest relative entropy value. This is not to say that there are more
`Greatest` generation in Buchanan County; instead, the racial
demographics of Buchanan County are most akin to an America when the
`Greatest` generation were in their prime.

``` r
which1 <- gen %>%
  mutate(estimate = ifelse(estimate == 0, .0000001, estimate)) %>%
  inner_join(sums, by = c('variable' = 'race1')) %>%
  
  mutate(div = estimate/100 * log((estimate/100)/per)) %>%
  group_by(GEOID, NAME, gen) %>%
  summarize(relative_entropy = round(sum(div), 4),
            .groups = "drop")

which1 %>%
  filter(GEOID == "19019") %>%
  left_join(gen_desc) %>%
  select(rank, NAME, gen, relative_entropy) %>%
  arrange(rank) %>%
  knitr::kable(format = "html",
               booktabs = T,
               caption = "Kullback–Leibler Divergence of Buchanan County, Iowa") %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = F
  )  %>%
  kableExtra::row_spec(1, color = "white", background = "#D18975")
```

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Kullback–Leibler Divergence of Buchanan County, Iowa</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> rank </th>
   <th style="text-align:left;"> NAME </th>
   <th style="text-align:left;"> gen </th>
   <th style="text-align:right;"> relative_entropy </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;color: white !important;background-color: #D18975 !important;"> 1 </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> Buchanan County, Iowa </td>
   <td style="text-align:left;color: white !important;background-color: #D18975 !important;"> Greatest </td>
   <td style="text-align:right;color: white !important;background-color: #D18975 !important;"> 0.1757 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> Buchanan County, Iowa </td>
   <td style="text-align:left;"> Silent </td>
   <td style="text-align:right;"> 0.1872 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> Buchanan County, Iowa </td>
   <td style="text-align:left;"> Boomers </td>
   <td style="text-align:right;"> 0.2493 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> Buchanan County, Iowa </td>
   <td style="text-align:left;"> Gen X </td>
   <td style="text-align:right;"> 0.4079 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> Buchanan County, Iowa </td>
   <td style="text-align:left;"> Millennial </td>
   <td style="text-align:right;"> 0.4762 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> Buchanan County, Iowa </td>
   <td style="text-align:left;"> Gen Z </td>
   <td style="text-align:right;"> 0.5283 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> Buchanan County, Iowa </td>
   <td style="text-align:left;"> Post-Z </td>
   <td style="text-align:right;"> 0.5728 </td>
  </tr>
</tbody>
</table>

For reference, the table below highlights the generational distribution
for **Buchanan County, IA**, GEOID = 19019.

``` r
which1 %>%
  filter(GEOID == "19019") %>%
  mutate(relative_entropy = scales::percent(relative_entropy, accuracy = 0.1)) %>%
  pivot_wider(names_from = "gen",
              values_from = "relative_entropy") %>%
  select(-GEOID,-NAME) %>%
  knitr::kable(format = "html",
               booktabs = T,
               caption = "Generational Distribution of Buchanan County, Iowa",
  ) %>%
  kableExtra::kable_styling(
    bootstrap_options = c("striped", "hover", "condensed"),
    full_width = F
  ) 
```

<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Generational Distribution of Buchanan County, Iowa</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Boomers </th>
   <th style="text-align:left;"> Gen X </th>
   <th style="text-align:left;"> Gen Z </th>
   <th style="text-align:left;"> Greatest </th>
   <th style="text-align:left;"> Millennial </th>
   <th style="text-align:left;"> Post-Z </th>
   <th style="text-align:left;"> Silent </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 24.9% </td>
   <td style="text-align:left;"> 40.8% </td>
   <td style="text-align:left;"> 52.8% </td>
   <td style="text-align:left;"> 17.6% </td>
   <td style="text-align:left;"> 47.6% </td>
   <td style="text-align:left;"> 57.3% </td>
   <td style="text-align:left;"> 18.7% </td>
  </tr>
</tbody>
</table>

``` r
which2 <- which1 %>%
  group_by(GEOID, NAME) %>%
  filter(relative_entropy == min(relative_entropy)) %>%
  ungroup() 
```

So, while `Gen X` is most representative of America in the aggregate,
per the map below, the demographics of America's youngest & eldest
generations are often most prevalent within each county-level unit.
`Post-Z` in the West, and the `Greatest` in the East & Midwest. New &
Old Americas, perhaps.

``` r
us_counties %>%
  left_join(which2, by = 'GEOID') %>%
  ggplot() + 
  geom_sf(aes(fill = gen),  lwd = 0) + 
  geom_sf(data = us_states, 
          fill = NA, 
          show.legend = F, 
          color = "darkgray", 
          lwd = .5) +
  hrbrthemes::scale_fill_ipsum(guide =
  guide_legend(label.position = "bottom", 
             nrow = 1, 
             keywidth = 5,
             label.theme = element_text(size = 18))) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        panel.grid.major =  element_blank(),
        legend.position = 'bottom',
        legend.justification = "center",
        plot.title.position = "plot",
        legend.key.width = unit(0.5, "cm")) +
  labs(title = "Counties & their Most Representative Generational Proportions",
       fill = "")
```

<img src="index_files/figure-gfm/uscounties-1.png" width="768" />

### Conclusion

There are many ways to characterize the different perspectives on the
composition of America & American generations, and the changing
demographics of America.

------------------------------------------------------------------------

### Did you find this page helpful? Consider sharing it 🙌
