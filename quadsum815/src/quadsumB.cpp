#include <Rcpp.h>
using namespace Rcpp; // need to avoid typing Rcpp:: every time

//' A blockwise loop-based Rcpp implementation for computing \eqn{x'Ay}
//'
//' This function computes \eqn{x'Ay} using blockwise nested loop using Rcpp
//' @param x A size \eqn{n} vector
//' @param y A size \eqn{m} vector
//' @param A A size (\eqn{n x m}) matrix
//' @param blkSize The size of blocks (in #rows or #cols) in calculating \eqn{x'Ay}
//' @return A scalar value evaluating \eqn{x'Ay}
//' @examples
//' quadsumB(rep(1,100),rep(1,100),matrix(1,100,100), 100)  # [1] 10000
// [[Rcpp::export]]
double quadsumB(NumericVector x, NumericVector y, NumericMatrix A, int blkSize) {
	int n = x.size();
	int m = y.size();
	if ((A.nrow() != n) || (A.ncol() != m))
		stop("Mismatching dimensions of input data");   // sanity check routine
	double sum = 0;
	int ibeg, iend, jbeg, jend, i, j;                 // variables used for loop
	for (ibeg = 0; ibeg < n; ibeg += blkSize) {        // loop over each row block  // HL
		iend = ibeg + blkSize > n ? n : ibeg + blkSize;   // row block is [ibeg,iend-1]
		for (jbeg = 0; jbeg < m; jbeg += blkSize) {      // loop over each column block  // HL
			jend = jbeg + blkSize > m ? m : jbeg + blkSize; // column block is [ibeg,iend-1]
			for (i = ibeg; i < iend; ++i) {                  // loop over rows within the block // HL
				for (j = jbeg; j < jend; ++j)                // loop over columns within the block // HL
					sum += x[i] * A(i, j) * y[j];            // compute and add
			}
		}
	}
	return sum;
}
