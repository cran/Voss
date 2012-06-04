\name{voss2g}
\alias{voss2g}
\title{Fractal Brownian function on 2D grid with a generic Voss algorithm}
\description{
\code{voss2g()} function generates realizations of a fractal Brownian function on uniform 2D grid (FBF(x,y)) with a generic version of the Voss algorithm (random sequential additions).
}
\usage{
voss2g(p=cbind(n=0.5^-seq(0,7)+1, 
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
The Voss algorithm on 2D grid is based on an iterative partitioning of the initial domain into smaller subdomains by bilinear interpolation of additional points.

At each iteration, all values of the fractal Brownian function get normal pseudorandom additions with zero mean and standard deviation, which depends on the iteration index \code{s[i]}.

By default, the iterative distribution of standard deviation in the generic version of the Voss algorithm is equal to the probability density of the chi-square distribution with 2 degrees of freedom: \code{s[i] <- dchisq(i, df=2)}.
}
\seealso{
\link{voss1g},
\link{voss2d}
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
# Example 1: FBF(x,y) with a s[i]=dchisq(i,df=2)
set.seed(20120522)
voss <- voss2g()
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a s[i]=dchisq(i,df=2)")
contour(voss, levels=0, add=TRUE)

# Example 2: FBF(x,y) with a s[i]=dlnorm(i,sdlog=1)
set.seed(20120522)
voss <- voss2g(p=cbind(n=0.5^-seq(0,7)+1, 
                       s=dlnorm(seq(0,7), sdlog=1)))
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a s[i]=dlnorm(i,sdlog=1)")
contour(voss, levels=0, add=TRUE)

# Example 3: FBF(x,y) with a s[i]=df(i,df1=7,df2=7)
set.seed(20120522)
voss <- voss2g(p=cbind(n=0.5^-seq(0,7)+1, 
                       s=df(seq(0,7), df1=7, df2=7)))
image(voss, xlab="x", ylab="y",
      main="FBF(x,y) with a s[i]=df(i,df1=5,df2=5)")
contour(voss, levels=0, add=TRUE)
}
