# Tree based models in R
# Erin LeDell and Gabriela de Queiroz

# Decision Trees + Random Forests + GBoostedMs

# Model interpretability, ease of use, and excellent accuracy

# Recursive partitioning

library(rpart)
library(rpart.plot)
library(caret)

####   this data set factor levels gives problems at cross validation, line 306


url="http://freakonometrics.free.fr/german_credit.csv"
credit=read.csv(url, header = TRUE, sep = ",")

F=c(1,2,4,5,7,8,9,10,11,12,13,15,16,17,18,19,20)
for(i in F) credit[,i]=as.factor(credit[,i])

library(janitor)
credit<-clean_names(credit)

# Look at the data
str(credit)

# Create the model
credit_model <- rpart(formula = creditability ~ ., 
                      data = credit, 
                      method = "class")

# Display the results
rpart.plot(x = credit_model, yesno = 2, type = 0, extra = 0)

#####################################
###
###     Advantages:  Easy to understand, interpret
###     no normalization required
###          handles categorical variables
###          handle missing data elegantly (mostly)
###           little or no data preparation
###           decision boundaries are more comples than linear

# Total number of rows in the credit data frame
n <- nrow(credit)

# Number of rows for the training set (80% of the dataset)
n_train <- round(0.8 * n) 

# Create a vector of indices which is an 80% random sample
set.seed(123)
train_indices <- sample(1:n, n_train)

# Subset the credit data frame to training indices only
credit_train <- credit[train_indices, ]  

# Exclude the training indices to create the test set
credit_test <- credit[-train_indices, ]  

# Train the model (to predict 'default')
credit_model <- rpart(formula = creditability ~., 
                      data = credit_train, 
                      method = "class")

rpart.plot(x = credit_model, yesno = 2, type = 0, extra = 0)

# Evaluating performance
#
#   when type = class, you get the class labels.  "prob" is the alternative
classPrediction<-predict(credit_model, credit_test, type = "class")

caret::confusionMatrix(data = classPrediction, reference = credit_test$creditability )

##########################

# splitting criterion in trees
#
#   Gini Index is the measure in impurity of the split node
#     the lower the gini index, the higher purity of the split
#         the alternative is entropy
#


# Train a gini-based model
credit_model1 <- rpart(formula = creditability ~ ., 
                       data = credit_train, 
                       method = "class",
                       parms = list(split = "gini"))

# Train an information-based model
credit_model2 <- rpart(formula = creditability ~ ., 
                       data = credit_train, 
                       method = "class",
                       parms = list(split = "information"))

# Generate predictions on the validation set using the gini model
pred1 <- predict(object = credit_model1, 
                 newdata = credit_test,
                 type = "class")    

# Generate predictions on the validation set using the information model
pred2 <- predict(object = credit_model2, 
                 newdata = credit_test,
                 type = "class")

# Compare classification error
library(ModelMetrics)
ce(actual = credit_test$creditability, 
   predicted = pred1)
ce(actual = credit_test$creditability, 
   predicted = pred2)  

######################################
####
###
###       Introduction to regression Trees
###
###       Homogeneaity is measured here by variance or etc
###         method = "class" for classification, and "anova" for regression
###           control are optional parameters for controlling tree growth

https://archive.ics.uci.edu/ml/datasets/Student+Performance

d1=read.table("./content/courses/MachineLearning/student-mat.csv",sep=";",header=TRUE)
d2=read.table("./content/courses/MachineLearning/student-por.csv",sep=";",header=TRUE)
grade=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

# Look at the data
str(grade)

# Set seed and create assignment
set.seed(42)
assignment <- sample(1:3, size = nrow(grade), prob = c(0.7,.15,.15), replace = TRUE)

# Create a train, validation and tests from the original data frame 
grade_train <- grade[assignment == 1, ]    # subset grade to training indices only
grade_valid <- grade[assignment == 2, ]  # subset grade to validation indices only
grade_test <- grade[assignment == 3, ]   # subset grade to test indices only

# Train the model
grade_model <- rpart(formula = G3.y ~ .-G2.y -G1.y , 
                     data = grade_train, 
                     method = "anova")

