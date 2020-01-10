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

















