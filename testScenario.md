### Test scenario

This is a sequence of steps used to check if everything works as it was supposed to work.

* Open the R file in the R Studio
* Make:
```source("path to .R file")```

* Create a square invertable matrix, for example:
```myMatrix <- matrix(c(7,0,-3,2,3,4,1,-1,-2), nrow=3, ncol=3)```

* Execute *makeCacheMatrix* over the sample matrix, and assign a variable *aaa* to resulting object:
```aaa <- makeCacheMatrix(myMatrix)```

* Check if *aaa* object contains our matrix right (don't forget the brackets):
`aaa$get()`

expected result:
```
     [,1] [,2] [,3]
[1,]    7    2    1
[2,]    0    3   -1
[3,]   -3    4   -2
```

* Check the cached inverted matrix:
`aaa$getInvMatrix()`

expected result:
`NULL`

* Calculate inverted matrix for our sample and store it to cache:
`cacheSolve(aaa)`

expected output:
```
     [,1] [,2] [,3]
[1,]   -2    8   -5
[2,]    3  -11    7
[3,]    9  -34   21
```

* Check if it is really cached:
`aaa$getInvMatrix()`

expected output:
```
     [,1] [,2] [,3]
[1,]   -2    8   -5
[2,]    3  -11    7
[3,]    9  -34   21
```

* Check if changing the sample matrix clears the cache.
To be simple, let's set the source matrix as 1x1 matrix of just one element "1":
`aaa$set(1)`
 
`aaa$get()`

expected output:
 
`[1] 1`

Then we go:
`aaa$getInvMatrix()`

expected output:
`NULL`

That's it, stay strong, have a good day.

Glory to Ukraine.