# Look at the model output                      
print(grade_model)

# Plot the tree model
rpart.plot(x = grade_model, yesno = 2, type = 0, extra = 0)

###############################
###
###
###  in regression problems, accuracy will have to be states as MAE or RMSE
###
###

# Generate predictions on a test set
pred <- predict(object = grade_model,   # model object 
                newdata = grade_test)  # test dataset

# Compute the RMSE
rmse(actual = grade_test$G3.y, 
     predicted = pred)

#########################
###
###  What are the hyperparameters of a decision tree?
###
###        rpart.control - minsplit: minimum points in node
###                       cp complexity parameter penalty - see plotcp()
###                       maxdepth - depth of a decision tree
###
###                when the preferred cp is known, set prune(tree =, cp =)

# Plot the "CP Table"
plotcp(grade_model)

# Print the "CP Table"
print(grade_model$cptable)

# Retrieve optimal cp value based on cross-validated error
opt_index <- which.min(grade_model$cptable[, "xerror"])
cp_opt <- grade_model$cptable[opt_index, "CP"]

# Prune the model (to optimized cp value)
grade_model_opt <- prune(tree = grade_model, 
                         cp = cp_opt)

# Plot the optimized model
rpart.plot(x = grade_model_opt, yesno = 2, type = 0, extra = 0)

##############################
######
###        Grid search is possible
###
###        choose a performance metric:   AUC, RMSE, ETC
###        may use CV
###

splits<- seq(1, 30, 5)
depths<- seq(5, 30, 5)

hyper_grid<- expand.grid(
   minsplit = splits,
   maxdepth = depths
)

# for teaching purposes, we will implement the search externally
###

models<- list()

for  (i in 1:nrow(hyper_grid)) {
  minsplit <- hyper_grid$minsplit[i]
  maxdepth <- hyper_grid$maxdepth[i]
  
  models[[i]]<- rpart(formula = G3.y ~ .,
                      data = grade_train,
                      method = "anova",
                      minsplit = minsplit,
                      maxdepth = maxdepth)
}


# Number of potential models in the grid
num_models <- length(models)

# Create an empty vector to store RMSE values
rmse_values <- c()

# Write a loop over the models to compute validation RMSE
for (i in 1:num_models) {
  
  # Retrieve the i^th model from the list
  model <- models[[i]]
  
  # Generate predictions on grade_valid 
  pred <- predict(object = model,
                  newdata = grade_valid)
  
  # Compute validation RMSE and add to the 
  rmse_values[i] <- rmse(actual = grade_valid$G3.y, 
                         predicted = pred)
}

# Identify the model with smallest validation set RMSE
best_model <- models[[which.min(rmse_values)]]

# Print the model paramters of the best model
best_model$control

# Compute test set RMSE on best_model
pred <- predict(object = best_model,
                newdata = grade_test)
rmse(actual = grade_test$G3.y, 
     predicted = pred)



#################################
####
###
###       Bagged trees       -- bootstrapping aggregating
###  
###         averages many trees to reduce variance
###
###

library(ipred)

# Bagging is a randomized model, so let's set a seed (123) for reproducibility
set.seed(123)

# Train a bagged model
credit_model <- bagging(formula = creditability ~ ., 
                        data = credit_train,
                        coob = TRUE)

# Print the model
print(credit_model)

class_predictions<- predict( object = credit_model,
                             newdata = credit_test,
                             type = "class")

caret::confusionMatrix(class_predictions, credit_test$creditability)

auc(credit_test$creditability, class_predictions)

#################################
###
###            using caret for k fold cross validation
###
###
###         for small datasets (slows down the process)
###

ctrl<-trainControl(method = "cv",
                   number = 5,
                   classProbs = TRUE,
                   summaryFunction = twoClassSummary)  # Calcs ROC curve

caret_credit_model<- train(creditability ~ .,
                     data = credit_train,
                     method = "treebag",
                     metric = "ROC",
                     trControl = ctrl)

str(credit)

