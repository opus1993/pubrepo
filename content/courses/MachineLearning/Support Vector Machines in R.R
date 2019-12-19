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
