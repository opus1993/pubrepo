#introduction-to-advanced-dimensionality-reduction

# by Federico Castanedo

# Exploring the MNIST dataset

# Two techniques in this class:
## t-Distributed Stochastic Neighbor Embedding t-SNE     non-linear
## Generalized Low Rank Models (GLRM)      parallelized optimization w/imputation

## both for unsupervised algorithms

# benefits ----
  # clearer features selection
  # data compressed into a few important features
  # memory-saving and speeding up of machine learning models
  # visualizaiton of high dimensional datasets
  # impute missing data

data(mnist)   #handwritten images, 28x28 pixels
  
#################################

# content for 12 January 2020

# Inspect the output object's structure
str(tsne_output)

# Show the K-L divergence of each record after the final iteration
tsne_output$costs

# Plot the K-L divergence of each record after the final iteration
plot(tsne_output$itercosts, type = "l")


# Plot the K-L divergence of each record after the final iteration
plot(tsne_output$costs, type = "l")
# Those values close to zero correspond to digits that preserve their original structure in the new low-dimensional space. 


# a test:  each time tsne is run wiht different seed, the answer will be different 

# Generate a three-dimensional t-SNE embedding without PCA
tsne_output <- Rtsne(mnist_sample[, -1], PCA=FALSE, dims = 3)

# Generate a new t-SNE embedding with the same hyper-parameter values
tsne_output_new <- Rtsne(mnist_sample[, -1], PCA=FALSE, dims = 3)

# Check if the two outputs are identical
identical(tsne_output , tsne_output_new)






# Set seed to ensure reproducible results
set.seed(1234)

# Execute a t-SNE with 2000 iterations
tsne_output <- Rtsne(mnist_sample[,-1],PCA= TRUE, dims =2, max_iter=2000 )

# Observe the output costs 
tsne_output$itercosts

# Get the 50th iteration with the minimum K-L cost
which.min(tsne_output$itercosts)
## As you can see the minimum cost (K-L divergence) corresponds to iteration 1000 (20*50).




# Set seed to ensure reproducible results
set.seed(1234)

# Execute a t-SNE with perplexity 5
tsne_output<-Rtsne(mnist_sample[,-1], perplexity = 5, max_iter = 1200 )
# Observe the returned K-L divergence costs at every 50th iteration
tsne_output$itercosts

# Execute a t-SNE with perplexity 20
tsne_output<-Rtsne(mnist_sample[,-1], perplexity = 20, max_iter = 1200 )
# Observe the returned K-L divergence costs at every 50th iteration
tsne_output$itercosts

# Execute a t-SNE with perplexity 50
tsne_output<-Rtsne(mnist_sample[,-1], perplexity = 50, max_iter = 1200 )
# Observe the returned K-L divergence costs at every 50th iteration
tsne_output$itercosts


#####
###

# Observe the K-L divergence costs with perplexity 5 and 50
tsne_output_5$itercosts
tsne_output_50$itercosts

# Generate the data frame to visualize the embedding
tsne_plot_5 <- data.frame(tsne_x = tsne_output_5$Y[,1], tsne_y = tsne_output_5$Y[,2], digit = as.factor(mnist_10k$label))
tsne_plot_50 <- data.frame(tsne_x = tsne_output_50$Y[,1], tsne_y = tsne_output_50$Y[,2], digit = as.factor(mnist_10k$label))

# Plot the obtained embeddings
ggplot(tsne_plot_5, aes(x = tsne_x, y = tsne_y, color = digit)) + 
  ggtitle("MNIST t-SNE with 1300 iter and Perplexity=5") + geom_text(aes(label = digit)) + 
  theme(legend.position="none")
ggplot(tsne_plot_50, aes(x = tsne_x, y = tsne_y, color = digit)) + 
  ggtitle("MNIST t-SNE with 1300 iter and Perplexity=50") + geom_text(aes(label = digit)) + 
  theme(legend.position="none")

## As you can see a perplexity value of 50 generates a better embedding for this dataset.


#####

#Plotting spatial distribution of true classes
#As seen in the video, you can use the obtained representation of t-SNE in a lower dimension space to classify new digits based on the Euclidean distance to known clusters of digits. For this task, let's start with plotting the spatial distribution of the digit labels in the embedding space. You are going to use the output of a t-SNE execution of 10K MNIST records named tsne and the true labels can be found in a dataset named mnist_10k.
#In this exercise, you will use the first 5K records of tsne and mnist_10k datasets and the goal is to visualize the obtained t-SNE embedding.


# Prepare the data.frame
tsne_plot <- data.frame(tsne_x = tsne$Y[1:5000, 1], 
                        tsne_y = tsne$Y[1:5000, 2], 
                        digit = as.factor(mnist_10k[1:5000, ]$label))

# Plot the obtained embedding
ggplot(tsne_plot, aes(x = tsne_x, y = tsne_y, color = digit)) + 
  ggtitle("MNIST embedding of the first 5K digits") + 
  geom_text(aes(label = digit)) + 
  theme(legend.position="none")

# As you can see, the embedding has a good quality since in this new low-dimensional space similar digits are grouped together. 

# Get the first 5K records and set the column names
dt_prototypes <- as.data.table(tsne$Y[1:5000,])
setnames(dt_prototypes, c("X", "Y"))

# Paste the label column as factor
dt_prototypes[, label := as.factor(mnist_10k[1:5000,]$label)]

