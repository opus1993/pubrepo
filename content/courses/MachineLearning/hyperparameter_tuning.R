# Hyperparameter Tuning
# Dr. Shirin Glander
#
#
# we will work with the breast cancer data set

library(caret)
library(tictoc)

# Create partition index
index <- createDataPartition(breast_cancer_data$diagnosis, p = 0.7, list = FALSE)

# Subset `breast_cancer_data` with index
bc_train_data <- breast_cancer_data[index, ]
bc_test_data  <- breast_cancer_data[-index, ]

# Define 3x5 folds repeated cross-validation
fitControl <- trainControl(method = "repeatedcv", number = 5, repeats = 3)

tic()
# Run the train() function
gbm_model <- train(diagnosis ~ ., 
                   data = bc_train_data, 
                   method = "gbm", 
                   trControl = fitControl,
                   verbose = FALSE)
toc()

# Look at the model
gbm_model

##############
#############
#############

modelLookup("gbm")

# Define hyperparameter grid.
hyperparams <- expand.grid(n.trees = 200, 
                           interaction.depth = 1, 
                           shrinkage = 0.1, 
                           n.minobsinnode = 10)

# Apply hyperparameter grid to train().
set.seed(42)
gbm_model <- train(diagnosis ~ ., 
                   data = bc_train_data, 
                   method = "gbm", 
                   trControl = trainControl(method = "repeatedcv", number = 5, repeats = 3),
                   verbose = FALSE,
                   tuneGrid = hyperparams)


###
###

# US 2016 presidential election data
#
# Plot default
plot(svm_model_voters_grid)

# Plot Kappa level-plot
caret::plot.train(svm_model_voters_grid, metric = "Kappa", plotType = "level")

ggplot(svm_model_voters_grid)

###
###

# Define the grid with hyperparameter ranges
big_grid <- expand.grid(size = seq(from = 1, to = 5, by = 1), decay = c(0, 1))

# Train control with grid search
fitControl <- trainControl(method = "repeatedcv", number = 3, repeats = 5, search = "grid")

# Train neural net
tic()
set.seed(42)
nn_model_voters_big_grid <- train(turnout16_2016 ~ ., 
                                  data = voters_train_data, 
                                  method = "nnet", 
                                  trControl = fitControl,
                                  verbose = FALSE,
                                  tuneGrid = big_grid)
toc()

###
###

# Adaptive re-sampling   --- a much more efficient search for hyperparameters

#trainControl:method = "adaptive_cv" + search = "random" + adaptive
#       min = 5 (default)
#       alpha =    confidence level for removing hyperparameters
#       method =   "gls" or "BT"
#       complete = TRUE   generates full resampling set

fitControl <- trainControl(method = "adaptive_cv",
                           adaptive = list(min = 2,
                                           alpha = 0.05,
                                           method = "gls",
                                           complete = TRUE),
                           search = "random")

gbm_model_voters_adaptive <- train(turnout16_2016 ~ .,
                                   data = voters_train_data,
                                   metho = "gbm",
                                   trControl = fitControl,
                                   verbose = FALSE,
                                   tuneLength = 7)  # real world ~100


# Define trainControl function
fitControl <- trainControl(method = "adaptive_cv",
                           number = 3, repeats = 3,
                           adaptive = list(min = 3, alpha = 0.05, method = "BT", complete = FALSE),
                           search = "random")

# Start timer & train model
tic()
svm_model_voters_ar <- train(turnout16_2016 ~ ., 
                             data = voters_train_data, 
                             method = "nnet", 
                             trControl = fitControl,
                             verbose = FALSE,
                             tuneLength = 6)
toc()

####
####
####

library(mlr3)
library(tidyverse)

# url<- "https://archive.ics.uci.edu/ml/machine-learning-databases/00257/Data_User_Modeling_Dataset_Hamdi%20Tolga%20KAHRAMAN.xls"

knowledge_data<- readxl::read_excel("./content/courses/MachineLearning/Data_User_Modeling_Dataset_Hamdi Tolga KAHRAMAN.xls", sheet = 2, range = "A1:F259")

knowledge_data %>%
  count(UNS)

# the mlr package has a number of tasks to define, including
#   RegrTask() for regression
#   ClassifTask() for binary and multi-class classification
#   MultilabelTask() fo rmulti-label classification problems
#   CostSensTask() for general cost sensitive classification

task <- mlr3::(id = "kd", backend = knowledge_data, target = "UNS")

listLearners()

# Create classification taks
task <- makeClassifTask(data = knowledge_train_data, 
                        target = "UNS")

# Call the list of learners
listLearners() %>%
  as.data.frame() %>%
  select(class, short.name, package) %>%
  filter(grepl("classif.", class))

# Create learner
lrn <- makeLearner("classif.randomForest", 
                   predict.type = "prob", 
                   fix.factors.prediction  = TRUE)

# hyperparameter tuning with mlr

getParamSet("classif.randomForest")

lrn_tune <- tuneParams(lrn, task, resampling = cross_val,
                       control = ctrl_grid,
                       par.set = param_set)

##########
##########
##########

# Get the parameter set for neural networks of the nnet package
getParamSet("classif.nnet")

# Define set of parameters
param_set <- makeParamSet(
  makeDiscreteParam("size", values = c(2,3,5)),
  makeNumericParam("decay", lower = 0.0001, upper = 0.1)
)

# Print parameter set
print(param_set)

