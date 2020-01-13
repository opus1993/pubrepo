## Support Vector Machines in R
## Kailash Awati
## DataCamp

library(e1071)

n<- 200
set.seed(42)

df<- data.frame(x1 = runif(n),
                x2 = runif(n))

#classify points as -1 or +1

df$y <- factor(ifelse(df$x1-df$x2>0, -1, 1),
               levels = c(-1,1))

df %>%
  ggplot(aes(x1, x2, color = y))+
  geom_point() +
  scale_color_manual(values = c("-1" = "red", "1" = "blue"))+
  geom_abline(slope = 1, intercept = 0)

# Introducing a margin
# one technique is to remove points that differ than less than a specified value

delta <- 0.05

df1<- df[abs(df$x1-df$x2)>delta,]
#check the number of data points remaining
nrow(df1)

df1%>%
  ggplot(aes(x1, x2, color = y))+
  geom_point() +
  scale_color_manual(values = c("-1" = "red", "1" = "blue"))+
  geom_abline(slope = 1, intercept = 0)+
  geom_abline(slope = 1, intercept = delta, linetype = "dashed")+
  geom_abline(slope = 1, intercept = -delta, linetype = "dashed")
  
# the simplest support vector classifier
#
#  sampling for 80/20 dividing the df dataframe ( no libraries needed)

#split train and test data in an 80/20 proportion
df[,"train"] <- ifelse(runif(nrow(df))<0.8,1,0)
#assign training rows to data frame trainset
trainset<- df[df$train==1,]
#assign test rows to data frame testset
testset<- df[df$train==0,]
#find index of "train" column
trainColNum <- grep("train", names(trainset))
#remove "train" column from train and test dataset
trainset <- trainset[,-trainColNum]
testset<- testset[,-trainColNum]

# the type of SVM decision boundary is called a kernel, and has to be specified upfront

svm_model<- svm(y ~ .,
                data = trainset, 
                type = "C-classification", 
                kernel = "linear", 
                scale = FALSE)

svm_model

# the indices of the support vectors in the training set
svm_model$index

# the support vector coordinates
svm_model$SV

# negative intercept
svm_model$rho

#weighting coefficients for support vectors
svm_model$coefs

# training accuracy
pred_train <- predict(svm_model, trainset)
mean(pred_train==trainset$y)

# test set accuracy
pred_test <- predict(svm_model, testset)
mean(pred_test==testset$y)

df_sv <- trainset[svm_model$index,]   # identify the support vectors


# to show the support vector decision boundary, build the weight vector w
# matrix multiplication is represented by %*%

w<- t(svm_model$coefs) %*% svm_model$SV

slope_1 <- -w[1]/w[2]
intercept_1 <- svm_model$rho/w[2]

trainset%>%
  ggplot(aes(x1, x2, color = y))+
  geom_point() +
  scale_color_manual(values = c("-1" = "red", "1" = "blue"))+
  geom_point(data = df_sv, aes(x = x1, y = x2),
             color = "purple",
             size = 4, alpha = 0.5)+
  geom_abline(slope = slope_1,
              intercept = intercept_1)+
  geom_abline(slope = slope_1,
              intercept = intercept_1-1/w[2],
              linetype = "dashed")+
  geom_abline(slope = slope_1,
              intercept = intercept_1+1/w[2],
              linetype = "dashed")

# Soft margin classifiers are useful. But in this case, we can reduce the margin

plot(x = svm_model, data = trainset)



#build scatter plot of training dataset
scatter_plot <- ggplot(data = trainset, aes(x = x1, y = x2, color = y)) + 
  geom_point() + 
  scale_color_manual(values = c("red", "blue"))

#add plot layer marking out the support vectors 
layered_plot <- 
  scatter_plot + geom_point(data = trainset[svm_model$index, ], aes(x = x1, y = x2), color = "purple", size = 4, alpha = 0.5)

#display plot
layered_plot


#build weight vector 
w <- t(svm_model$coefs) %*% svm_model$SV 


