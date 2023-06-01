#' A matrix-based R implementation for computing \eqn{x'Ay}
#'
#' @param x A size \eqn{n} vector
#' @param y A size \eqn{m} vector
#' @param A A size (\eqn{n x m}) matrix
#' @return A scalar value evaluating \eqn{x'Ay}
#' @examples
#' quadsumT(rep(1,100),rep(1,100),matrix(1,100,100))  # [1] 10000
#' @export
quadsumT <- function(x, y, A) {
    n <- length(x)
    m <- length(y)
    stopifnot(dim(A) == c(n,m)) # check whether the dimensions match
    return ( as.numeric(x %*% A %*% y) )  # use matrix operation // HL
}
