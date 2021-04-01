# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly.

makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.
# This function assumes that the matrix is invertible.

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}

## Sample:
## > x = matrix(1:4,2,2)
## > y = makeCacheMatrix(x)
## > y$get()
##[,1] [,2]
##[1,]    1    3
##[2,]    2    4

## No cache in the first run
## > cacheSolve(y)
##[,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5

## Retrieving from the cache in the second run
## > cacheSolve(y)
## getting cached data.
##[,1] [,2]
##[1,]   -2  1.5
##[2,]    1 -0.5
