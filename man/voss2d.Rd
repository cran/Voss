\name{voss2d}
\alias{voss2d}
\title{Fractal Brownian function on 2D grid with a classic Voss algorithm}
\description{
\code{voss2d()} function generates realizations of a fractal Brownian fFunction on uniform 2D grid (FBF(x,y)) with a classic version of the Voss algorithm (random sequential additions).
}
\usage{
voss2d(g=7, H=0.5, r=0.5, center=TRUE)
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
The Voss algorithm on 2D grid is based on an iterative partitioning of the initial domain into smaller subdomains by bilinear interpolation of additional points.

At each iteration, all values of the fractal Brownian function get normal pseudorandom additions with zero mean and standard deviation, which depends on the iteration index \code{i}.

In the classical version of the Voss algorithm standard deviation is exponentially distributed by iteration: \code{s[i] <- s0*r^(i*H)}, where the initial value \code{s0 <- H*log(1/r)}.
}
\seealso{
\link{voss1d},
\link{voss2g}
}
\concept{fractal brownian function}
\concept{random sequential additions}
\author{Pavel V. Moskalev}
\references{
Shitov V.V. and Moskalev P.V.
Modification of the Voss algorithm for simulation of the internal structure of a porous medium 
//Technical Physics, Vol.50, No.2 (2005), pp.141-145.
}
\examples{
set.seed(20120522)
voss <- voss2d()
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a parameter H=0.5")
contour(voss, levels=0, add=TRUE)
}
