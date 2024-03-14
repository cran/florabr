## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = F,
  warning = FALSE
)

## ---- results='hide', message=FALSE-------------------------------------------
#  if(!require(devtools)){
#      install.packages("devtools")
#  }
#  
#  if(!require(florabr)){
#  devtools::install_github('wevertonbio/florabr')}
#  
#  library(florabr)

## -----------------------------------------------------------------------------
#  #Creating a folder in a temporary directory
#  #Replace 'file.path(tempdir(), "florabr")' by a path folder to be create in
#  #your computer
#  my_dir <- file.path(file.path(tempdir(), "florabr"))
#  dir.create(my_dir)

## ---- results='hide', message=FALSE, warning=FALSE----------------------------
#  get_florabr(output_dir = my_dir, #directory to save the data
#              data_version = "latest", #get the most recent version available
#              overwrite = T) #Overwrite data, if it exists

## ---- results='hide', message=FALSE, warning=FALSE----------------------------
#  get_florabr(output_dir = my_dir, #directory to save the data
#              data_version = "393.385", #Version 393.385, published on 2023-07-21
#              overwrite = T) #Overwrite data, if it exists

## -----------------------------------------------------------------------------
#  check_version(data_dir = my_dir)
#  #> You have the following versions of Brazilian Flora:
#  #>  393.385
#  #> 393.399
#  #>  It includes the latest version:  393.399

## -----------------------------------------------------------------------------
#  #Short version
#  bf <- load_florabr(data_dir = my_dir,
#                     data_version = "Latest_available",
#                     type = "short") #short
#  #> Loading version 393.399
#  colnames(bf) #See variables from short version
#  #>  [1] "species"             "scientificName"      "acceptedName"
#  #>  [4] "kingdom"             "Group"               "Subgroup"
#  #>  [7] "family"              "genus"               "lifeForm"
#  #> [10] "habitat"             "Biome"               "States"
#  #> [13] "vegetationType"      "Origin"              "Endemism"
#  #> [16] "taxonomicStatus"     "nomenclaturalStatus" "vernacularName"
#  #> [19] "taxonRank"

## -----------------------------------------------------------------------------
#  #Complete version
#  bf_complete <- load_florabr(data_dir = my_dir,
#                     data_version = "Latest_available",
#                     type = "complete") #complete
#  
#  colnames(bf_complete) #See variables from complete version
#  #>  [1] "id"                       "taxonID"
#  #>  [3] "acceptedNameUsageID"      "parentNameUsageID"
#  #>  [5] "originalNameUsageID"      "Group"
#  #>  [7] "Subgroup"                 "species"
#  #>  [9] "acceptedName"             "scientificName"
#  #> [11] "acceptedNameUsage"        "parentNameUsage"
#  #> [13] "namePublishedIn"          "namePublishedInYear"
#  #> [15] "higherClassification"     "kingdom"
#  #> [17] "phylum"                   "class"
#  #> [19] "order"                    "family"
#  #> [21] "genus"                    "specificEpithet"
#  #> [23] "infraspecificEpithet"     "taxonRank"
#  #> [25] "scientificNameAuthorship" "taxonomicStatus"
#  #> [27] "nomenclaturalStatus"      "vernacularName"
#  #> [29] "lifeForm"                 "habitat"
#  #> [31] "vegetationType"           "Origin"
#  #> [33] "Endemism"                 "Biome"
#  #> [35] "States"                   "countryCode"
#  #> [37] "modified"                 "bibliographicCitation"
#  #> [39] "references"

## ---- eval=FALSE, warning=FALSE, message=FALSE--------------------------------
#  write.csv(x = bf,
#            file = file.path(my_dir, "BrazilianFlora.csv"),
#            row.names = F)

