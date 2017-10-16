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

sources <- c("costFunction.R","sigmoid.R",
             "gradientDescent.R","plotData.R",
             "plotDecisionBoundary.R","predict.R")

for (i in 1:length(sources)) {
        cat(paste("Loading ",sources[i],"\n"))
        source(sources[i])
}

## Load Data
# The first two columns contains the exam scores and the third column
#  contains the label.

data <- read.table(file="../ex2/ex2data1.txt", sep=",", dec=".");
X <- matrix(unlist(data), ncol=3)[,1:2]; 
y <- data[,3];


## ==================== Part 1: Plotting ====================
        #  We start the exercise by first plotting the data to understand the 
#  the problem we are working with.

cat(print('Plotting data with + indicating (y = 1) examples and o indicating (y = 0) examples.\n'));

plotData(X, y)


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
cost <- costFunction(X, y)(initial_theta);

cat(sprintf('Cost at initial theta (zeros): %f', cost));


# =================== Part 3: Gradient descent ===================
# Some gradient descent settings
#iterations <- 15000;
#alpha <- 0.002;

# run gradient descent
#theta <- gradientDescent(X, y, initial_theta, alpha, iterations);

#cost <- costFunction(X, y)(theta);

# Print theta to screen
#sprintf('Cost at theta found by gradient descent: %f', cost);
#sprintf('theta:');
#sprintf('%f', theta);



## ============= Part 4: Optimizing using optim  =============
        #  In this exercise, you will use a built-in function (optim) to find the
#  optimal parameters theta.

optimRes <- optim(par = initial_theta, fn = costFunction(X,y), gr = grad(X,y), 
                  method="BFGS", control = list(maxit = 400))

theta <- optimRes$par
cost <- optimRes$value

# Print theta to screen
sprintf('Cost at theta found by optim: %f', theta);
sprintf('theta:');
sprintf('%f', cost);


# Plot Boundary
plotDecisionBoundary(theta, X, y)


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
p <- predict(theta, X);

sprintf('Train Accuracy: %f percent', mean(as.double(p[] == y[])) * 100);


