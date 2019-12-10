# caret package
library(caret)

# datacamp with Max Kuhn, Zach Mayer

bootstrap validation -or- full cross validation

set.seed(42)


# example of a linear model     
model<-train(
    mpg ~ hp, mtcars,
    method = "lm",
    trControl = trainControl(
         method = "cv",
         number = 10,
         verboseIter = TRUE
    )
)

# Fit lm model using 5-fold CV: model
model <- train(
  medv~., 
  Boston,
  method = "lm",
  trControl = trainControl(
    method = "cv", 
    number = 5,
    verboseIter = TRUE
  )
)

# Print model to console
model


# Fit lm model using 5 x 5-fold CV: model
model <- train(
  medv ~ ., 
  Boston,
  method = "lm",
  trControl = trainControl(
    method = "repeatedcv", 
    number = 5,
    repeats = 5, 
    verboseIter = TRUE
  )
)

# Print model to console
model

# If p exceeds threshold of 0.5, M else R: m_or_r
m_or_r<-ifelse(p>0.5,"M","R")

# Convert to factor: p_class
p_class<-as.factor(m_or_r)
test[["Class"]]
# Create confusion matrix
confusionMatrix(p_class, test[["Class"]])




########################################
library(caTools)
# Predict on test: p
p<-predict(model, test, type = "response")


colAUC(p, test[["Class"]], plotROC = TRUE)

# use AUC to rank different models on the same data set

########################

# Create trainControl object: myControl
myControl <- trainControl(
  method = "cv",
  number = 10,
  summaryFunction = twoClassSummary,
  classProbs = TRUE, # IMPORTANT!   must have to calculate AUC or logloss
  verboseIter = TRUE
)

# Train glm with custom trainControl: model
model<-train(
  Class~., 
  Sonar,
  method = "glm",
  trControl = myControl)


# Print model to console
model

#############################
#Randon forests and wine

library(mlbench)
data(Sonar)

set.seed(42)

model<- train(
  Class ~ .,
  data = Sonar,
  method = "ranger")

plot(model)     ## to see the effect of hyperparameter combinations


#########################################
#
#     Wine is a cool dataset, runs clean

# 

url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv'
wine <- read.csv2(url, header = TRUE)
head(wine)


# Fit random forest: model
model <- train(
  quality~.,
  tuneLength = 1,
  data = wine, 
  method = "ranger",
  trControl = trainControl(
    method = "cv", 
    number = 5, 
    verboseIter = TRUE
  )
)

# Print model to console
model

#       tuning for mtry in the random forest

model<-train(
  Class ~ .,
  data = Sonar,
  method = "ranger",
  tuneLength = 10
)

model



# Fit random forest: model
model <- train(
  quality~.,
  tuneLength = 3,
  data = wine, 
  method = "ranger",
  trControl = trainControl(
    method = "cv", 
    number = 5, 
    verboseIter = TRUE
  )
)

# Print model to console
model

# Plot model
plot(model)


#### Fit a random forest with custom tuning

# Define the tuning grid: tuneGrid
tuneGrid <- data.frame(
  .mtry = c(2,3,7),
  .splitrule = "variance",
  .min.node.size = 5
)

# Fit random forest: model
model <- train(
  quality~.,
  tuneGrid = tuneGrid,
  data = wine, 
  method = "ranger",
  trControl = trainControl(
    method = "cv", 
    number = 5, 
    verboseIter = TRUE
  )
)


#####      extension of glm function to glmnet

#           lasso regression  or     ridge regression
#           seeks a parsimonious model
           
#  alpha[ ]  pure ridge to pure lasso
#   lambda (0, infinity)   size of the penalty
   
   
           
   # Create custom trainControl: myControl
   myControl <- trainControl(
     method = "cv", 
     number = 10,
     summaryFunction = twoClassSummary,
     classProbs = TRUE, # IMPORTANT!
     verboseIter = TRUE
   )
   
   # Fit glmnet model: model
   model <- train(
     y~., 
     overfit,
     method = "glmnet",
     trControl = myControl
   )
   
   # Print model to console
   model
   
   # Print maximum ROC statistic
   max(model[["results"]]$ROC)


   
  ########################################
  ########################################
   
   data(overfit)
   
   # Train glmnet with custom trainControl and tuning: model
   model <- train(
     y~., 
     overfit,
     tuneGrid = expand.grid(
       alpha=0:1,
       lambda = seq(0.0001,1,length = 20)
     ),
     method = "glmnet",
     trControl = myControl
   )
   
   # Print model to console
   model
   
   # Print maximum ROC statistic
   max(model[["results"]][["ROC"]])

