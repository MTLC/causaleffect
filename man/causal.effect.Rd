\name{causal.effect}
\alias{causal.effect}
\title{Identify a causal effect}
\description{This function returns an expression for the joint distribution of the set of variables (\code{y})
given the intervention on the set of variables (\code{x}) conditional on (\code{z}) if the effect is identifiable.  Otherwise
an error is thrown describing the graphical structure that witnesses unidentifiability.  }

\usage{causal.effect(y, x, z = NULL, G, expr = TRUE, simp = TRUE)}

\arguments{
  \item{y}{A character vector of variables of interest given the intervention.}
  \item{x}{A character vector of the variables that are acted upon.}
  \item{z}{A character vector of the conditioning variables.}
  \item{G}{An \code{igraph} object describing the directed acyclic graph induced by the causal model that matches the internal syntax. }
  \item{expr}{A logical value. If \code{TRUE}, a string is returned describing the expression in LaTeX syntax. Else, a list structure is returned which can be manually parsed by the function \code{get.expression}}
  \item{simp}{A logical value. If \code{TRUE}, a simplification procedure is applied to the resulting probability object. d-separation and the rules of do-calculus are applied repeatedly to simplify the expression. }
}
\value{A character string or an object of class \code{probability} that describes the interventional distribution.}
\references{

Shpitser I., Pearl J. 2006 Identification of Joint Interventional Distributions in Recursive semi-Markovian Causal Models.
\emph{Proceedings of the 21st National Conference on Artificial Intelligence}, \bold{2}, 1219--1226. 

Shpitser I., Pearl J. 2006 Identification of Conditional Interventional Distributions. 
\emph{Proceedings of the 22nd Conference on Uncertainty in Artificial Intelligence}, 427--444. }

\author{Santtu Tikka}

\seealso{ \code{\link{parse.graphml}}, \code{\link{get.expression}} }

\examples{
library(igraph)

# simplify = FALSE to allow multiple edges
g <- graph.formula(X -+ Y, Z -+ X, Z -+ Y , X -+ Z, Z -+ X, simplify = FALSE) 

# Here the bidirected edge between X and Z is set to be unobserved in graph g
# This is denoted by giving them a description attribute with the value "U"
# The edges in question are the fourth and the fifth edge
g <- set.edge.attribute(graph = g, name = "description", index = c(4,5), value = "U") 

res <- causal.effect(y = "Y", x = "X", G = g)
}

