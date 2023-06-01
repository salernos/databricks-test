#' A loop-based R implementation for computing \eqn{x'Ay}
#'
#' @param  x A size \eqn{n} vector
#' @param  y A size \eqn{m} vector
#' @param  A A size (\eqn{n x m}) matrix
#' @return A scalar value evaluating \eqn{x'Ay}
#' @examples
#' quadsumR(rep(1,100),rep(1,100),matrix(1,100,100))  # [1] 10000
#' @export
quadsumR <- function(x, y, A) { # function definition // HL
  n <- length(x)
  m <- length(y)
  stopifnot(dim(A) == c(n,m)) # sanity check
  sum <- 0
  for(i in 1:n) {             # loop over each row    // HL
    for(j in 1:m) {         # nest loop over each column // HL
      sum <- sum + x[i] * A[i,j] * y[j] # compute and add // HL
    }
  }
  return(sum)
}

