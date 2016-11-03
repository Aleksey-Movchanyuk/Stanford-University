## Machine Learning Online Class
#  Exercise 1: Linear regression with multiple variables
#
#  Instructions
#  ------------
  # 
#  This file contains code that helps you get started on the
#  linear regression exercise. 
#


## Initialization

if(.Platform$OS.type == "windows") {
  setwd("c:/Users/omovchaniuk/Documents/GitHub/Stanford-University/week 2/machine-learning-ex1/ex1 R")
} else {
  setwd("/Users/aleksey/Documents/MOOC/Coursera/ML/Stanford University/week 2/machine-learning-ex1/ex1 R")
}


## ================ Part 1: Feature Normalization ================
# Load Data
data <- read.table(file="../ex1/ex1data2.txt", sep=",", dec=".")
X <- data.matrix( data[,1:2] ); y <- data[,3];
m <- length(y); # number of training examples

# Scale features and set them to zero mean
source("featureNormalize.R")
X_norm <- featureNormalize(X)
  
# Add intercept term to X
X <- cbind(matrix(1, nrow(X)), X) 
X_norm <- cbind(matrix(1, nrow(X_norm)), X_norm) 


## ================ Part 2: Gradient Descent ================
  
  # ====================== YOUR CODE HERE ======================
  # Instructions: We have provided you with the following starter
#               code that runs gradient descent with a particular
#               learning rate (alpha). 
#
#               Your task is to first make sure that your functions - 
  #               computeCost and gradientDescent already work with 
#               this starter code and support multiple variables.
#
#               After that, try running gradient descent with 
#               different values of alpha and see which one gives
#               you the best result.
#
#               Finally, you should complete the code at the end
#               to predict the price of a 1650 sq-ft, 3 br house.
#
# Hint: By using the 'hold on' command, you can plot multiple
#       graphs on the same figure.
#
# Hint: At prediction, make sure you do the same feature normalization.
#

source("gradientDescentMulti.R")

# Choose some alpha value
alpha <- 0.01;
iterations <- 400;


# Init Theta and Run Gradient Descent 
theta <- matrix(0, 3); 

# run gradient descent
theta <- gradientDescentMulti(X_norm, y, theta, alpha, iterations);

theta2 <- gradientDescentMulti(X, y, theta, alpha, iterations);
