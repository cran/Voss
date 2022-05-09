\name{voss1d}
\alias{voss1d}
\title{Fractal Brownian function on 1D grid with a classic Voss algorithm}
\description{
\code{voss1d()} function generates realizations of a fractal Brownian function on uniform 1D grid (FBF(x)) with a classic version of the Voss algorithm (random sequential additions).
}
\usage{
voss1d(g=7, H=0.5, r=0.5, center=TRUE)
}
\arguments{
\item{g}{ a number of iteration. }
\item{H}{ a Hurst parameter: \code{(0<H)&(H<1)}. }
\item{r}{ a partition coefficient for iteration segments. }
\item{center}{ logical; if \code{center=TRUE} then the \code{y}-coordinates of prefractal points will be centered. }
}
\value{
A list of Cartesian coordinates of prefractal points.
}
\details{
The Voss algorithm on 1D grid is based on an iterative partitioning of the initial segment into smaller subsegments by linear interpolation of additional points.

At each iteration, all values of the fractal Brownian function get normal pseudorandom additions with zero mean and standard deviation, which depends on the iteration index \code{i}.

In the classical version of the Voss algorithm a standard deviation is exponentially distributed by iteration: \code{s[i] <- s0*r^(i*H)}, where the initial value \code{s0 <- H*log(1/r)}.
}
\seealso{
\link{voss2d},
\link{voss1g}
}
\concept{fractal brownian function}
\concept{random sequential additions}
\author{Pavel V. Moskalev}
\references{
Moskalev P.V. (2008) Visualization of wavelet spectra of fractal Brownian motion,
Technical Physics, Vol.53, No.10, pp.1261-1266, doi:10.1134/S1063784208100022.
}
\examples{
set.seed(20120522)
plot(voss1d(), type="l", xlab="x", ylab="y",
     main="FBF(x) with a parameter H=0.5")
abline(h=0, lty=2)
}