#calculate slope and intercept of decision boundary from weight vector and svm model
slope_1 <- -w[1]/w[2]
intercept_1 <- svm_model$rho/w[2]

#build scatter plot of training dataset
scatter_plot <- ggplot(data = trainset, aes(x = x1, y = x2, color = y)) + 
  geom_point() + scale_color_manual(values = c("red", "blue"))
#add decision boundary
plot_decision <- scatter_plot + geom_abline(slope = slope_1, intercept = intercept_1) 
#add margin boundaries
plot_margins <- plot_decision + 
  geom_abline(slope = slope_1, intercept = intercept_1 - 1/w[2], linetype = "dashed")+
  geom_abline(slope = slope_1, intercept = intercept_1 + 1/w[2], linetype = "dashed")
#display plot
plot_margins

##############
##############
##############
## New model

#load required library
library(e1071)

#build svm model
svm_model<- 
  svm(y ~ ., data = trainset, type = "C-classification", 
      kernel = "linear", scale = FALSE)

#plot decision boundaries and support vectors for the training data
plot(x = svm_model, data = trainset)

#  tuning an SVM by tweaking the cost parameter, and hard/soft model SVMs


#################
################
################

# with the iris dataset  at the UCI machine learning depository

library(ggplot2)
p<- ggplot(data = iris,
           aes(x = Petal.Width,
               y = Petal.Length,
               color = Species))+
  geom_point()

p

# the data is nearly linearly separable

# for data with more than 2 classes

# 1st partition the dataset into subsets that have 2 classes each

# solve the boundary classification problems separately

# use majority vote to assign a class to each data point

# called one-against-one classification strategy

# apply set.seed(10) and 80/20 training / testing split

svm_model <- svm(Species ~ .,
                 data = trainset,
                 type = "C-classification",
                 kernel = "linear")

# accuracy
pred_train <- predict(svm_model, trainset)
mean(pred_train == trainset$Species)

pred_test<- predict(svm_model, testset)
mean(pred_test==testset$Species)

# to get a robust measure, we should cross validate

for (i in 1:100){
  #assign 80% of the data to the training set
  iris[, "train"] <- ifelse(runif(nrow(iris)) < 0.8, 1, 0)
  trainColNum <- grep("train", names(iris))
  trainset <- iris[iris$train == 1, -trainColNum]
  testset <- iris[iris$train == 0, -trainColNum]
  #build model using training data
  svm_model <- svm(Species~ ., data = trainset, 
                   type = "C-classification", kernel = "linear")
  #calculate accuracy on test data
  pred_test <- predict(svm_model, testset)
  accuracy[i] <- mean(pred_test == testset$Species)
}
mean(accuracy) 
sd(accuracy)

######################
######################
##############
### Create a radially separated set
###
###
#set number of variables and seed
n <- 400
set.seed(1)

#Generate data frame with two uniformly distributed predictors, x1 and x2
df <- data.frame(x1 = runif(n, min = -1, max = 1), 
                 x2 = runif(n, min = -1, max = 1))

#We want a circular boundary. Set boundary radius 
radius <- 0.8
radius_squared <- radius^2

#create dependent categorical variable, y, with value -1 or 1 depending on whether point lies
#within or outside the circle.
df$y <- factor(ifelse(df$x1^2 + df$x2^2 < radius_squared, -1, 1), levels = c(-1, 1))

#load ggplot
library(ggplot2)

#build scatter plot, distinguish class by color
scatter_plot <- ggplot(data = df, aes(x = x1, y = x2, color = y)) + 
  geom_point() +
  scale_color_manual(values = c("red", "blue"))

#display plot
scatter_plot


### a demonstration of a bad linear model,  cost =1

#default cost mode;
svm_model_1 <- svm(y ~ ., data = trainset, type = "C-classification", cost = 1, kernel = "linear")

#training accuracy
pred_train <- predict(svm_model_1, trainset)
mean(pred_train == trainset$y)

#test accuracy
pred_test <- predict(svm_model_1, testset)
mean(pred_test == testset$y)


## second try,  with a higher cost factor,  still linear model, expect poor results

