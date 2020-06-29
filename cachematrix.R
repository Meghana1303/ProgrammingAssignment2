## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##This case is same like the vector example
##we create a special matrix which is a list containing a functions to set and get the
##values of the matrix and its inverse


makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
##This function computes the inverse of the value returned by the above function.
##If the inverse has been already computed
##then function should give the inverse from the cache.
   

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
