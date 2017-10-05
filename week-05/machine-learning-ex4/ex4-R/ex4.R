## Machine Learning Online Class - Exercise 4 Neural Network Learning

# Instructions
#  ------------
        # 
#  This file contains code that helps you get started on the
#  linear exercise. You will need to complete the following functions 
#  in this exericse:

#
#  For this exercise, you will not need to change any code in this file,
#  or any other files other than those mentioned above.
#


## Initialization

if(.Platform$OS.type == "windows") {
        setwd("c:/Users/omovchaniuk/Documents/GitHub/Stanford-University/week 5/machine-learning-ex4/ex4-R")
} else {
        setwd("/Users/aleksey/Documents/MOOC/Coursera/ML/Stanford-University/week 5/machine-learning-ex4/ex4-R")
}


## Setup the parameters you will use for this exercise
input_layer_size  <- 400;  # 20x20 Input Images of Digits
hidden_layer_size <- 25;   # 25 hidden units
num_labels <- 10;          # 10 labels, from 1 to 10   
# (note that we have mapped "0" to label 10)


## =========== Part 1: Loading and Visualizing Data =============
#  We start the exercise by first loading and visualizing the dataset. 
#  You will be working with a dataset that contains handwritten digits.

# Load Training Data
library(R.matlab)

pic <- readMat("../ex4/ex4data1.mat")
X <- pic$X
y <- pic$y

m <- nrow(X);


# Randomly select 100 data points to display
sel <- sample(nrow(X));
sel <- sel[1:100];

source("displayData.R")
displayData(X[sel,])


## ================ Part 2: Loading Parameters ================
# In this part of the exercise, we load some pre-initialized 
# neural network parameters.

print('Loading Saved Neural Network Parameters ...')

# Load the weights into variables Theta1 and Theta2
weights <- readMat("../ex4/ex4weights.mat");
Theta1 <- weights$Theta1
Theta2 <- weights$Theta2

# Unroll parameters 
nn_params = matrix(c(Theta1, Theta2));


# Weight regularization parameter (we set this to 0 here).
lambda <- 0;

source("nnCostFunction.R")
J <- nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);

