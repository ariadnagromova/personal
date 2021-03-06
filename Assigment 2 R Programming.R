makeCacheMatrix <- function(x = matrix()) {
  ## The function creates a  "matrix" object that cachees its inverse
  makeCacheMatrix <- function(x = matrix()) { ## define the argument with default mode of "matrix"
    inv <- NULL                             ## to hold value of matrix inverse 
    set <- function(y) {                    ## define the set function to assign new 
      x <<- y                             ## value of matrix in parent environment
      inv <<- NULL                        ## if there is a new matrix, reset inv to NULL
    }
    get <- function() x                     ## define the get fucntion - returns value of the matrix argument
    
    setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
    getinverse <- function() inv                     ## gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer 
    ## to the functions with the $ operator
  }
  
  
  ## The function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
  ## If the inverse has already been calculated and the matrix has not changed,then cacheSolve will retrieve the inverse from the cache
  
  cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data!")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
  }