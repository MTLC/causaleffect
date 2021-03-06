\name{transport}
\alias{transport}
\title{Derive a transport formula for a causal effect between two domains}
\description{This function returns an expression for the transport formula of a causal effect between two domains.  The formula is returned for the interventional distribution of the set of variables (\code{y}) given the intervention on the set of variables (\code{x}) in a selection diagram (\code{D}).  If the effect is non-transportable, an error  is thrown describing the graphical structure that witnesses non-transportability. The vertices of (\code{D}) that correspond to selection variables must have a description parameter of a single character "S" (shorthand for "selection").  By default, every variable is available for intervention in the source. If only a subset of the variables is available, then the set (\code{z}) can be used to derive specific z-transportability. }

\usage{transport(y, x, z = NULL, D, expr = TRUE, simp = TRUE)}

\arguments{
  \item{y}{A character vector of variables of interest given the intervention. }
  \item{x}{A character vector of the variables that are acted upon. }
  \item{z}{A character vector of variables available for intervention. NULL value corresponds to ordinary transportability. }
  \item{D}{An \code{igraph} object describing a selection diagram in the internal syntax. }
  \item{expr}{A logical value. If \code{TRUE}, a string is returned describing the expression in LaTeX syntax. Else, a list structure is returned which can be manually parsed by the function \code{get.expression}}
  \item{simp}{A logical value. If \code{TRUE}, a simplification procedure is applied to the resulting probability object. d-separation and the rules of do-calculus are applied repeatedly to simplify the expression. }
}
\value{A character string or an object of class \code{probability} that describes the transport formula.}
\references{

Bareinboim, E., Pearl J. 2013a A General Algorithm for Deciding Transportability of Experimental Results. \emph{Journal of Causal Inference,}, \bold{1}, 107--134.

Bareinboim, E., Pearl J. 2013c Causal Transportability with Limited Experiments. \emph{Proceedings of the 27th AAAI Conference on Artificial Intelligence}, 95 - 101. 

}

\author{Santtu Tikka}

\seealso{ \code{\link{parse.graphml}}, \code{\link{get.expression}}, \code{\link{meta.transport}} }

\examples{
library(igraph)

# simplify = FALSE to allow multiple edges
d <- graph.formula(X -+ Z, Z -+ W, W -+ V, V -+ Y, S -+ V, # Observed edges
  X -+ Z, Z -+ X, V -+ Y, Y -+ V, X -+ Y, Y -+ X, simplify = FALSE)

# Here the bidirected edges are set to be unobserved in the selection diagram d
# This is denoted by giving them a description attribute with the value "U"
# The first five edges are observed, the rest are unobserved
d <- set.edge.attribute(d, "description", 6:11, "U")

# The variable "S" is a selection variable. This is denoted by giving it
# a description attribute with the value "S". 
d <- set.vertex.attribute(d, "description", 6, "S")   

res <- transport(y = "Y", x = "X", D = d)  


}

