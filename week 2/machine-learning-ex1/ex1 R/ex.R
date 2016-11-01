

setwd("/Users/aleksey/Documents/MOOC/Coursera/ML/Stanford University/week 2/machine-learning-ex1/ex1 R")
source("warmUpExercise.R")

# ==================== Part 1: Basic Function ====================
A = warmUpExercise()


# ======================= Part 2: Plotting =======================
profits <- read.table(file="../ex1/ex1data1.txt", sep=",", dec=".")
colnames(profits) <- c("profit", "population")

library(ggplot2) 
qplot(profit, population, data=profits, colour = I("red"))

# =================== Part 3: Gradient descent ===================
X <- profits$profit; y <- profits$population;
m <- length(y); # number of training examples

X <- cbind(matrix(1, m), X) # Add a column of ones to X
theta <- matrix(0, 2); # initialize fitting parameters

# Some gradient descent settings
iterations <- 1500;
alpha <- 0.01;

source("computeCost.R")
source("gradientDescent.R")

# compute and display initial cost
computeCost(X, y, theta)

# run gradient descent
theta <- gradientDescent(X, y, theta, alpha, iterations);

# print theta to screen
sprintf('Theta found by gradient descent: ');
sprintf('%f %f \n', theta[1,], theta[2,]);

# Predict values for population sizes of 35,000 and 70,000
predict1 <- matrix(c(1, 3.5), nrow=1, ncol=2) %*% theta;
sprintf('For population = 35,000, we predict a profit of %f', predict1*10000);
predict2 = matrix(c(1, 7), nrow=1, ncol=2) %*% theta;
sprintf('For population = 70,000, we predict a profit of %f', predict2*10000);

# Plot the linear fit
# Gradient descent
lr <- data.frame( cbind( X[,2], X%*%theta ) )
colnames(lr) <- c("profit", "population")

# R linear regresion
fit <- lm(profit ~ population, data = profits)
lr_r <- data.frame( cbind( X[,2], X%*%matrix(coefficients(fit), nrow=2, ncol=1) ) )
colnames(lr_r) <- c("profit", "population")

ggplot() +
        geom_point(data=profits, aes(x = profit, y = population, colour="Training data")) +
        geom_line(data=lr, aes(x = profit, y = population, colour="Linear Regresion. Gradient Descent")) +
        geom_line(data=lr_r, aes(x = profit, y = population, colour="Linear Regresion. R Function")) +

        scale_colour_manual("", 
                            values = c("Training data" = "red",
                                       "Linear Regresion. Gradient Descent" = "blue", 
                                       "Linear Regresion. R Function" = "green")) +
        
        labs(title = "Week #1. Linear Regresion") +
        theme(legend.position = "right")

