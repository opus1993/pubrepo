library(rtweet)
library(tidyverse)
library(lubridate)

show_most_popular_tweet <- function(user){
  get_timeline(user, n=3200) %>%
    mutate(year = year(created_at)) %>%
    filter(year == 2019) %>%
    arrange(-favorite_count) %>%
    slice(1) %>%
    pull(status_id) %>%
    paste0('http://twitter.com/', user, '/status/', .) %>%
    browseURL()
}

show_most_popular_tweet('jim_gruman')
