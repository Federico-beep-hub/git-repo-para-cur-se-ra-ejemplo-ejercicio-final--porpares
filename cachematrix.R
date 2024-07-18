## Put comments here that give an overall description of what your
## functions do

##  This function will create a special object of type "array" that can store its inverse.

makeCacheMatrix <- function(x = matrix()) {
          cache <- NULL

  setMatrix <- function(matrix) {
    x <<- matrix
    cache$inverse <<- NULL
  }

  getMatrix <- function() {
    x
  }

  setInverse <- function(inverse) {
    cache$inverse <<- inverse
  }

  getInverse <- function() {
    cache$inverse
  }
 
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setInverse = setInverse, getInverse = getInverse)
}



##  the cacheSolve function that calculates the inverse of the cached array

cacheSolve <- function(x, ...) {

  inverse <- cache$getInverse()
  if (!is.null(inverse)) {
    
    return(inverse)
  }
  
matrix <- cache$getMatrix()
  inverse <- solve(matrix)
  cache$setInverse(inverse)
  inverse
} 
