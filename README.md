Generate tree maps from excel table (R package)
=========

The package treeMap is a set of function that automatically generates tree maps for each sheet in a given excel file.

# Test this package with the following commands:

library(treeMap)

# test 
writeMapTrees(system.file('table.xls', package = 'treeMap'))

# use your own excel file
writeMapTrees('~/myfile.xls')
