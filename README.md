Summary:
These functions can be used as a template to cache potentially time-consuming computations, utilizing the lexical scoping rules of R to preserve state inside an R object. They deal with matrix inversion specifically, though their format is intentionally simplistic so that they can be adjusted to suit other mathematical needs.

The <<- operator is used to assign value to an object in an external environment.

The solve() function is used to calculate the inverse of a hypothetical invertible matrix.

Repository contents:
makeCacheMatrix.R : makeCacheMatrix(x) - Creates a matrix and can cache its inverse. The type of object it creates & caches can be easily modified.

cacheSolve.R : cacheSolve(x, ...) - Computes the inverse of the object returned by makeCacheMatrix() (in this case, a matrix). If the inverse has already been calculated, and the object has not changed, it retrieves the inverse from the cache. The initial computation and cache retrieval can be easily modified.
