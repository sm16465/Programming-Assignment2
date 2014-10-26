Enter file contents here
## This is a pair of functions that cache the inverse of a matrix
## Creates a special matrix object that can cache its inverse

makeCacheMatrix <- function( m = matrix() ) {
i <- NULL
## This is the method to set the matrix
set <- function( matrix ) {
m <<- matrix
i <<- NULL
}
## This is the method the get the matrix
get <- function() {
}
## This is the method to set the inverse of the matrix
setInverse <- function(inverse) {
i <<- inverse
}
## This is the method to get the inverse of the matrix
getInverse <- function() {
## Return the inverse property
i
}
## This shall return a list of the methods
list(set = set, get = get,
setInverse = setInverse,
getInverse = getInverse)
}

## This is to Compute the inverse of the special matrix returned by 
## "makeCacheMatrix"above. If the inverse has already been  
## calculated (and the matrix has not changed), then the 
## "cachesolve" should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
## To Return a matrix that is the inverse of 'x'
m <- x$getInverse()
## This is just to return the inverse if its already set
if( !is.null(m) ) {
message("getting cached data")
return(m)
}
## To get the matrix from our object
data <- x$get()
## T0 calculate the inverse using matrix multiplication
m <- solve(data) %*% data
## To set the inverse to the object
x$setInverse(m)
## To return the matrix
m
}
