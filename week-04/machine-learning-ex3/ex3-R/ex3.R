## Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

#  Instructions
#  ------------
        # 
#  This file contains code that helps you get started on the
#  linear exercise. You will need to complete the following functions 
#  in this exericse:
        #
#     lrCostFunction.R (logistic regression cost function)
#     oneVsAll.R
#     predictOneVsAll.R
#     predict.R
#
#  For this exercise, you will not need to change any code in this file,
#  or any other files other than those mentioned above.
#

## Initialization
if(.Platform$OS.type == "windows") {
        setwd("c:/Users/omovchaniuk/Documents/GitHub/Stanford-University/week-04/machine-learning-ex3/ex3-R")
} else {
        setwd("/Users/aleksey/Documents/MOOC/Coursera/ML/Stanford-University/week-04/machine-learning-ex3/ex3-R")
}

## Setup the parameters you will use for this part of the exercise
input_layer_size  <- 400;  # 20x20 Input Images of Digits
num_labels <- 10;          # 10 labels, from 1 to 10   
# (note that we have mapped "0" to label 10)

## =========== Part 1: Loading and Visualizing Data =============
        #  We start the exercise by first loading and visualizing the dataset. 
#  You will be working with a dataset that contains handwritten digits.
#

# Load Training Data
print('Loading and Visualizing Data ...\n')

library(R.matlab)
pic <- readMat("../ex3/ex3data1.mat"); # training data stored in arrays X, y

X <- pic$X
y <- pic$y

m <- nrow(X);


# Randomly select 100 data points to display
sel <- sample(m);
sel <- sel[1:100];

source("displayData.R")
displayData(X[sel,]);


print('Program paused. Press enter to continue.\n');


## ============ Part 2: Vectorize Logistic Regression ============
        #  In this part of the exercise, you will reuse your logistic regression
#  code from the last exercise. You task here is to make sure that your
#  regularized logistic regression implementation is vectorized. After
#  that, you will implement one-vs-all classification for the handwritten
#  digit dataset.
#

print('\nTraining One-vs-All Logistic Regression...\n')

lambda <- 0.1;
[all_theta] <- oneVsAll(X, y, num_labels, lambda);

print('Program paused. Press enter to continue.\n');



## ================ Part 3: Predict for One-Vs-All ================
        #  After ...
pred <- predictOneVsAll(all_theta, X);

print('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

