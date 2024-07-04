## Put comments here that give an overall description of what your
## functions do

# Function to create a special matrix object that can cache its inverse
makeCacheMatrix <- function(mat = matrix()) {
  
  # Initialize the inverse matrix cache
  cached_inverse <- NULL
  
  # Function to set the matrix
  set <- function(new_mat) {
    mat <<- new_mat  # Assign the input matrix 'new_mat' to 'mat' using global assignment operator '<<-'
    cached_inverse <<- NULL  # Reset the cached inverse when 'mat' is updated
  }
  
  # Function to get the matrix
  get <- function() mat
  
# Function to get the cached inverse if available; otherwise compute it and cache
cacheSolve <- function(...) {
    if (!is.null(cached_inverse)) {
      message("Retrieving cached inverse")
      return(cached_inverse)
    } else {
      message("Calculating inverse and caching")
      cached_inverse <- solve(mat, ...)  # Compute the inverse of 'mat'
      return(cached_inverse)
    }
  }
  
  # Return a list containing the set, get, and cacheSolve functions
  list(set = set, get = get, cacheSolve = cacheSolve)
}

# Function to compute the inverse of the special matrix using cached results
cacheSolve <- function(mat_obj, ...) {
  mat_obj$cacheSolve(...)  # Call the cacheSolve function stored within the matrix object 'mat_obj'
}
