### Test scenario

This is a sequence of steps used to check if everything works as it was supposed to work.

1. Open the R file in the R Studio
2. Make:
```source("path to .R file")```

3. Create a square invertable matrix, for example:
```myMatrix <- matrix(c(7,0,-3,2,3,4,1,-1,-2), nrow=3, ncol=3)```

4. Execute makeCacheMatrix over the sample matrix:
```aaa <- makeCacheMatrix(myMatrix)```

5. Check if aaa object contains our matrix right (don't forget the brackets):
`aaa%$get()`

expected result:`
     [,1] [,2] [,3]
[1,]    7    2    1
[2,]    0    3   -1
[3,]   -3    4   -2
`

6. Check the cached inverted matrix:
```aaa$getInvMatrix()```

expected result:
```NULL```

7. Calculate inverted matrix for our sample and store it to cache:
```cacheSolve(aaa)```

expected output:
```     [,1] [,2] [,3]
[1,]   -2    8   -5
[2,]    3  -11    7
[3,]    9  -34   21```

8. Check if it is really cached:
```aaa$getInvMatrix()```

expected output:
```     [,1] [,2] [,3]
[1,]   -2    8   -5
[2,]    3  -11    7
[3,]    9  -34   21```

9. Check if changing the sample matrix clears the cache.
To be simple, let's set the source matrix as 1x1 matrix of just 1 element "1":
```aaa$set(1)
aaa$get()```
expected output:
```[1] 1```

```aaa$getInvMatrix()```
expected output:
```NULL```

That's it.

Glory to Ukraine.