# Compute the centroids per label
dt_prototypes[, mean_X := mean(X), by = label]
dt_prototypes[, mean_Y := mean(Y), by = label]

# Get the unique records per label
dt_prototypes <- unique(dt_prototypes, by = "label")
dt_prototypes

# Great! You have computed the centroids or prototypes for each of the label classes! 


# Store the last 5000 records in distances and set column names
distances <- as.data.table(tsne$Y[5001:10000,])
setnames(distances, c("X","Y"))

# Paste the true label
distances[, label := mnist_10k[5001:10000,]$label]

# Filter only those labels that are 1 or 0 
distances_filtered <- distances[label == 1 | label == 0]

# Compute Euclidean distance to prototype of digit 1
distances_filtered[, dist_1 := sqrt( (X - dt_prototypes[label == 1,]$mean_X)^2 + 
                                       (Y - dt_prototypes[label == 1,]$mean_Y)^2)]


### Congratulations! You have implemented a supervised classifier from an unsupervised learning model by using a similarity metric from each digit to the prototype of digit 1. 
	
# Compute the basic statistics of distances from records of class 1
summary(distances[label == 1]$dist_1)

# Compute the basic statistics of distances from records of class 0
summary(distances[label == 0]$dist_1)

# Plot the histogram of distances of each class
ggplot(distances, aes(x = dist_1, fill = as.factor(label))) +
  geom_histogram(binwidth = 5, alpha = .5, position = "identity", show.legend = FALSE) + 
  ggtitle("Distribution of Euclidean distance 1 vs 0")

# As you can see in the histogram we can perform a good separation between these two digits, because the Euclidean distance to to the digit 1 prototype is different. 

#########
###

#Exploring credit card fraud dataset
#In this exercise, you will do some data exploration on a sample of the credit card fraud detection dataset from Kaggle. For any problem, starting with some data exploration is a good practice and helps us better understand the characteristics of the data.
#The credit card fraud dataset is already loaded in the environment as a data table with the name creditcard. As you saw in the video, it consists of 30 numerical variables. The Class column indicates if the transaction is fraudulent.

# Look at the data dimensions
dim(creditcard)

# Explore the column names
colnames(creditcard)

# Explore the structure
str(creditcard)

# Generate a summary
summary(creditcard)

# Plot a histogram of the transaction time
ggplot(creditcard, aes(x = Time)) + 
  geom_histogram()

# As you can see most of the transactions took part in the middle of two consecutive days. 

# Extract positive and negative instances of fraud
creditcard_pos <- creditcard[Class == 1]
creditcard_neg <- creditcard[Class == 0]

# Fix the seed
set.seed(1234)

# Create a new negative balanced dataset by undersampling
creditcard_neg_bal <- creditcard_neg[sample(1:nrow(creditcard_neg), nrow(creditcard_pos))]

# Generate a balanced train set
creditcard_train <- rbind(creditcard_pos, creditcard_neg_bal)


####
# train an example random forest model

# Fix the seed
set.seed(1234)

# Separate x and y sets
train_x <- creditcard_train[,-31]
train_y <- creditcard_train$Class

# Train a random forests
rf_model <- randomForest(x=train_x, y= train_y, ntree = 100)

# Plot the error evolution and variable importance
plot(rf_model)
varImpPlot(rf_model)


# Set the seed
set.seed(1234)

# Generate the t-SNE embedding 
tsne_output <- Rtsne(as.matrix(creditcard_train[,-31]), check_duplicates = FALSE, PCA = FALSE)

# Generate a data frame to plot the result
tsne_plot <- data.frame(tsne_x = tsne_output$Y[,1],
                        tsne_y = tsne_output$Y[,2],
                        Class = creditcard_train$Class)

# Plot the embedding usign ggplot and the label
ggplot(tsne_plot, aes(x = tsne_x, y = tsne_y, color = Class)) + 
  ggtitle("t-SNE of credit card fraud train set") + 
  geom_text(aes(label = Class)) + theme(legend.position = "none")


### You have generated an embedding and as you can see we can identify the fraud cases very well. 


# Fix the seed
set.seed(1234)

# Train a random forest
rf_model_tsne <- randomForest(x= train_tsne_x, y = train_tsne_y, ntree = 100)

# Plot the error evolution
plot(rf_model_tsne)

# Plot the variable importance
varImpPlot(rf_model_tsne)

## You have generated a random forest using the embedding data. As you can see it is much faster! 


# Predict on the test set using the random forest 
pred_rf <- predict(rf_model, creditcard_test, type = "prob")

# Plot a probability distibution of the target class
hist(pred_rf[,2])

# Compute the area under the curve
pred <- prediction(pred_rf[,2], creditcard_test$Class)
perf <- performance(pred, measure = "auc") 
perf@y.values

## You have generated predictions using the random forest on the original features and as you can see the AUC is quite high. 


# Predict on the test set using the random forest generated with t-SNE features
pred_rf <- predict(rf_model_tsne, test_x, type = "prob")

# Plot a probability distibution of the target class
hist(pred_rf[,2])

# Compute the area under the curve
pred <- prediction(pred_rf[,2] , creditcard_test$Class)
perf <- performance(pred, measure = "auc") 
perf@y.values


## As you can see the AUC of this prediction is 0.01 better than the one with original features and the only difference is the t-SNE transformation. 







