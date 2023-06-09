% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quadsumR.r
\name{quadsumR}
\alias{quadsumR}
\title{A loop-based R implementation for computing \eqn{x'Ay}}
\usage{
quadsumR(x, y, A)
}
\arguments{
\item{x}{A size \eqn{n} vector}

\item{y}{A size \eqn{m} vector}

\item{A}{A size (\eqn{n x m}) matrix}
}
\value{
A scalar value evaluating \eqn{x'Ay}
}
\description{
A loop-based R implementation for computing \eqn{x'Ay}
}
\examples{
quadsumR(rep(1,100),rep(1,100),matrix(1,100,100))  # [1] 10000
}
