# Create a fake tukey.outlier function so code runs
tukey.outlier <- function(y) {
  rep(FALSE, length(y)) 

# Step 1: Bugged function to reproduce the error
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])  # bug: && only checks first element
  }
  outlier.vec <- vector("logical", length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

# Step 1 Test: Reproduce the error. I commented it out so the code can run.
# set.seed(123)
# test_mat <- matrix(rnorm(50), nrow = 10)
# tukey_multiple(test_mat)  

# Step 2: Diagnose the bug
# Using && only checks the first element of a vector. We need & for element-wise comparison.

# Step 3: Corrected function
corrected_tukey <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] & tukey.outlier(x[, j])  # changed && to & so all rows are compared
  }
  outlier.vec <- logical(nrow(x))
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  outlier.vec
}

# Step 4: Validate the fix
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)
corrected_tukey(test_mat)  
