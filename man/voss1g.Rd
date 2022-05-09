\name{voss1g}
\alias{voss1g}
\title{Fractal Brownian function on 1D grid with a generic Voss algorithm}
\description{
\code{voss1g()} function generates realizations of a fractal Brownian function on uniform 1D grid (FBF(x)) with a generic version of the Voss algorithm (random sequential additions).
}
\usage{
voss1g(p=cbind(n=0.5^-seq(0,7)+1,
               s=dchisq(seq(0,7), df=2)),
       center=TRUE)
}
\arguments{
\item{p}{ a matrix of parameters:\cr
\code{nrow(p)} a number of iterations;\cr
\code{p[,"n"]} a number of partition points in the iteration process;\cr
\code{p[,"s"]} a standard deviation of normal pseudorandom additions; }
\item{center}{ logical; if \code{center=TRUE} then the \code{y}-coordinates of prefractal points will be centered. }
}
\value{
A list of Cartesian coordinates of prefractal points.
}
\details{
The Voss algorithm on 1D grid is based on an iterative partitioning of the initial segment into smaller subsegments by linear interpolation of additional points.

At each iteration, all values of the fractal Brownian function get normal pseudorandom additions with zero mean and standard deviation, which depends on the iteration index \code{s[i]}.

By default, the iterative distribution of standard deviation in the generic version of the Voss algorithm is equal to the probability density of the chi-square distribution with 2 degrees of freedom: \code{s[i] <- dchisq(i, df=2)}.
}
\seealso{
\link{voss2g},
\link{voss1d}
}
\concept{fractal brownian function}
\concept{random sequential additions}
\author{Pavel V. Moskalev}
\references{
Moskalev P.V. (2008) Visualization of wavelet spectra of fractal Brownian motion,
Technical Physics, Vol.53, No.10, pp.1261-1266, doi:10.1134/S1063784208100022.
}
\examples{
# Example 1: FBF(x) with a s[i]=dchisq(i,df=2)
set.seed(20120522)
plot(voss1g(), type="l", xlab="x", ylab="y",
     main="FBF(x) with a s[i]=dchisq(i,df=2)")
abline(h=0, lty=2)

# Example 2: FBF(x) with a s[i]=dlnorm(i,sdlog=1)
set.seed(20120522)
voss <- voss1g(p=cbind(n=0.5^-seq(0,7)+1,
                            s=dlnorm(seq(0,7), sdlog=1)))
plot(voss, type="l", xlab="x", ylab="y",
     main="FBF(x) with a s[i]=dlnorm(i,sdlog=1)")
abline(h=0, lty=2)

# Example 3: FBF(x,y) with a s[i]=df(i,df1=7,df2=7)
set.seed(20120522)
voss <- voss1g(p=cbind(n=0.5^-seq(0,7)+1,
                            s=df(seq(0,7), df1=7, df2=7)))
plot(voss, type="l", xlab="x", ylab="y",
     main="FBF(x) with a s[i]=df(i,df1=7,df2=7)")
abline(h=0, lty=2)
}
