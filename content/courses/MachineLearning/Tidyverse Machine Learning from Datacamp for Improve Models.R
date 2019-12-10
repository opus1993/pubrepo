
library(tidyverse)
library(broom)
library(purrr)
library(dslabs)

##################
Machine Learning in the tidyverse

General Approach:
  
Step1:  Make a list column, using
   initial_split()
   vfold_cv()
   crossing()
   
Step2:  Work with list columns
   map()
   training()
   testing()
   lm()
   ranger()
   mae()
   
Step3:  Simplify the list columns
   unnest()
   map_dbl()


###########   later, use continent and region to impute averages
gapminder <- gapminder %>%
  filter(!is.na(gdp), !is.na(infant_mortality)) %>%
  select(-continent, -region)

# Nest the dataframe into a tibble, to create linear models for each country
gap_nested<- gapminder %>%
     group_by(country)%>%
     nest()

gap_models<-gap_nested %>%
    mutate(model = map(.x=data, .f = ~lm(formula = life_expectancy~year, data = .x)))

gap_models %>%
  mutate(coef = map(model, ~tidy(.x))) %>%
  unnest(coef) %>%
  filter(term == "year")%>%
  ggplot()+geom_histogram(aes(estimate))+labs(title = "Coefficients for all Countries")

gap_models %>%
  mutate(coef =  map(model, ~glance(.x))) %>%
  unnest(coef) %>%
  ungroup()%>%
  top_n(n= 6, wt = -r.squared)

# to compare the predicted with the original value
gap_models %>% filter(country == "Italy")%>%
  mutate(augmented = map(model, ~augment(.x))) %>%
  unnest(augmented) %>%
  ggplot(aes(x=year, y=life_expectancy))+
  geom_point()+
  geom_line(aes(y=.fitted), color = "red")

#explore plots of the worst fitting models

# explore more complex regression models

gap_models<-gap_nested %>%
  mutate(model = map(.x=data, .f = ~lm(formula = life_expectancy~year+fertility+population, data = .x, na.action=na.exclude)))

str(gapminder)


# ??????????????????????????????????????

#How will my model perform on new data?   What is the best performing model?
  
# make a test train split

  

library(rsample)
# Prepare the initial split object
gap_split <- initial_split(gapminder, prop = .75)

# Extract the training dataframe
training_data <- training(gap_split)

# Extract the testing dataframe
testing_data <- testing(gap_split)

# Calculate the dimensions of both training_data and testing_data
dim(training_data)
dim(testing_data)


# Prepare the dataframe containing the cross validation partitions
cv_split <- vfold_cv(training_data, v = 5)

cv_data <- cv_split %>% 
  mutate(
    # Extract the train dataframe for each split
    train = map(splits, ~training(.x)), 
    # Extract the validate dataframe for each split
    validate = map(splits, ~testing(.x))
  )

cv_models_lm <- cv_data %>% 
  mutate(model = map(train, ~lm(formula = life_expectancy~., data = .x)))

cv_prep_lm <- cv_models_lm %>% 
  mutate(
    # Extract the recorded life expectancy for the records in the validate dataframes
    validate_actual = map(validate, ~.x$life_expectancy),
    # Predict life expectancy for each validate set using its corresponding model
    validate_predicted = map2(.x = model, .y = validate, ~predict(.x, .y))
  )

# Calculate the mean absolute error for each validate fold       
library(ModelMetrics)
cv_eval_lm <- cv_prep_lm %>% 
  mutate(validate_mae = map2_dbl(validate_actual, validate_predicted, ~mae(actual = .x, predicted = .y)))

# Print the validate_mae column
cv_eval_lm$validate_mae

# Calculate the mean of validate_mae column
mean(cv_eval_lm$validate_mae)

library(ranger)

# Build a random forest model for each fold
cv_models_rf <- cv_data %>% 
  mutate(model = map(train, ~ranger(formula = life_expectancy~., data = .x,
                                    num.trees = 100, seed = 42)))

# Generate predictions using the random forest model
cv_prep_rf <- cv_models_rf %>% 
  mutate(validate_predicted = map2(.x = model , .y = validate, ~predict(.x, .y)$predictions),
         validate_actual = map(validate, ~.x$life_expectancy))

# Calculate validate MAE for each fold
cv_eval_rf <- cv_prep_rf %>% 
  mutate(validate_mae = map2_dbl(validate_actual, validate_predicted, ~mae(actual = .x, predicted = .y)))

# Print the validate_mae column
cv_eval_rf$validate_mae
# Calculate the mean of validate_mae column
mean(cv_eval_rf$validate_mae)


# Prepare for tuning your cross validation folds by varying mtry
cv_tune <- cv_data %>% 
  crossing(mtry = 2:5) 

# Build a model for each fold & mtry combination
cv_model_tunerf <- cv_tune %>% 
  mutate(model = map2(.x = train, .y = mtry, ~ranger(formula = life_expectancy~., 
                                                     data = .x, mtry = .y, 
                                                     num.trees = 100, seed = 42)))

# Generate validate predictions for each model
cv_prep_tunerf <- cv_model_tunerf %>% 
  mutate(validate_predicted = map2(.x = model, .y = validate, ~predict(.x, .y)$predictions),
         validate_actual = map(validate, ~.x$life_expectancy))