# Generate predictions on the test set
pred <- predict(object = credit_caret_model, 
                newdata = credit_test,
                type = "prob")

# Compute the AUC (`actual` must be a binary (or 1/0 numeric) vector)
auc(actual = ifelse(credit_test$creditability == "yes", 1, 0), 
    predicted = pred[,"yes"])

#############################
###
###
###     Introduction to Random Forest, an improvement on bagged trees
###
###
###     easy to use, out of the box
###
###

library(randomForest)
# Train a Random Forest
set.seed(1)  # for reproducibility
rf_credit_model <- randomForest(formula = creditability ~ ., 
                             data = credit_train)

# Print the model output                             
print(rf_credit_model)

err<- rf_credit_model$err.rate

head(err)

plot(rf_credit_model)

legend(x = "right", 
       legend = colnames(err),
       fill = 1:ncol(err))

# Generate predicted classes using the model object
class_prediction <- predict(object = rf_credit_model,   # model object 
                            newdata = credit_test,  # test dataset
                            type = "class") # return classification labels

# Calculate the confusion matrix for the test set
cm <- caret::confusionMatrix(data = class_prediction,       # predicted classes
                      reference = credit_test$creditability)  # actual classes
print(cm)

# Compare test set accuracy to OOB accuracy
paste0("Test Accuracy: ", cm$overall[1])
paste0("OOB Accuracy: ", 1 - oob_err)      ### caret does not give oob_err

#####################
###
###   out of bag error compared to test set error
###      one of the nicest thing is that there is a build in test set (OOB)
###      OOB is already built in to randomForest
###
###         disadvantages ---    no AUC on OOB, cant compare to another type of model easily
###      

# Generate predictions on the test set
pred <- predict(object = credit_model,
                newdata = credit_test,
                type = "prob")

# `pred` is a matrix
class(pred)

# Look at the pred format
head(pred)

# Compute the AUC (`actual` must be a binary 1/0 numeric vector)
auc(actual = ifelse(credit_test$default == "yes", 1, 0), 
    predicted = pred[,"yes"])   

##########################
###
###
###   Tuning a random forest model
###
###   hyperparameters --- ntree = 500,      mtry = number of variables at each split,   sampsize
###   nodesize,   maxnodes
###
###        tuning mtry with tuneRF()   

res <- tuneRF( x = subset(credit_train, select = -creditability),
               y = credit_train$creditability,
               ntreeTry = 500)

# Look at results
print(res)

# Find the mtry value that minimizes OOB Error
mtry_opt <- res[,"mtry"][which.min(res[,"OOBError"])]
print(mtry_opt)

# If you just want to return the best RF model (rather than results)
# you can set `doBest = TRUE` in `tuneRF()` to return the best RF model
# instead of a set performance matrix.

##################################
###
###      randomForest with grid search

# Establish a list of possible values for mtry, nodesize and sampsize
mtry <- seq(4, ncol(credit_train) * 0.8, 2)
nodesize <- seq(3, 8, 2)
sampsize <- nrow(credit_train) * c(0.7, 0.8)

# Create a data frame containing all combinations 
hyper_grid <- expand.grid(mtry = mtry, nodesize = nodesize, sampsize = sampsize)

# Create an empty vector to store OOB error values
oob_err <- c()

# Write a loop over the rows of hyper_grid to train the grid of models
for (i in 1:nrow(hyper_grid)) {
  
  # Train a Random Forest model
  model <- randomForest(formula = creditability ~ ., 
                        data = credit_train,
                        mtry = hyper_grid$mtry[i],
                        nodesize = hyper_grid$nodesize[i],
                        sampsize = hyper_grid$sampsize[i])
  
  # Store OOB error for the model                      
  oob_err[i] <- model$err.rate[nrow(model$err.rate), "OOB"]
}

# Identify optimal set of hyperparmeters based on OOB error
opt_i <- which.min(oob_err)
print(hyper_grid[opt_i,])



#################################
#####################
###
###      Gradient Boosting Machine GBM
###
###        Adaboost and GBM
###
###             

library(gbm)

