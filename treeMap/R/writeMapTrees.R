#' Function to write the map tree.
#'
#' @author Claudia Vitolo
#'
#' @description Given an excel spreadsheet containing 1 tables in each sheet,
#' this function creates a list of node for each table and then generates two
#' files: the list of nodes in JSON format and an HTML page to load the tree.
#'
#' @param xlsFileName name of xls file containing the tables
#' @param outputPath path where to write the html and json files
#'
#' @return A tree for each sheet in JSON format and an HTML page to load each
#' tree.
#'
#' @examples
#' # writeMapTrees(system.file('table.xls', package = 'treeMap'))
#'

writeMapTrees <- function(xlsFileName, outputPath = NULL) {

  # xlsFileName <- "table.xls"
  excel.file <- file.path(xlsFileName)
  wb <- loadWorkbook(excel.file)
  sheets <- getSheets(wb)

  for (sheetName in sheets) {

    myTable <- readWorksheetFromFile(excel.file, sheet=sheetName)

    jsonOut<-toJSON(list(name=sheetName,children=makeList(myTable[-c(1,2)])))

    sheetPosition <- as.numeric(getSheetPos(object=wb,sheet=sheetName))

    #write JSON file
    if (is.null(outputPath)) {
      fileConn<-file(paste("tree",sheetPosition,".json",sep=""))
    }else{
      fileConn<-file(paste(outputPath,"/tree",sheetPosition,".json",sep=""))
    }

    writeLines(jsonOut, fileConn)
    close(fileConn)

    #write HTML file
    if (is.null(outputPath)) {
      fileConn<-file(paste("tree",sheetPosition,".html",sep=""))
    }else{
      fileConn<-file(paste(outputPath,"/tree",sheetPosition,".html",sep=""))
    }

    htmlOut <- readLines(system.file("template.html", package = 'treeMap'),-1)
    htmlOut[50]=paste("d3.json('tree",sheetPosition,".json', function(error, flare) {",sep="")
    writeLines(htmlOut, fileConn)
    close(fileConn)

  }

}
