## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Constructor de matriz para calculo en caché de la inversa
makeCacheMatrix=function(A=matrix()){
    B=NULL; ## Inverse
    set=function(y){A<<-y;B<<-NULL;} ## Constructor
    get=function() A; 
    setinv=function(solve) B<<-solve; ## How to compute B
    getinv=function() B;
    list(set=set,get=get,setinv=setinv,getinv=getinv); 
  }
## Cálculo en caché de la inversa de una matriz regular
cacheSolve=function(A,...){
    B=A$getinv();
    ## Check if B is already computed
    if (!is.null(B)){message("getting cached data");return(B);}
    C=A$get();
    B=solve(C,...); ## Compute the inverse
    A$setinv(B);
    B; ## Return the inverse
}


