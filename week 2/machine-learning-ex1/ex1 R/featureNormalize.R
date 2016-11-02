featureNormalize <- function (X_norm) {
  #FEATURENORMALIZE Normalizes the features in X 
  #   FEATURENORMALIZE(X) returns a normalized version of X where
  #   the mean value of each feature is 0 and the standard deviation
  #   is 1. This is often a good preprocessing step to do when
  #   working with learning algorithms.
  
  # You need to set these values correctly
  X_norm <- X;
  mu <- matrix(0, nrow=1, ncol=ncol(X));
  sigma <- matrix(0, nrow=1, ncol=ncol(X));
  
  # ====================== YOUR CODE HERE ======================
    # Instructions: First, for each feature dimension, compute the mean
  #               of the feature and subtract it from the dataset,
  #               storing the mean value in mu. Next, compute the 
  #               standard deviation of each feature and divide
  #               each feature by it's standard deviation, storing
  #               the standard deviation in sigma. 
  #
  #               Note that X is a matrix where each column is a 
  #               feature and each row is an example. You need 
  #               to perform the normalization separately for 
  #               each feature. 
  #
  # Hint: You might find the 'mean' and 'std' functions useful.
  #       
  

  for (i in 1:ncol(X)) {
    
    # compute the mean of the features
    mu[i] <- mean(X[,i])
    
    # compute the standard deviation of the features
    sigma[i] <- sd(X[,i])
  }
  
  

  for (i in 1:nrow(X)) {
    for (j in 1:ncol(X)) {
      
      X_norm[i, j] <- (X[i, j] - mu[j]) / sigma[j];
      
    }
  }

  return(X_norm);
  
  
  # ============================================================

}
