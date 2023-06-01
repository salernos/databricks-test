#' A loop-free R implementation for computing \eqn{x'Ay}
#'
#' @param x A size \eqn{n} vector
#' @param y A size \eqn{m} vector
#' @param A A size (\eqn{n x m}) matrix
#' @return A scalar value evaluating \eqn{x'Ay}
#' @examples
#' quadsumS(rep(1,100),rep(1,100),matrix(1,100,100))  # [1] 10000
#' @export
quadsumS <- function(x, y, A) { # function definition // HL
    n <- length(x)
    m <- length(y)
    stopifnot(dim(A) == c(n,m)) # check whether the dimensions match
    sum <- 0
    return( sum( matrix(x,n,m) * A * matrix(y,n,m,byrow=TRUE) ) ) ## element-wise sums // HL
}
