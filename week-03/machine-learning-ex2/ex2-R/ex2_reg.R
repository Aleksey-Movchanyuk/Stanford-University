## Machine Learning Online Class - Exercise 2: Logistic Regression
#
#  Instructions
#  ------------
# 
#  This file contains code that helps you get started on the logistic
#  regression exercise. You will need to complete the following functions 
#  in this exericse:
#
#     sigmoid.m
#     costFunction.m
#     predict.m
#     costFunctionReg.m
#
#  For this exercise, you will not need to change any code in this file,
#  or any other files other than those mentioned above.
#

## Initialization
if(.Platform$OS.type == "windows") {
        setwd("c:/Users/omovchaniuk/Documents/Stanford-University/week-03/machine-learning-ex2/ex2-R")
} else {
        setwd("/Users/aleksey/Documents/MOOC/Coursera/ML/Stanford-University/week-03/machine-learning-ex2/ex2-R")
}

rm(list=ls())
sources <- c("costFunctionReg.R","sigmoid.R",
             "plotData.R","plotDecisionBoundary.R",
             "mapFeature.R","predict.R")
for (i in 1:length(sources)) {
        cat(paste("Loading ",sources[i],"\n"))
        source(sources[i])
}

## Load Data
# The first two columns contains the exam scores and the third column
#  contains the label.

data <- read.table(file="../ex2/ex2data2.txt", sep=",", dec=".");
X <- matrix(unlist(data), ncol=3)[,1:2]; 
y <- data[,3];

plotData(X, y,axLables = c('Microchip Test 1','Microchip Test 2'),
         legLabels = c("y = 1","y = 0"))


## =========== Part 1: Regularized Logistic Regression ============
        #  In this part, you are given a dataset with data points that are not
#  linearly separable. However, you would still like to use logistic 
#  regression to classify the data points. 
#
#  To do so, you introduce more features to use -- in particular, you add
#  polynomial features to our data matrix (similar to polynomial
                                           #  regression).
#

# Add Polynomial Features

# Note that mapFeature also adds a column of ones for us, so the intercept
# term is handled
X <- mapFeature(X[,1], X[,2]);

# Initialize fitting parameters
n <- ncol(X);
initial_theta <- matrix(0, n); 

# Set regularization parameter lambda to 1
lambda <- 1;

# Compute and display initial cost and gradient for regularized logistic
# regression
cost <- costFunctionReg(initial_theta, X, y, lambda);

sprintf('Cost at initial theta (zeros): %f', cost);

## ============= Part 2: Regularization and Accuracies =============
        #  Optional Exercise:
        #  In this part, you will get to try different values of lambda and 
#  see how regularization affects the decision coundart
#
#  Try the following values of lambda (0, 1, 10, 100).
#
#  How does the decision boundary change when you vary lambda? How does
#  the training set accuracy vary?
#

# Initialize fitting parameters
n <- ncol(X);
initial_theta <- matrix(0, n); 

# Set regularization parameter lambda to 1 (you should vary this)
lambda <- 1;

# Optimize
optimRes <- optim(par = initial_theta, 
                  fn = costFunctionReg(X,y,lambda), 
                  gr = gradReg(X,y,lambda), 
                  method="BFGS", 
                  control = list(maxit = 400))

theta <- optimRes$par
J <- optimRes$value

# Plot decision Boundary

plotDecisionBoundary(theta, X, y, axLables = c('Microchip Test 1','Microchip Test 2'),
                     legLabels = c("y = 1","y = 0"))


# Compute accuracy on our training set
p <- predict(theta, X);

cat(sprintf('Train Accuracy: %f percent', mean(as.double(p[] == y[])) * 100))

