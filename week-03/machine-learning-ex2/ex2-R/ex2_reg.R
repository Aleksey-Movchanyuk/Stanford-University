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
rm(list=ls())

if(.Platform$OS.type == "windows") {
        setwd("c:/Users/omovchaniuk/Documents/Stanford-University/week-03/machine-learning-ex2/ex2-R")
} else {
        setwd("/Users/aleksey/Documents/MOOC/Coursera/ML/Stanford-University/week-03/machine-learning-ex2/ex2-R")
}

## Load Data
# The first two columns contains the exam scores and the third column
#  contains the label.

data <- read.table(file="../ex2/ex2data2.txt", sep=",", dec=".");
X <- matrix(unlist(data), ncol=3)[,1:2]; 
y <- data[,3];

library(ggplot2) 
ggplot(data, 
       aes(x = data[,1], 
           y = data[,2], 
           colour = factor(data[,3], levels=c(0,1), labels=c('Fail','Pass')) 
       )) +
        # Put some labels and Legend
        labs(x = "Microchip Test 1", y = "Microchip Test 2", colour = "Test Result") + 
        geom_point( aes(shape = data[,3]) ) +
        scale_shape_identity()

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
source("mapFeature.R")
X <- mapFeature(X[,1], X[,2]);

# Initialize fitting parameters
n <- ncol(X);
initial_theta <- matrix(0, n); 

# Set regularization parameter lambda to 1
lambda <- 1;

# Compute and display initial cost and gradient for regularized logistic
# regression
source("costFunctionReg.R")
cost <- costFunctionReg(initial_theta, X, y, lambda);

sprintf('Cost at initial theta (zeros): %f', cost);

## ============ Part 2: Compute Cost and Gradient ============
#  In this part of the exercise, you will implement the cost and gradient
#  for logistic regression. You neeed to complete the code in 
#  costFunction.m

#  Setup the data matrix appropriately, and add ones for the intercept term
m <- nrow(X);
n <- ncol(X);

# Add intercept term to x and X_test
X <- cbind(matrix(1, m), X) 

# Initialize fitting parameters
initial_theta <- matrix(0, n + 1); 


# Compute and display initial cost and gradient
source("costFunction.R")
cost <- costFunction(initial_theta, X, y);

sprintf('Cost at initial theta (zeros): %f', cost);


# =================== Part 3: Gradient descent ===================
source("gradientDescent.R")

# Some gradient descent settings
iterations <- 15000;
alpha <- 0.002;

# run gradient descent
theta <- gradientDescent(X, y, initial_theta, alpha, iterations);

cost <- costFunction(theta, X, y);

# Print theta to screen
sprintf('Cost at theta found by gradient descent: %f', cost);
sprintf('theta:');
sprintf('%f', theta);



## ============= Part 4: Optimizing using optim  =============
#  In this exercise, you will use a built-in function (optim) to find the
#  optimal parameters theta.

cost <- function(theta)
{
        m <- nrow(X)
        htheta <- sigmoid(X %*% theta);
        J = 1 / m * sum(-y %*% log(htheta) - (1 - y) %*% log(1 - htheta));
        return(J)
}
theta_optim <- optim(par=initial_theta,fn=cost)

# Print theta to screen
sprintf('Cost at theta found by optim: %f', theta_optim$par);
sprintf('theta:');
sprintf('%f', theta_optim$par);


theta <- theta_optim$par

## Plot Boundary

# Only need 2 points to define a line, so choose two endpoints
plot_x <- c(min(X[,2]),  max(X[,2]));

# Calculate the decision boundary line
plot_y <- (-1/theta[3])*(theta[2]*plot_x + theta[1]);

library(ggplot2) 
ggplot(data, 
       aes(x = X[,2], 
           y = X[,3], 
           colour = factor(y, levels=c(0,1), labels=c('Admitted','Not Admitted')) 
       )) +
        # Put some labels and Legend
        labs(x = "Exam 1 Score", y = "Exam 2 Score", colour = "Admitted Flag") + 
        geom_point( aes(shape = data[,3]) ) +
        scale_shape_identity() +
        geom_line(aes(x=plot_x, y=plot_y), color='blue')


## ============== Part 5: Predict and Accuracies ==============
#  After learning the parameters, you'll like to use it to predict the outcomes
#  on unseen data. In this part, you will use the logistic regression model
#  to predict the probability that a student with score 45 on exam 1 and 
#  score 85 on exam 2 will be admitted.
#
#  Furthermore, you will compute the training and test set accuracies of 
#  our model.
#
#  Your task is to complete the code in predict.m

#  Predict probability for a student with score 45 on exam 1 
#  and score 85 on exam 2 

prob <- sigmoid(c(1, 45, 85) %*% theta);
sprintf('For a student with scores 45 and 85, we predict an admission probability of %f', prob);

# Compute accuracy on our training set
source("predict.R")
p <- predict(theta, X);

sprintf('Train Accuracy: %f percent', mean(as.double(p[] == y[])) * 100);


