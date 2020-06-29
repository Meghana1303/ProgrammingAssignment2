## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This case is same like the vector example
##we create a special matrix which is a list containing a functions to set and get the
##values of the matrix and its inverse
## it takes the matrix of any size
## gives error for non-invertible matrices

makeCacheMatrix <- function(x = matrix()) {
  invmatrix <- NULL
  set <- function(y) {
    #nested function
    x <<- y
    invmatrix <<- NULL
    #managing variables at two different levels
  }
  get <- function() x
  setinverse <- function(inverse) invmatrix <<- inverse
  getinverse <- function() invmatrix
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  #this function returns a list
}


## Write a short comment describing this function
##This function computes the inverse of the value returned by the above function.
##If the inverse has been already computed
##then function should give the inverse from the cache.
   

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  invmatrix <- x$getinverse()
  if (!is.null(invmatrix)) {
    message("getting cached data")
    return(invmatrix)
    #returns the cached data
  }
     
  data <- x$get()
  invmatrix <- solve(data, ...)
  x$setinverse(invmatrix)
  invmatrix
  #returns the newly computed data
}