#cost = 100 model
svm_model_2 <- svm(y ~ ., data = trainset, type = "C-classification", cost = 100, kernel = "linear")

#accuracy
pred_train <- predict(svm_model_2, trainset)
mean(pred_train == trainset$y)
pred_test <- predict(svm_model_2, testset)
mean(pred_test == testset$y)


# work out an "average" accuracy for many linear models (still expected to be gbad)

# Create vector to store accuracies and set random number seed
accuracy <- rep(NA, 100)
set.seed(2)

# Calculate accuracies for 100 training/test partitions
for (i in 1:100){
  df[, "train"] <- ifelse(runif(nrow(df)) < 0.8, 1, 0)
  trainset <- df[df$train == 1, ]
  testset <- df[df$train == 0, ]
  trainColNum <- grep("train", names(trainset))
  trainset <- trainset[, -trainColNum]
  testset <- testset[, -trainColNum]
  svm_model <- svm(y ~ ., data = trainset, type = "C-classification", kernel = "linear")
  pred_test <- predict(svm_model, testset)
  accuracy[i] <- mean(pred_test == testset$y)
}

# Print average accuracy and standard deviation
mean(accuracy)
sd(accuracy)

################################
################################
################################
### The Kernel Trick
### ############

# Kernel functions are generalizations of vector dot products

# first, a visual of the data, if plotted as squared (polynomial)

#transform data
df1 <- data.frame(x1sq = df$x1^2, x2sq = df$x2^2, y = df$y)

#plot data points in the transformed space
plot_transformed <- ggplot(data = df1, aes(x = x1sq, y = x2sq, color = y)) + 
  geom_point()+ guides(color = FALSE) + 
  scale_color_manual(values = c("red", "blue"))

#add decision boundary and visualize
plot_decision <- plot_transformed + geom_abline(slope = -1, intercept = 0.64)
plot_decision

# fit a svm polynomial model, one train/test cut, not optimised

svm_model<- 
  svm(y ~ ., data = trainset, type = "C-classification", 
      kernel = "polynomial", degree = 2)

#measure training and test accuracy
pred_train <- predict(svm_model, trainset)
mean(pred_train == trainset$y)
pred_test <- predict(svm_model, testset)
mean(pred_test == testset$y)

#plot
plot(svm_model, trainset)

#####################
#####################

# introducing tune.svm

#tune model
tune_out <- 
  tune.svm(x = trainset[, -3], y = trainset[, 3], 
           type = "C-classification", 
           kernel = "polynomial", degree = 2, cost = 10^(-1:2), 
           gamma = c(0.1, 1, 10), coef0 = c(0.1, 1, 10))

#list optimal values
tune_out$best.parameters$degree
tune_out$best.parameters$gamma
tune_out$best.parameters$coef0

#Build tuned model
svm_model <- svm(y~ ., data = trainset, type = "C-classification", 
                 kernel = "polynomial", degree = 2, 
                 cost = tune_out$best.parameters$cost, 
                 gamma = tune_out$best.parameters$gamma, 
                 coef0 = tune_out$best.parameters$coef0)

#Calculate training and test accuracies
pred_train <- predict(svm_model, trainset)
mean(pred_train == trainset$y)
pred_test <- predict(svm_model, testset)
mean(pred_test == testset$y)

#plot model
plot(svm_model, trainset)

########################
########################
#######       generate a new fancy complex dataset

#number of data points
n <- 1000

#set seed
set.seed(1)

#create dataframe
df <- data.frame(x1 = rnorm(n, mean = -0.5, sd = 1), 
                 x2 = runif(n, min = -1, max = 1))

#set radius and centers
radius <- 0.8
center_1 <- c(-0.8, 0)
center_2 <- c(0.8, 0)
radius_squared <- radius^2

#create binary classification variable
df$y <- factor(ifelse((df$x1-center_1[1])^2 + (df$x2-center_1[2])^2 < radius_squared|
                        (df$x1-center_2[1])^2 + (df$x2-center_2[2])^2 < radius_squared, -1, 1),levels = c(-1, 1))


