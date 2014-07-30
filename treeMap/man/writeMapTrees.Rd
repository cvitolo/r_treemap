\name{writeMapTrees}
\alias{writeMapTrees}
\title{Function to write the map tree.}
\usage{
writeMapTrees(xlsFileName)
}
\arguments{
  \item{xlsFileName}{name of xls file containing the
  tables}
}
\value{
A tree for each sheet in JSON format and an HTML page to
load each tree.
}
\description{
Given an excel spreadsheet containing 1 tables in each
sheet, this function creates a list of node for each table
and then generates two files: the list of nodes in JSON
format and an HTML page to load the tree.
}
\examples{
# writeMapTrees(system.file('table.xls', package = 'treeMap'))
}
\author{
Claudia Vitolo <claudia.vitolo
}

