#### Title
# Fundamentals of Bayesian Data Analysis in R
#
# A first taste of Bayes
# Rasmus Baath   (Both)
#
#Thomas Bayes 1702-1761
#       probabalistic inference
#       using the full power of probability theory
#       numbers between 0 and 1,   statement about certainty of outcome
#       1 is complete certainty of yes, the case
#       0 is complete certainty of no, not the case
#
#   Prior distribution | Posterior distribution
#
#    Bayesian always model a new posterior probability
#



# The generative zombie drug model

# Set parameters
prop_success <- 0.42
n_zombies <- 100

# Simulating data
data <- c()
for(zombie in 1:n_zombies) {
  data[zombie] <- runif(1, min = 0, max = 1) < prop_success
}
data <- as.numeric(data)
data

data <- sum(data == 1)
data

# Try out rbinom to achieve the same result
rbinom(n = 1, size = 100, prob = 0.42)

rbinom(n = 200, size = 100, prob = 0.42)

###
###  Example:  How many visitors could your site get
### 
### To get more visitors to your website you are considering paying for an ad to be shown 100 times on a popular social media site. According to the social media site, their ads get clicked on 10% of the time.
#
# Assume that 10% is a reasonable number, and assume that the binomial distribution is a reasonable generative model for how people click on ads.

# Fill in the parameters
n_samples <- 100000
n_ads_shown <- 100
proportion_clicks <- 0.10
n_visitors <- rbinom(n_samples, size = n_ads_shown, 
                     prob = proportion_clicks)

# Visualize n_visitors
hist(n_visitors)

# representing uncertainty with priors
#
# priors are also a distribution.  Fortunately in R, a vector inputs nicely into another function that also returns a vector

n_samples <- 100000
n_ads_shown <- 100

# Update proportion_clicks
proportion_clicks <- runif(n = n_samples, min = 0.0, max = 0.2)

n_visitors <- rbinom(n = n_samples, size = n_ads_shown, prob = proportion_clicks)

hist(n_visitors)

## given a generative model and priors, we have a bayesian model
#
#      Rasmus presents a great series of gganimate plots with 
#        central scatterplot and each single-parameter histogram
#        on x and y axis
#
#  The essence of Bayesian inference:
#
#    Bayesian inference is conditioning on data, in order to learn about parameter values
#
# Bayes is Flexibe
#
#    you can include information sources in addition to the data
#    easy to compare and contrast between groups or datasets ...
#    
#       the probability of this   | "given"  that
#       is a conditional probability
#
# if two possible outcomes are mutally exclusive, then they may be summed
#
# if two possible outcomes are unrelated, then P of both is A * B
#
# Final example:   the temperature in a normal lake
#
#    will the water be warm enough to swim in?   ....over 18C
#
temp <- c(19,23,20,17,23)    # on the 20th of July, in my lake
# will choose a normal distribution
#
#
sigma<- seq(0.1, 10, by = 0.3)
mu = seq(8,30, by = 0.5)
pars <- expand.grid(mu = mu, sigma = sigma)
pars$mu_prior <- dnorm(pars$mu, mean = 18, sd = 5)
pars$sigma_prior <- dunif(pars$sigma, min = 0, max = 10)
pars$prior<- pars$mu_prior*pars$sigma_prior
for(i in 1:nrow(pars)){
  likelihoods<-dnorm(temp, pars$mu[i], pars$sigma[i])
  pars$likelihood[i]<- prod(likelihoods)
}
pars$probability <- pars$likelihood * pars$prior
pars$probability <- pars$probability / sum(pars$probability)

levelplot(probability ~ mu * sigma, data = pars)

# The BEST models and zombies on a diet
#The t-test is a classical statistical procedure used to compare the means of two data sets. In 2013 John Kruschke developed a souped-up Bayesian version of the t-test he named BEST (standing for Bayesian Estimation Supersedes the t-test). Let's try out BEST as implemented in the BEST package.

# a pre-packaged model called BEST
# assumes data from a t-distribution
# uses Markov chaine Monte Carlo method
#
library(BEST)
iq<- c(55,44,34,18,51,40,40,49,48,46)
fit<- BESTmcmc(iq)
fit
plot(fit)

# Zombies are stupid, but you and your colleagues at the National Zombie Research Laboratory are interested in how diet affects zombie intelligence. You have done a small experiment where you measured the IQ of 10 zombies on a regular diet and 10 zombies on a brain-based diet. The hypothesis is that zombies that eat more brains perform better on IQ tests. To the right, the data from the experiment is put into the variables iq_brains and iq_regular

# Calculate the mean difference in IQ between the two groups by taking the mean of iq_brains minus the mean of iq_regular. Remember that mean(iq_brains) calculates the sample mean of iq_brains

# The IQ of zombies on a regular diet and a brain based diet.
iq_brains <- c(44, 52, 42, 66, 53, 42, 55, 57, 56, 51)
iq_regular <- c(55, 44, 34, 18, 51, 40, 40, 49, 48, 46)

# Calculate the mean difference in IQ between the two groups
mean(iq_brains) - mean(iq_regular)

# Fit the BEST model to the data from both groups
library(BEST)
best_posterior<-BESTmcmc(iq_brains, iq_regular)

plot(best_posterior)


