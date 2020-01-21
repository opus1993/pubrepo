# more advanced dimensionality reduction in R


#  Why do we need dimensionality reduction techniques?    ----
# t-SNE t-Distributed Stochastic Neighbor Embedding (t-SNE) 
# Generalized Low Rank Models (GLRM) 

# Advantages of dimensionality reduction techniques:

# Feature selection 
#Data compressed into a few important features 
#Memory-saving and speeding up of machine learning models 
#Visualisation of high dimensional datasets 
#Imputing missing data (GLRM)

# Euclidean distance is the basis of many measures of similarity and is the most important distance metric. You can compute the Euclidean distance in R using the dist() function. 

# Distance metrics to compute similarity

# Euclidean distance          
dist(x, y)

# 
heatmap(as.matrix(distances), 
        Rowv = NA, symm = T,         
        labRow = mnist_sample$label[195:200],          
        labCol = mnist_sample$label[195:200]) 

# Minkowski family of distances        

distances <- dist(mnist_sample[195:200, -1, 
                 method = "minkowski", p = 3]) 

# Manhattan distance

distances <- dist(mnist_sample[195:200 ,-1],
                  method = "manhattan") 

# Kullback-Leibler (KL) divergence
## Not a metric since it does not satisfy the symmetric and triangle inequality properties 
## A common distance metric in Machine Learning (t-SNE). For example, in decision trees it is called Information Gain

library(philentropy)
mnist_6 <- mnist_sample[195:200, -1]
mnist_6 <- mnist_6 + 1 
sums <- rowSums(mnist_6)
distances <- distance(mnist_6/sums, method = "kullback-leibler")
heatmap(as.matrix(distances), Rowv = NA, symm = T,          
        labRow = mnist sample$label, 
        labCol = mnist_sample$label)

# Dimensionality reduction


####################
####################   Exercise

# Show the labels of the first 10 records
mnist_sample$label[1:10]

# Compute the Euclidean distance of the first 10 records
distances <- dist(mnist_sample[1:10,-1])

# Show the distances values
distances

# Plot the numeric matrix of the distances in a heatmap
heatmap(as.matrix(distances), 
        Rowv = NA, symm = TRUE, 
        labRow = mnist_sample$label[1:10], 
        labCol = mnist_sample$label[1:10])

# Minkowski distance or order 3
distances_3 <- dist(mnist_sample[1:10,-1], method = "minkowski", p = 3)
distances_3
heatmap(as.matrix(distances_3), 
        Rowv = NA, symm = TRUE, 
        labRow = mnist_sample$label[1:10], 
        labCol = mnist_sample$label[1:10])

# Minkowski distance of order 2
distances_2 <- dist(mnist_sample[1:10, -1], method = "minkowski", p = 2)
distances_2
heatmap(as.matrix(distances_2), 
        Rowv = NA, symm = TRUE, 
        labRow = mnist_sample$label[1:10], 
        labCol = mnist_sample$label[1:10])

### As you can see, when using Minkowski distance of order 2 the most similar digits 
### are in positions 3 and 5 of the heatmap grid which corresponds to digits 7 and 9. 

## There are more distance metrics that can be used to compute how similar two feature vectors are. ----
##For instance, the philentropy package has the function distance(), which implements 46 different distance metrics.

# Get the first 10 records
mnist_10 <- mnist_sample[1:10, -1]

# Add 1 to avoid NaN when rescaling
mnist_10_prep <- mnist_10 + 1

# Compute the sums per row
sums <- rowSums(mnist_10_prep)

# Compute KL divergence
distances <- distance(mnist_10_prep/sums, method = "kullback-leibler")
heatmap(as.matrix(distances), 
        Rowv = NA, symm = TRUE, 
        labRow = mnist_sample$label[1:10], 
        labCol = mnist_sample$label[1:10])

## This is a very tough problem! 
## KL metric considers digit 5 and 0 the most similar (position 1 and 2 in the heatmap grid). 


# Distance metrics can not deal with high-dimensional datasets. 
# This concept is known as curse of dimensionality. 
# The problem of nding similar digits can be solved with dimensionality reduction techniques such as PCA and t-SNE.

# Principal component analysis (PCA)
pca_result <- prcomp(mnist[, -1]) 
# PCA with two principal components
pca_result <- prcomp(mnist[, -1], rank = 2) 
summary(pca_result) 

plot(pca_result$x[,1:2], pch = as.character(mnist$label),       
     col = mnist$label, main = "PCA output") 

