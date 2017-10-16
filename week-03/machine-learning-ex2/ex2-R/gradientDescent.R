
gradientDescent <- function(X, y, theta, alpha, iterations) {
        
        #GRADIENTDESCENT Performs gradient descent to learn theta
        #   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
        #   taking num_iters gradient steps with learning rate alpha
        
        # Initialize some useful values
        m <- length(y); # number of training examples
        J_history <- matrix(0,nrow=0,ncol=1)
        
        for (iter in 1:iterations) {
                # ====================== YOUR CODE HERE ======================
                # Instructions: Perform a single gradient step on the parameter vector
                #               theta. 
                #
                # Hint: While debugging, it can be useful to print out the values
                #       of the cost function (computeCost) and gradient here.
                #
                hold <- theta;
                
                for (j in 1:length( theta )) {
                        theta[j] <-  hold[j] - alpha * 1 / m * sum((sigmoid(X %*% theta) - y) * X[, j]);
                        #theta[j] <-  hold[j] - alpha * grad(X, y, hold);
                }
                
                # ============================================================
                
                # Save the cost J in every iteration    
                J_history <- rbind(J_history, costFunction(theta, X, y));
        }
        return(theta)
}