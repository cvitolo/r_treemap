#' Function to make the list
#'
#' @author Claudia Vitolo
#'
#' @description Given a table in input a list is created to generate the tree nodes
#'
#' @param x table containing
#'
#' @return list of tree nodes
#'
#' @examples
#' # makelist(x)
#'

makeList <- function(x){

  if(ncol(x)>2){

    listSplit<-split(x[-1],x[1],drop=T)
    lapply(names(listSplit),
           function(y){list(name=y,children=makeList(listSplit[[y]]))})

  }else{

    lapply(seq(nrow(x[1])),function(y){list(name=x[,1][y],size=x[,2][y])})

  }

}
