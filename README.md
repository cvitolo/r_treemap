TreeMap (R package)
================================================

[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.15719.svg)](http://dx.doi.org/10.5281/zenodo.15719)

The package treeMap contains a set of functions to automatically generate D3.js 
tree maps for each sheet in a given excel file. 

**To cite this software:**  
Vitolo C., TreeMap (R package), (2014), GitHub repository, https://github.com/cvitolo/r_treemap, doi: http://dx.doi.org/10.5281/zenodo.15719

##### Basics
I assume you use Linux Ubuntu. Go to terminal and run the following commands:

    sudo apt-get install openjdk-7-jdk
    sudo R CMD javareconf

Back in R, install dependent packages from CRAN:
```R
x <- c("XLConnect", "RJSONIO","devtools")
install.packages(x)

# load the packages
lapply(x, require, character.only=T); rm(x)
```

Now install the treemap package from github:
```R
install_github("cvitolo/r_treemap", subdir = "treeMap")
library(treeMap)
```

#### Run a test
writeMapTrees(system.file('table.xls', package = 'treeMap'),outputPath="~")

#### Use your own excel file
writeMapTrees('~/myfile.xls',outputPath="~")

##### Warnings
This package and functions herein are part of an experimental open-source project. They are provided as is, without any guarantee.

##### Leave your feedback
I would greatly appreciate if you could leave your feedbacks via email (cvitolodev@gmail.com).