##############################################
#############################################
###
###  Handling missing data
###
   
model<- train(X, Y, preProcess = "medianImpute")
print(model)

data()  Wisconsin Breast Cancer Dataset

# Apply median imputation: median_model
median_model <- train(
  x = breast_cancer_x, 
  y = breast_cancer_y,
  method = "glm",
  trControl = myControl,
  preProcess = "medianImpute"
)
# Print median_model to console
median_model


#################
###
###   what if the missing is not at random (if median will not be best imputation)
###
###            kNN imputation is available, but slower

# Apply KNN imputation: knn_model
knn_model <- train(
  x = breast_cancer_x, 
  y = breast_cancer_y,
  method = "glm",
  trControl = myControl,
  preProcess = "knnImpute"
)

# Print knn_model to console
knn_model

#####################################


# Update model with standardization
model <- train(
  x = breast_cancer_x, 
  y = breast_cancer_y,
  method = "glm",
  trControl = myControl,
  preProcess = c("medianImpute", "center", "scale")
)

# Print updated model
model

# Preprocessing cheat sheet:  1) start with median imputation
# 2) consider knn imputation if data missing is not at random
# 3) for linear models, center and scale
# 4) try PCA and spatial sign
# example preProcess = c("zv", "center", "scale", "pca") 

###################################
###
###  removing constant columns, or nearly constant columns
###
###

# Identify near zero variance predictors: remove_cols
remove_cols <- nearZeroVar(bloodbrain_x, names = TRUE, 
                           freqCut = 2, uniqueCut = 20)

# Get all column names from bloodbrain_x: all_cols
all_cols<-names(bloodbrain_x)

# Remove from data: bloodbrain_x_small
bloodbrain_x_small <- bloodbrain_x[ , setdiff(all_cols, remove_cols)]

# OR  --- use train with preProcess and "nzv" in the character string

# Fit model on reduced data: model
model <- train(
  x = bloodbrain_x_small, 
  y = bloodbrain_y, 
  method = "glm"
)

# Print model to console
model 

#######################
###
### Principal components analysis as a pre-processing step
###
###

# basic model

set.seed(42)

data(BloodBrain)

model <- train(
  bbbDescr,
  logBBB,
  method = "glm",
  trControl = trainControl(
    method = "cv", number = 10, verbose = TRUE,
  ),
  preProcess = c("zv", "center", "scale", "pca")
)

min(model$results$RMSE)


#########################
###
### reusing traincontrol for apples to apples comparison
###
###   pre-define trainControl
library(caret)
library(C50)
data(churn)

table(churnTrain$churn) / nrow(churnTrain)

# create train/test indexes 

set.seed(42)
myFolds<- createFolds(churnTrain$churn, k=5)

#compare class distribution

i<- myFolds$Fold2
table(churnTrain$churn[i])/ length(i)

# use the folds to create a trainControl object, to fit many models

myControl <- trainControl(
     summaryFunction = twoClassSummary,
     classProbs = TRUE,
     verboseIter = TRUE,
     savePredictions = TRUE,
     index = myFolds
)

# recall the glmnet --- almost always the first model to try on new datasets
# fits quickly, provides linear regression components
# ignores noisy coefficients

model_glmnet <- train(
  churn ~ .,
  churnTrain,
  metric = "ROC",
  method = "glmnet",
  tuneGrid = expand.grid(
    alpha = 0:1,
    lambda = 0:10 / 10
  ),
  trControl = myControl
)

plot(model_glmnet)

# then try random forest (good practice to try as second)
# easier to tun, but slower
#

model_rf<- train(
  churn ~ .,
  churnTrain,
  metric = "ROC",
  method = "ranger",
  trControl = myControl
)

plot(model_rf)

# often comparing models, target highest average AUC and lowest 
# resamples() function is your friend

model_list<- list(
  glmnet = model_glmnet,
  rf = model_rf 
)

resamps <- resamples(model_list)
resamps

summary(resamps)

densityplot(resamps, metric = "ROC")

bwplot(resamps, metric = "ROC")

xyplot(resamps, metric = "ROC")


#############################
###
###   for custom ensembles

# Create ensemble model: stack
stack <- caretStack(model_list, method = "glm")

# Look at summary
summary(stack)