plot(tsne$tsne_x, tsne$tsne_y, pch = as.character(mnist$label),       
     col = mnist$label+1, main = "t-SNE output") 

######## Generating PCA from MNIST sample ----

# Get the principal components from PCA
pca_output <- prcomp(mnist_sample[,-1])

# Observe a summary of the output
summary(pca_output)

# Store the first two coordinates and the label in a data frame
pca_plot <- data.frame(pca_x = pca_output$x[, 1], pca_y = pca_output$x[, 2], 
                       label = as.factor(mnist_sample$label))

# Plot the first two principal components using the true labels as color and shape
ggplot(pca_plot, aes(x = pca_x, y = pca_y, color = label)) + 
  ggtitle("PCA of MNIST sample") + 
  geom_text(aes(label = label)) + 
  theme(legend.position = "none")

########################
#########################

# Explore the tsne_output structure
str(tsne_output)

# Have a look at the first records from the t-SNE output
head(tsne_output$Y)

# Store the first two coordinates and the label in a data.frame
tsne_plot <- data.frame(tsne_x = tsne_output$Y[, 1], tsne_y = tsne_output$Y[, 2], 
                        label = as.factor(mnist_sample$label))

# Plot the t-SNE embedding using the true labels as color and shape
ggplot(tsne_plot, aes(x = tsne_x, y = tsne_y, color = label)) + 
  ggtitle("T-Sne output") + 
  geom_text(aes(label = label)) + 
  theme(legend.position = "none")

## Congratulations! As you can see t-SNE generates a much better low-dimensional embedding than PCA. 

### Building a t-SNE embedding, and tuning the output
# a non-linear dimensionality redution technique

# step 1, use PCA          (send 50 maximum over to tsne)
# step 2, construct a probability distribution of high dimensional records         
# Dene a similarity probability distribution of the points in the low-dimensional embedding 
# Minimize the K-L divergence between the two distributions using gradient descent method

# Compute t-SNE without doing the PCA step
tsne_output <- Rtsne(mnist_sample[,-1], PCA = FALSE, dims = 3)

# Show the obtained embedding coordinates
head(tsne_output$Y)

# Store the first two coordinates and plot them 
tsne_plot <- data.frame(tsne_x = tsne_output$Y[, 1], tsne_y = tsne_output$Y[, 2], 
                        digit = as.factor(mnist_sample$label))

# Plot the coordinates
ggplot(tsne_plot, aes(x = tsne_x, y = tsne_y, color = digit)) + 
  ggtitle("t-SNE of MNIST sample") + 
  geom_text(aes(label = digit)) + 
  theme(legend.position = "none")

# Inspect the output object's structure
str(tsne_output)

# Show total costs after each 50th iteration
head(tsne_output$costs) 

# Plot the evolution of the KL divergence at each 50th iteration
plot(tsne_output$itercosts, type = "l")

##### Visualizing Neural Network performance

# Observe the dimensions
dim(layer_128_train)

# Show the first six records of the last ten columns
head(layer_128_train[, 119:128], 6)

# Generate a summary of all columns
summary(layer_128_train)

# Set the seed
set.seed(1234)

# Generate the t-SNE
tsne_output <- Rtsne(as.matrix(layer_128_train), perplexity = 50,
                     check_duplicates = FALSE, max_iter = 400)

# Prepare data.frame
tsne_plot <- data.frame(tsne_x = tsne_output$Y[,1], tsne_y = tsne_output$Y[,2], 
                        Class = creditcard_train$Class)

# Plot the data 
ggplot(tsne_plot, aes(x = tsne_x, y = tsne_y, color = Class)) + 
  geom_point() + 
  ggtitle("Credit card embedding of Last Neural Network Layer")

##### Fashion MNIST images   70,000 28x28 images
## Traditional mnist is too easy  (training with 60,000 images)

# Show the dimensions
dim(fashion_mnist)

# Create a summary of the last six columns 
summary(fashion_mnist[, 780:785],6)

# Table with the class distribution
table(fashion_mnist$label)

# Get the data from the last image
plot_data <- cbind(xy_axis, fill = as.data.frame(t(fashion_mnist[500, -1]))[,1])

# Observe the first records
head(plot_data, 6)

# Plot the image using ggplot()
ggplot(plot_data, aes(x, y, fill = fill)) + 
  ggtitle(class_names[as.integer(fashion_mnist[500, 1])]) + 
  plot_theme    ### shows the image #500 pullover with the image of a pullover

####  GLRM decomposition
# reduces the required space
# enables data visualization
# removes noies
# imputes missing data
# simplifies data processing

