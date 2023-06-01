#include <Rcpp.h>     // always include when using Rcpp
using namespace Rcpp; // need to avoid typing Rcpp:: every time

//' A loop-based Rcpp implementation for computing \eqn{x'Ay}
//'
//' @param x A size \eqn{n} vector
//' @param y A size \eqn{m} vector
//' @param A A size (\eqn{n x m}) matrix
//' @return A scalar value evaluating \eqn{x'Ay}
//' @examples
//' quadsumC(rep(1,100),rep(1,100),matrix(1,100,100))  # [1] 10000
// [[Rcpp::export]]
double quadsumC(NumericVector x, NumericVector y, NumericMatrix A) {
	int n = x.size();
	int m = y.size();
	if ((A.nrow() != n) || (A.ncol() != m))
		stop("Mismatching dimensions of input data"); // sanity check routine
	double sum = 0;
	for (int i = 0; i < n; ++i) {       // loop over each row // HL
		for (int j = 0; j < m; ++j)       // nested loop over each column // HL
			sum += x[i] * A(i, j) * y[j]; // compute and add // HL
	}
	return sum; // return the final value
}
