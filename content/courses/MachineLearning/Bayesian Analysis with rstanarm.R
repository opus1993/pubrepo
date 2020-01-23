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
# using the Rsquared statistic (linear regression) - the coefficient of determination, the proportion of variance that can be explained, ranging between 0 and 1
#
# 
ss_res <- var(residuals(stan_model))
ss_total <- var(fitted(stan_model)) + var(residuals(stan_model))
1-(ss_res/ss_total)

# posterior prective model checks
#
# another way to investigate model fit
#
#    
# returns a matrix of predicted IQ scores, which form a distribution
predictions <- posterior_linpred(stan_model)

iter1 <- predictions[1,]
iter2 <- predictions[2,]

summary(kidiq$kid_score)
summary(iter1)
summary(iter2)
#   means look comparable, but the distribution ranges are not
#also

kidiq$kid_score[24]

summary(predictions[,24])

# the actual iq score compared to the distribution of the model

kidiq$kid_score[185]

summary(predictions[,185])
#   THE MODEL DOES NOT DO A VERY GOOD JOB OF PREDICTING, FOR THIS STUDENT

r2_posterior <- bayes_R2(stan_model)

summary(r2_posterior)

quantile(r2_posterior, probs = c(0.025, 0.975))

hist(r2_posterior)

# each distribution of predicted scores, along with the observed data
pp_check(stan_model, "dens_overlay")

#  the means of each replication and the mean from the observed data
pp_check(stan_model, "stat")

# the means and sd of each replication, versus the mean/sd from observed
pp_check(stan_model, "stat_2d")


#
#
#  what do we do for model comparison?
#
#   use the loo package for model comparisons (approximates cross validation)
library(loo)

model1 <- stan_glm(kid_score ~ mom_iq, data = kidiq)
model2 <- stan_glm(kid_score ~ mom_iq * mom_hs, data = kidiq)

loo1_pred <- loo(model1)
loo2_pred <- loo(model2)

loo_compare(loo1_pred, loo2_pred)
# positive differences mean the second model is favored
# the se standard error when small means that the model is meaningful

# visualizing a bayesian model
#
#

stan_model <- stan_glm(kid_score ~ mom_iq, data = kidiq)
tidy_coef <-tidy(stan_model)

model_intercept <- tidy_coef$estimate[1]
model_slope <- tidy_coef$estimate[2]

library(ggplot2)
library(tidybayes)

ggplot(kidiq, aes(x = mom_iq, y = kid_score))+
  geom_point()+
  geom_abline(intercept = model_intercept, slope = model_slope)

draws <- spread_draws(stan_model, `(Intercept)`, mom_iq)

ggplot(kidiq, aes(x = mom_iq, y = kid_score))+
  geom_point()+
  geom_abline(data = draws, aes(intercept = `(Intercept)`,
                                slope = mom_iq),
              size = 0.2, alpha = 0.1, color = "skyblue")+
  geom_abline(intercept = model_intercept, slope = model_slope)

## making predictions
#
#
#
#

stan_model <- stan_glm(kid_score ~ mom_iq + mom_hs, data = kidiq)

posteriors <- posterior_predict(stan_model)
posteriors[1:10,1:5]

# to make predictions for entirely new data

predict_data <- data.frame(
  mom_iq = 110,
  mom_hs = c(0,1)
)

predict_data

new_predictions <- posterior_predict(stan_model, newdata = predict_data)

new_predictions[1:10,]

summary(new_predictions[,1])
summary(new_predictions[,2])

## visualizing predictions
#
#
#
#

new_predictions <- as.data.frame(new_predictions)

colnames(new_predictions) <- c("No HS", "Completed HS")

plot_posterior <- tidyr::gather(new_predictions, key = "HS", value = "predict")

head(plot_posterior)

ggplot(plot_posterior, aes(x=predict))+
  facet_wrap(~ HS, ncol = 1)+
  geom_density()