# Define a random search tuning method.
ctrl_random <- makeTuneControlRandom()

###
###
###

# machine learning with h2o
#
#
library(h2o)
h2o.init()
# varieties of wheat
seeds_data<-read.table("./content/courses/MachineLearning/seeds_dataset.txt",col.names = c("area","perimeter","compactness","kernel_length",
                         "kernel_width","asymmetry","kernel_groove",
                         "seed_type"))

seeds_data %>%
   count(seed_type)

seeds_data_hf <- as.h2o(seeds_data)

y<- "seed_type"
x <- setdiff(colnames(seeds_data_hf),y)

# target should be a factor with h20
seeds_data_hf[,y] <- as.factor(seeds_data_hf[,y])

sframe <- h2o.splitFrame(data  = seeds_data_hf,
                         ratios = c(0.7,0.15),
                         seed = 42)

train <- sframe[[1]]
valid <- sframe[[2]]
test <- sframe[[3]]

summary(train$seed_type, exact_quantiles = TRUE)

gbm_model <- h2o.gbm(x = x, y = y,
                     training_frame = train, validation_frame = valid)

perf <- h2o.performance(rf_model, valid = TRUE)

perf <- h2o.performance(gbm_model, test)

h2o.confusionMatrix(perf)

h2o.predict(gbm_model, test)

####
####

# Train random forest model
rf_model <- h2o.randomForest(x = x,
                             y = y,
                             training_frame = train,
                             validation_frame = valid)

# Calculate model performance
perf <- h2o.performance(rf_model, valid = TRUE)

# Extract confusion matrix
h2o.confusionMatrix(perf)

# Extract logloss
h2o.logloss(perf)

###
###   hyperparameter tuning with h2o
###

gbm_params <- list(ntrees = c(100,150,200),
                   max_depth = c(3,5,7),
                   learn_rate = c(0.001, 0.01, 0.1))

gbm_grid <- h2o.grid("gbm",
                     grid_id = "gbm_grid",
                     x=x,y=y,
                     training_frame = train,
                     validation_frame = valid,
                     seed = 42,
                     hyper_params = gbm_params)

gbm_gridperf<- h2o.getGrid(grid_id = "gbm_grid",
                           sort_by = "accuracy",
                           decreasing = TRUE)

best_gbm <- h2o.getModel(gbm_gridperf@model_ids[[1]])

print(best_gbm@model[["model_summary"]])

h2o.performance(best_gbm, test)

###
###        random hyperparameter search in h2o
###

gbm_params <- list(ntrees = c(100,150,200),
                   max_depth = c(3,5,7),
                   learn_rate = c(0.001, 0.01, 0.1))
 ### SAME AS ABOVE, now additionally with

search_criteria <- list(strategy = "RandomDiscrete",
                        max_runtime_secs = 60,
                        seed = 42)

gbm_grid <- h2o.grid("gbm",
                     grid_id = "gbm_grid",
                     x=x,y=y,
                     training_frame = train,
                     validation_frame = valid,
                     seed = 42,
                     hyper_params = gbm_params,
                     search_criteria = search_criteria)


### search criteria could also be build on "stopping" conditions, as follows

search_criteria <- list(strategy = "RandomDiscrete",
                        stopping_metric = "mean_per_class_error",
                        stopping_tolerance = 0.0001,
                        stopping_rounds = 6)

gbm_grid <- h2o.grid("gbm",
                     grid_id = "gbm_grid",
                     x=x,y=y,
                     training_frame = train,
                     validation_frame = valid,
                     seed = 42,
                     hyper_params = gbm_params,
                     search_criteria = search_criteria)

###
###           deeplearning test
###

?h2o.deeplearning

d1params <- list(hidden = list(c(50,50),c(100,100)),
                 epochs = c(5,10,15),
                 rate = c(0.001, 0.005, 0.01))

# Define search criteria
search_criteria <- list(strategy = "RandomDiscrete", 
                        max_runtime_secs = 10, # 10 is way too short & only used to keep runtime short!
                        seed = 42)

# Train with random search
dl_grid <- h2o.grid("deeplearning", 
                    grid_id = "dl_grid",
                    x = x, 
                    y = y,
                    training_frame = train,
                    validation_frame = valid,
                    seed = 42,
                    hyper_params = dl_params,
                    search_criteria = search_criteria)

###
###   another approach to tailoring the search criteria
###

stopping_params <- list(strategy = "RandomDiscrete",
                        stopping_metric = "misclassification",
                        stopping_rounds = 2,
                        stopping_tolerance = 0.1,
                        seed = 42)

###
###            AutoML
###                     must have stop criteria

automl_model <- h2o.automl(x=x, y=y,
                           training_frame = train,
                           nfolds = 6,
                           # validation_frame = valid, field is ignored, automl assumes 5 nfolds cv
                           max_runtime_secs = 60,      ### pick something much longer than 60 seconds
                           sort_metric = "logloss",
                           seed = 42)

lb<- automl_model@leaderboard

lb

model_ids <- as.data.frame(lb)$model_id

aml_leader <-automl_model@leader

summary(aml_leader)


###
###     
###

# Run automatic machine learning
automl_model <- h2o.automl(x = x, 
                           y = y,
                           training_frame = train,
                           max_runtime_secs = 10,
                           sort_metric = "mean_per_class_error",
                           nfolds = 3,
                           validation_frame = valid,
                           seed = 42)


h2o.performance(aml_leader, test)



