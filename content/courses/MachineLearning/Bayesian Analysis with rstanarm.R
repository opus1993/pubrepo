# Baysean Regression Modeling with rstanarm
#
# Jake Thompson
#
#
# a review of frequentist method (basic regression)
#
#
library(rstanarm)
options(mc.cores = parallel::detectCores())
data(kidiq)

# a Frequentist model: predictign a childs score from the mothers iq
lm_model <- lm(kid_score ~ mom_iq, data = kidiq)

summary(lm_model)

# to focus on the coefficients in a tidy format
library(broom)
tidy(lm_model)

###
###   a Bayesian method
###
#   sample the posterior distribution (combination of likelihood and prior)
#
# p-values make inferences about the probability of the data, not parameter values
#

stan_model <- stan_glm(kid_score ~ mom_iq, data = kidiq)

summary(stan_model)

tidy(stan_model)

# So why bother with baysean?
#   when we look at the output, frequentis assumes parameters are fixed and data is random
#   baysean assumes that the data is fixed, and that the model parameters are random
#
#    frequentist p-value: what is the probabilty of observing a random data set, that results in a test statistic at least this large?
#
#    in contrast, Bayesians assume that the data are fixed, and instead, there is a distribution of parameter values that supports this dataset
#
#   significance / meaningfulness is comparable to credible intervals
#
#
posterior_interval(stan_model)

posterior_interval(stan_model, prob = 0.95)

posterior_interval(stan_model, prob = 0.50)

library(tidybayes)
library(dplyr)
posterior <- spread_draws(stan_model, mom_iq)
mean(between(posterior_mom_iq, 0.60, 0.65))

# ways to modify the models
#
#  look at the method of sampling the posterior - the chains, of iterations
#        the more iterations in a chain (length), the more robust the estimates
#
#        traceplot  - assure convergence ( r hats that approach 1)
#
#   lets talk about prior distibutions
#          reflect our prior beliefs about the values of the parameters
#
#    priors have the potential to be informative
#
#   by default, the intercept gets a normally distributed prior
#         other coefficients get a normally dist, with sd of 2.5
#
#               the adjusted figures are adjusted for the data provided
prior_summary(stan_model)

#      adjustment can be turned off

no_scale <- stan_glm(kid_score ~ mom_iq, data = kidiq,
                     prior_intercept = normal(autoscale = FALSE),
                     prior = normal(autoscale = FALSE),
                     prior_aux = exponential(autoscale = FALSE))

prior_summary(no_scale)

# using specified priors
#
#    exerting some control (even a different distribution)
#
#      why?   good reason to believe that a paramater has a certain value
#             constraints on a parameter (like non-zero, or positive)
#

stan_model <- stan_glm(kid_score ~ mom_iq, data = kidiq,
                       prior_intercept = normal(location = 0, scale = 10, autoscale = FALSE),
                       prior = normal(location = 0, scale = 2.5, autoscale = FALSE),
                       prior_aux = exponential(rate =1, autoscale = FALSE))

summary(stan_model)

prior_summary(stan_model)

# other choices of prior distributions:  normal, exponential, student_t, cauchy

# see the ?priors help page
#    flat priors    are  listed as         NULL    (flat) RARE
#      central limit theorem would suggest normal distribution
#
#
#
#     tuning the model, altering the estimation process
#
#         step size too big  control = list(adapt_delta = 0.99)
#
#      exceeding the maximum treedepth (w/o u-turns) 
#          control = list(max_treedepth = 15)
#
#



