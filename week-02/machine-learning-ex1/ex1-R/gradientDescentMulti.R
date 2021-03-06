gradientDescentMulti <- function(X, y, theta, alpha, num_iters) {
        
        #GRADIENTDESCENT Performs gradient descent to learn theta
        #   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
        #   taking num_iters gradient steps with learning rate alpha
        
        # Initialize some useful values
        m <- length(y); # number of training examples
        J_history <- matrix(,nrow=0,ncol=1)
        
        source("computeCostMulti.R")
        
        for (iter in 1:num_iters) {
                
                # ====================== YOUR CODE HERE ======================
                # Instructions: Perform a single gradient step on the parameter vector
                #               theta. 
                #
                # Hint: While debugging, it can be useful to print out the values
                #       of the cost function (computeCost) and gradient here.
                #
                hold <- theta;
                
                for (j in 1:length( theta )) {
                        
                        theta[j] <-  hold[j] - ( alpha * sum(( X %*% hold - y )*X[,j])) / m;
                        
                }
                
                
                # ============================================================
                
                # Save the cost J in every iteration    
                J_history <- rbind(J_history, computeCostMulti(X, y, theta));
                
        }
        
        library(ggplot2) 
        ggplot() +
                geom_line(data=J_history, aes(x = J_history[,1], y = J_history[,2]))
        
        return(theta)
}