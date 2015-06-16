## This is the Coursera "R Programming" course assignment 2.
## Written by Kostiantyn S. Usenko
## mr_uks@ukr.net

# this function returns an object, which is a data structure
# with a LIST OF FUNCTIONS.
# we can think of it like of an object with predefined methods,
# see inside for detailed description of each sub-function:

makeCacheMatrix <- function(x = matrix()) {
  
    cachedInvMatrix <- NULL  # here will be stored cached
                             # inverted matrix, or NULL - in case if
           # the source matrix was changed
           # and the new Inverted matrix wasn't re-cached yet.
    
    set <- function(y) {     # inflates a source matrix
           x <<- y
           cachedInvMatrix <<- NULL
           # cachedInvMatrix set to null because when we update
           # the "source" matrix, our cached matrix will no
           # longer be a truly Inverted one for the "source"
           # matrix, it has to be recalculated and re-cached.
      } #end set() function
    
    get <- function() {x} #returns a source matrix itself
    
    setInvMatrix <- function(InvMatrix)
        {cachedInvMatrix <<- InvMatrix}
        # here <<- means that the value of InvMatrix,
        # that is passed into the setInvMatrix function,
        # is assigned to cachedInvMatrix variable stored
        # outside the Scope of setInvMatrix function,
        # think of it like a "parent" scope.
    
    getInvMatrix <- function() {cachedInvMatrix}
        # returns cached Inverted Matrix, or NULL
    
    list(set = set, get = get,
         setInvMatrix = setInvMatrix,
         getInvMatrix = getInvMatrix)
  } ## end of makeCacheMatrix function  
    

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
        cachedInvMatrix <- x$getInvMatrix()
        if (!is.null(cachedInvMatrix))
            {return(cachedInvMatrix)}
        # here we check if the cached Inverted matrix exists,
        # and if yes, return the stored value, and break
        # at this point. If it's NULL (no cached value stored),
        # we gonna solve the source matrix in a following steps.
        
        xInv<-solve(x$get())
        x$setInvMatrix(xInv)
        # that's it. 
        
        # the following is just to print out what we've got
        # as the resulting cached inverted matrix.
        xInv
  } ## end of the cacheSolve function