# parallelized dimensionality reduction algorithm
# categorical columns are transformed into binary columns
# H2O has a good implementaiton of GLRM

library(h2o)
h2o.init()


# Start a connection with the h2o cluster
h2o.init()

# Store the data into the h2o cluster
fashion_mnist.hex <- as.h2o(fashion_mnist, "fashion_mnist.hex")

# Store the data into h2o cluster
fashion_mnist.hex <- as.h2o(fashion_mnist, "fashion_mnist.hex")

# Launch a GLRM model over fashion_mnist data
model_glrm <- h2o.glrm(training_frame = fashion_mnist.hex,
                       cols = 2:ncol(fashion_mnist), 
                       k = 2,
                       seed = 123,
                       max_iterations = 100)

# Plotting the convergence
plot(model_glrm)

## we didn't get good convergence values for the GLRM model. Improving convergence values can sometimes be achieved by applying a transformation to the input data. In this exercise, we are going to normalize the input data before we start building the GLRM model. This can be achieved by setting the transform parameter of h2o.glrm() equal to "NORMALIZE"

# Launch a GLRM model with normalized fashion_mnist data  
model_glrm <- h2o.glrm(training_frame = fashion_mnist.hex, transform = "NORMALIZE",
                       cols = 1:ncol(fashion_mnist), 
                       k = 2, 
                       seed = 123,
                       max_iterations = 100)

# Plotting the convergence
plot(model_glrm)

# You have improved the convergence of the model. 

#### Visualizing the output of GLRM
#A GLRM model generates the X and Y matrixes. In this exercise, we are going to visualize the obtained low-dimensional representation of the input records in the new K-dimensional space. The output of the X matrix from the previous GLRM model has been loaded with the name X_matrix. This matrix has been obtained by calling:


# Dimension of X_matrix
dim(X_matrix)

# First records of X_matrix
head(X_matrix)

# Plot the records in the new two dimensional space
ggplot(as.data.table(X_matrix), aes(x= Arch1, y = Arch2, color = fashion_mnist$label)) + 
  ggtitle("Fashion Mnist GLRM Archetypes") + 
  geom_text(aes(label =  fashion_mnist$label)) + 
  theme(legend.position="none")

# Store the label of each record and compute the centroids
X_matrix[, label := as.numeric(fashion_mnist$label)]
X_matrix[, mean_x := mean(Arch1), by = label]
X_matrix[, mean_y := mean(Arch2), by = label]

# Get one record per label and create a vector with class names
X_mean <- unique(X_matrix, by = "label")
label_names <- c("T-shirt/top", "Trouser", "Pullover", "Dress", "Coat", "Sandal", "Shirt", "Sneaker", "Bag", "Ankle boot")

# Plot the centroids
ggplot(X_mean, aes(x = mean_x, y = mean_y, color = as.factor(label))) + 
  ggtitle("Fashion Mnist GLRM class centroids") + 
  geom_text(aes(label = label_names[label])) +
  theme(legend.position = "none")

###  Predicting / imputing missing values with GLRM

# Store the input data in h2o
fashion_mnist_miss.hex <- as.h2o(fashion_mnist_miss, "fashion_mnist_miss.hex")

# Build a GLRM model
model_glrm <- h2o.glrm(training_frame = fashion_mnist_miss.hex,
                       cols = 2:ncol(fashion_mnist_miss),
                       k = 2,
                       max_iterations = 100)

# Impute missing values
fashion_pred <- predict(model_glrm, fashion_mnist_miss.hex)

# Observe the statistics of the first 5 pixels
summary(fashion_pred[, 1:5])

### As you can see, GLRM can be used to impute missing data. 

### USING GLRM to speed up computation

# Get the starting timestamp
time_start <- proc.time()

# Train the random forest
rf_model <- randomForest(x = fashion_mnist[,-1], y = fashion_mnist$label, ntree = 20)

# Get the end timestamp
time_end <- timetaken(time_start)

# Show the error and the time
rf_model$err.rate[20]
time_end


### using a pre-built GLRM train_x and train_y, We can compute 25 times more trees in half of the time and get a similar accuracy. 

# Get the starting timestamp
time_start <- proc.time()

# Train the random forest
rf_model <- randomForest(x = train_x, y = train_y, ntree = 500)

# Get the end timestamp
time_end <- timetaken(time_start)

# Show the error and the time
rf_model$err.rate[500]
time_end
 
####        recap:  covered t-SNE and GLRM
###            many advantages
###               