# Calculate validate MAE for each fold and mtry combination
cv_eval_tunerf <- cv_prep_tunerf %>% 
  mutate(validate_mae = map2_dbl(.x = validate_actual, .y = validate_predicted, ~mae(actual = .x, predicted = .y)))

# Calculate the mean validate_mae for each mtry used  
cv_eval_tunerf %>% 
  group_by(mtry) %>% 
  summarise(mean_mae = mean(validate_mae))

# best model has the lowest MAE:   mtry of 2 for 0.934



# Build the model using all training data and the best performing parameter
best_model <- ranger(formula = life_expectancy~., data = training_data,
                     mtry = 2, num.trees = 100, seed = 42)

# Prepare the test_actual vector
test_actual <- testing_data$life_expectancy

# Predict life_expectancy for the testing_data
test_predicted <- predict(best_model, testing_data)$predictions

# Calculate the test MAE
mae(test_actual, test_predicted)

###################################################


# Binary classification models
# very common models   -  to use logistic regression
# 

# will now use the attrition dataset

# Prepare the initial split object
data_split <- initial_split(attrition, prop = .75)

# Extract the training dataframe
training_data <- training(data_split)

# Extract the testing dataframe
testing_data <- testing(data_split)

cv_split <- vfold_cv(training_data, v = 5)

cv_data <- cv_split %>% 
  mutate(
    # Extract the train dataframe for each split
    train = map(splits, ~training(.x)),
    # Extract the validate dataframe for each split
    validate = map(splits, ~testing(.x))
  )

# Build a model using the train data for each fold of the cross validation
cv_models_lr <- cv_data %>% 
  mutate(model = map(train, ~glm(formula = Attrition~., 
                                 data = .x, family = "binomial")))

####################
# Extract the first model and validate 
model <- cv_models_lr$model[[1]]
validate <- cv_models_lr$validate[[1]]

# Prepare binary vector of actual Attrition values in validate
validate_actual <- validate$Attrition == "Yes"

# Predict the probabilities for the observations in validate
validate_prob <- predict(model, validate, type = "response")

# Prepare binary vector of predicted Attrition values for validate
validate_predicted <- validate_prob > 0.5

# Compare the actual & predicted performance visually using a table
table(validate_actual, validate_predicted)

# Calculate the accuracy    
1-ce(validate_actual, validate_predicted)

# Calculate the precision
precision(validate_actual, validate_predicted)

# Calculate the recall
recall(validate_actual, validate_predicted)

##############################
# Prepare for cross-validated performance

cv_prep_lr <- cv_models_lr %>% 
  mutate(
    # Prepare binary vector of actual Attrition values in validate
    validate_actual = map(validate, ~.x$Attrition == "Yes"),
    # Prepare binary vector of predicted Attrition values for validate
    validate_predicted = map2(.x = model, .y = validate, ~predict(.x, .y, type = "response") > 0.5)
  )

# Calculate the validate recall for each cross validation fold
cv_perf_recall <- cv_prep_lr %>% 
  mutate(validate_recall = map2_dbl(validate_actual, validate_predicted, 
                                    ~recall(actual = .x, predicted = .y)))

# Print the validate_recall column
cv_perf_recall$validate_recall

# Calculate the average of the validate_recall column
mean(cv_perf_recall$validate_recall)

##########################################
#Using a random forest for classification

library(ranger)

# Prepare for tuning your cross validation folds by varying mtry
cv_tune <- cv_data %>%
  crossing(mtry = 2:16) 

# Build a cross validation model for each fold & mtry combination
cv_models_rf <- cv_tune %>% 
  mutate(model = map2(train, mtry, ~ranger(formula = Attrition~., 
                                           data = .x, mtry = .y,
                                           num.trees = 100, seed = 42)))

cv_prep_rf <- cv_models_rf %>% 
  mutate(
    # Prepare binary vector of actual Attrition values in validate
    validate_actual = map(validate, ~.x$Attrition == "Yes"),
    # Prepare binary vector of predicted Attrition values for validate
    validate_predicted = map2(.x = model, .y = validate, ~predict(.x, .y, type = "response")$predictions == "Yes")
  )

# Calculate the validate recall for each cross validation fold
cv_perf_recall <- cv_prep_rf %>% 
  mutate(recall = map2_dbl(.x = validate_actual, .y = validate_predicted, ~recall(actual = .x, predicted = .y)))

# Calculate the mean recall for each mtry used  
cv_perf_recall %>% 
  group_by(mtry) %>% 
  summarise(mean_recall = mean(recall))

#none of the random forest models here outperforms the recall of the logistic regression models

# build out the final production model

# Build the logistic regression model using all training data
best_model <- glm(formula = Attrition~., 
                  data = training_data, family = "binomial")


# Prepare binary vector of actual Attrition values for testing_data
test_actual <- testing_data$Attrition == "Yes"

# Prepare binary vector of predicted Attrition values for testing_data
test_predicted <- predict(best_model, testing_data, type = "response") > 0.5

# Compare the actual & predicted performance visually using a table
table(test_actual, test_predicted)

# Calculate the test accuracy
-1-ce(test_actual, test_predicted)

# Calculate the test precision
precision(test_actual, test_predicted)

# Calculate the test recall
recall(test_actual, test_predicted)



