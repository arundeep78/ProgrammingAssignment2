# These functions are for the assingment 2 to build special matrix objects
# that can store its inverse in cache and inverse caclcuation functions
# which uses the cache to avoid repeat computation

# The function makeCachematrix creates a special matrix, which can store its inverse 
# in cache and provides get and set methods

makeCacheMatrix <- function(x = matrix()) {
    inv_m <- NULL
    set <- function(y){
        x <<- y
        inv_m <<- NULL
    }
    get <- function() x
    setInv <- function(x_inv) inv_m  <<- x_inv
    getInv <- function() inv_m
    list(set =set, get =get,
         setInv = setInv,
         getInv = getInv)
}


# This function gets the inverse from cache if it exists, otherwise calculates
# and store in the cache and finaly returns it


cacheSolve <- function(x, ...) {
       
    m_inv <- m$getInv()
    if(!is.null(m_inv)){
        message("getting cached data")
        return (m_inv)
    }
    data <- m$get()
    m_inv <- solve(data,...)
    m$setInv(m_inv)
    m_inv
}
