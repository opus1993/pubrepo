
# by Ben Baumer
#####

#discussion of parallel slopes models

lm(price~factor(year)+displacement, data=mtcars)   

library(broom)

#augment() adds the fitted values to the data frame

#Three Ways to Describe a Model

Mathematically:   an equation, residuals, and coefficients
Geometrically:    a plane, parallel lines on a plane, parallel planes
Syntacticly        dependant ~ . - exceptions

# formula()  definitions

 +   are independent features
 :   are interactions
 
# functions   predict()           or     augment() may be used with new data

# augment returns a nice data frame

# the data_grid

grid<- babies %>%
     data_grid(
       gestation = seq_range(gestation, by = 1),
       age = seq_range(gestation, by = 1))

geom_smooth()

# glm models - logistic

when using augment() -- must apply augment(model, type.predict = "response") for probabilistic fitted values       (the default is type.predict = "terms") which shows log odds values

# create new data frame
new_data <- data.frame(GPA=3.51)      # a one column data frame

# make predictions
augment(mod, newdata= new_data, type.predict = "response")  # one prediction

########################










