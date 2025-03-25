# Function to create a special matrix object with cached inverse
makeCacheMatrix <- function(x = matrix()) {
  # Initialize the cached inverse to NULL
  inv <- NULL
  
  # Set function to change the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL  # Reset the cached inverse when matrix changes
  }
  
  # Get the original matrix
  get <- function() x
  
  # Set the inverse 
  setinverse <- function(inverse) {
    inv <<- inverse
  }
  
  # Get the cached inverse
  getinverse <- function() inv
  
  # Return a list of functions
  list(
    set = set, 
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}

# Function to compute or retrieve cached inverse
cacheSolve <- function(x, ...) {
  # Try to retrieve cached inverse
  inv <- x$getinverse()
  
  # If inverse exists in cache, return it
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  
  # If no cached inverse, compute it
  data <- x$get()
  inv <- solve(data, ...)
  
  # Cache the computed inverse
  x$setinverse(inv)
  
  # Return the inverse
  inv
}