# Load ggplot2
library(ggplot2)

# Plot x2 vs. x1, colored by y
scatter_plot<- ggplot(data = df, aes(x = x1, y = x2, color = y)) + 
  # Add a point layer
  geom_point() + 
  scale_color_manual(values = c("red", "blue")) +
  # Specify equal coordinates
  coord_equal()

scatter_plot 

##################
#################
#########         Linear SVM for this most complex dataset
#build model
svm_model<- 
  svm(y ~ ., data = trainset, type = "C-classification", 
      kernel = "linear")

#build model
svm_model<- 
  svm(y ~ ., data = trainset, type = "C-classification", 
      kernel = "linear")

#accuracy
pred_train <- predict(svm_model, trainset)
mean(pred_train == trainset$y)
pred_test <- predict(svm_model, testset)
mean(pred_test == testset$y)

#plot model against testset
plot(svm_model, testset)           ### as expected, accuracy is very poor


#build model
svm_model<- 
  svm(y ~ ., data = trainset, type = "C-classification", 
      kernel = "polynomial", degree = 2)

#accuracy
pred_train <- predict(svm_model, trainset)
mean(pred_train == trainset$y)
pred_test <- predict(svm_model, testset)
mean(pred_test == testset$y)

#plot model
plot(svm_model, trainset)   ## still not capturing the figure 8 shape of the data

## The radial basis function - RBF kerner
##    a k-NN style algorithm that weights as a decreasing function of the distance between two points
##      gamma is tunable, using tune.svm()

#create vector to store accuracies and set random number seed
accuracy <- rep(NA, 100)
set.seed(2)

#calculate accuracies for 100 training/test partitions
for (i in 1:100){
  df[, "train"] <- ifelse(runif(nrow(df))<0.8, 1, 0)
  trainset <- df[df$train == 1, ]
  testset <- df[df$train == 0, ]
  trainColNum <- grep("train", names(trainset))
  trainset <- trainset[, -trainColNum]
  testset <- testset[, -trainColNum]
  svm_model<- svm(y ~ ., data = trainset, type = "C-classification", kernel = "polynomial", degree = 2)
  pred_test <- predict(svm_model, testset)
  accuracy[i] <- mean(pred_test == testset$y)
}

#print average accuracy and standard deviation
mean(accuracy)     ## Please note down the average accuracy and standard deviation. We'll compare these to the default RBF kernel SVM next. 
sd(accuracy)

###########################  no to demonstrate radial

#create vector to store accuracies and set random number seed
accuracy <- rep(NA, 100)
set.seed(2)

#calculate accuracies for 100 training/test partitions
for (i in 1:100){
  df[, "train"] <- ifelse(runif(nrow(df))<0.8, 1, 0)
  trainset <- df[df$train == 1, ]
  testset <- df[df$train == 0, ]
  trainColNum <- grep("train", names(trainset))
  trainset <- trainset[, -trainColNum]
  testset <- testset[, -trainColNum]
  svm_model<- svm(y ~ ., data = trainset, type = "C-classification", kernel = "radial")
  pred_test <- predict(svm_model, testset)
  accuracy[i] <- mean(pred_test == testset$y)
}

#print average accuracy and standard deviation
mean(accuracy)
sd(accuracy)
 ################ Note that the average accuracy is almost 10% better than the one obtained in the previous exercise 


#tune model
tune_out <- tune.svm(x = trainset[, -3], y = trainset[, 3], 
                     gamma = 5*10^(-2:2), 
                     cost = c(0.01, 0.1, 1, 10, 100), 
                     type = "C-classification", kernel = "radial")

#build tuned model
svm_model <- svm(y~ ., data = trainset, type = "C-classification", kernel = "radial", 
                 cost = tune_out$best.parameters$cost, 
                 gamma = tune_out$best.parameters$gamma)

#calculate test accuracy
pred_test <- predict(svm_model, testset)
mean(pred_test == testset$y)     

#Plot decision boundary against test data
plot(svm_model, testset)        ## Well done !!