gbm_credit_model <- gbm(formula = creditability ~.,
                 distribution = "bernoulli",      # for binary classification problem
                 data = credit_train,
                 n.trees = 5000)

# Print the model object                    
print(gbm_credit_model)

# summary() prints variable importance
summary(gbm_credit_model)

# Since we converted the training response col, let's also convert the test response col
credit_test$default <- ifelse(credit_test$default == "yes", 1, 0)

# Generate predictions on the test set
preds1 <- predict(object = gbm_credit_model, 
                  newdata = credit_test,
                  n.trees = 10000)

# Generate predictions on the test set (scale to response)
preds2 <- predict(object = gbm_credit_model, 
                  newdata = credit_test,
                  n.trees = 10000,
                  type = "response")

# Compare the range of the two sets of predictions
range(preds1)
range(preds2)

#########################
###
###
###   hyperparameter tunign of a gbm model
###
###    especially important, must plan early stopping
###
###

### gbm hyperparameters are n.trees, bag.fraction, 
###        n.minobsinnode ,   interaction.depth, 
###        shrinkage (learning rate)
###
###      best to take many small steps with this algorithm
###
###
###        OOBS or cross validation can be used to make stop

# Optimal ntree estimate based on OOB
ntree_opt_oob <- gbm.perf(object = gbm_credit_model, 
                          method = "OOB", 
                          oobag.curve = TRUE)

# Train a CV GBM model
set.seed(1)
credit_model_cv <- gbm(formula = creditability ~ ., 
                       distribution = "bernoulli", 
                       data = credit_train,
                       n.trees = 10000,
                       cv.folds = 2)

# Optimal ntree estimate based on CV
ntree_opt_cv <- gbm.perf(object = credit_model_cv, 
                         method = "cv")

# Compare the estimates                         
print(paste0("Optimal n.trees (OOB Estimate): ", ntree_opt_oob))                         
print(paste0("Optimal n.trees (CV Estimate): ", ntree_opt_cv))





# Generate predictions on the test set using ntree_opt_oob number of trees
preds1 <- predict(object = credit_model, 
                  newdata = credit_test$default,
                  n.trees = ntree_opt_oob)

# Generate predictions on the test set using ntree_opt_cv number of trees
preds2 <- predict(object = credit_model, 
                  newdata = credit_test$default,
                  n.trees = ntree_opt_cv)   

# Generate the test set AUCs using the two sets of preditions & compare
auc1 <- auc(actual = credit_test$default, predicted = preds1)  #OOB
auc2 <- auc(actual = credit_test$default, predicted = preds2)  #CV 

# Compare AUC 
print(paste0("Test set AUC (OOB): ", auc1))                         
print(paste0("Test set AUC (CV): ", auc2))

########################################
########################################
###
###  Model comparisons
###
###   AUC as a measure for binary classifiers
###
###      visualalize ROC curves

# Generate the test set AUCs using the two sets of predictions & compare
actual <- credit_test$default
dt_auc <- auc(actual = actual, predicted = dt_preds)
bag_auc <- auc(actual = actual, predicted = bag_preds)
rf_auc <- auc(actual = actual, predicted = rf_preds)
gbm_auc <- auc(actual = actual, predicted = gbm_preds)

# Print results
sprintf("Decision Tree Test AUC: %.3f", dt_auc)
sprintf("Bagged Trees Test AUC: %.3f", bag_auc)
sprintf("Random Forest Test AUC: %.3f", rf_auc)
sprintf("GBM Test AUC: %.3f", gbm_auc)

# List of predictions
preds_list <- list(dt_preds, bag_preds, rf_preds, gbm_preds)

# List of actual values (same for all)
m <- length(preds_list)
actuals_list <- rep(list(credit_test$default), m)

# Plot the ROC curves
pred <- prediction(preds_list, actuals_list)
rocs <- performance(pred, "tpr", "fpr")
plot(rocs, col = as.list(1:m), main = "Test Set ROC Curves")
legend(x = "bottomright", 
       legend = c("Decision Tree", "Bagged Trees", "Random Forest", "GBM"),
       fill = 1:m)




