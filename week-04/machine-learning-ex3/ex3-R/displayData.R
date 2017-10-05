displayData <- function (X, example_width) {

  # Set example_width automatically if not passed in
  example_width <- round(sqrt(ncol(X)));

  # Compute rows, cols
  m <- nrow(X);
  n <- ncol(X)
  example_height = (n / example_width);
  
  # Compute number of items to display
  display_rows <- floor(sqrt(m));
  display_cols <- ceiling(m / display_rows);
  
  # Between images padding
  pad <- 1;
  
  # Setup blank display
  display_array <- matrix(-1, nrow=pad + display_rows * (example_height + pad), 
                              ncol=pad + display_cols * (example_width + pad));
  
  # Copy each example into a patch on the display array
  curr_ex <- 1;
  for (j in 1:display_rows) 
    
  {
    for (i in 1:display_cols) 
    {
      if (curr_ex > m) { 
        break; 
      }
      # Copy the patch
      
      # Get the max value of the patch
      max_val <- max(abs(X[curr_ex, ]));
      
      display_array[pad + (j - 1) * (example_height + pad) + (1:example_height),
                    pad + (i - 1) * (example_width + pad) + (1:example_width)] = 
        matrix(X[curr_ex, ], nrow=example_height, ncol=example_width) / max_val;
      
      curr_ex <- curr_ex + 1;
    }
    if (curr_ex > m) { 
      break; 
    }
  }
  
  display_array <- apply(display_array, 2, rev)
  
  
  image(t(display_array), axes = FALSE, col = gray((0:32)/32))

}