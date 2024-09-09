## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = F,
  warning = FALSE
)

## ----results='hide', message=FALSE--------------------------------------------
#  if(!require(remotes)){
#      install.packages("remotes")
#  }
#  
#  if(!require(faunabr)){
#  remotes::install_github('wevertonbio/faunabr')}
#  
#  library(florabr)

## -----------------------------------------------------------------------------
#  #Creating a folder in a temporary directory
#  #Replace 'file.path(tempdir(), "florabr")' by a path folder to be create in
#  #your computer
#  my_dir <- file.path(file.path(tempdir(), "florabr"))
#  dir.create(my_dir)

## ----results='hide', message=FALSE, warning=FALSE-----------------------------
#  get_florabr(output_dir = my_dir, #directory to save the data
#              data_version = "latest", #get the most recent version available
#              overwrite = T) #Overwrite data, if it exists

## ----results='hide', message=FALSE, warning=FALSE-----------------------------
#  get_florabr(output_dir = my_dir, #directory to save the data
#              data_version = "393.385", #Version 393.385, published on 2023-07-21
#              overwrite = T) #Overwrite data, if it exists

## -----------------------------------------------------------------------------
#  check_version(data_dir = my_dir)
#  #> You have the following versions of Flora e Funga do Brasil:
#  #>  393.385
#  #>  393.401
#  #>  It includes the latest version:  393.401

## -----------------------------------------------------------------------------
#  #Short version
#  bf <- load_florabr(data_dir = my_dir,
#                     data_version = "Latest_available",
#                     type = "short") #short
#  #> Loading version 393.401
#  colnames(bf) #See variables from short version
#  #>  [1] "species"             "scientificName"      "acceptedName"
#  #>  [4] "kingdom"             "group"               "subgroup"
#  #>  [7] "phylum"              "class"               "order"
#  #> [10] "family"              "genus"               "lifeForm"
#  #> [13] "habitat"             "biome"               "states"
#  #> [16] "vegetation"          "origin"              "endemism"
#  #> [19] "taxonomicStatus"     "nomenclaturalStatus" "vernacularName"
#  #> [22] "taxonRank"           "id"

## -----------------------------------------------------------------------------
#  #Complete version
#  bf_complete <- load_florabr(data_dir = my_dir,
#                     data_version = "Latest_available",
#                     type = "complete") #complete
#  
#  colnames(bf_complete) #See variables from complete version
#  #>  [1] "id"                       "taxonID"
#  #>  [3] "acceptedNameUsageID"      "parentNameUsageID"
#  #>  [5] "originalNameUsageID"      "group"
#  #>  [7] "subgroup"                 "species"
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
#  #> [31] "vegetation"               "origin"
#  #> [33] "endemism"                 "biome"
#  #> [35] "states"                   "countryCode"
#  #> [37] "modified"                 "bibliographicCitation"
#  #> [39] "references"

## ----eval=FALSE, warning=FALSE, message=FALSE---------------------------------
#  write.csv(x = bf,
#            file = file.path(my_dir, "BrazilianFlora.csv"),
#            row.names = F)

## ----eval = FALSE-------------------------------------------------------------
#  get_florabr(output_dir, data_version = "latest",
#              solve_discrepancy = TRUE, #Default is false
#              overwrite = TRUE,
#              verbose = TRUE)

## -----------------------------------------------------------------------------
#  attr(bf, "solve_discrepancies")
#  #> FALSE

## -----------------------------------------------------------------------------
#  acianthera <- subset_species(data = bf, species = "Acianthera ochreata",
#                               include_subspecies = TRUE, include_variety = TRUE)
#  #Check biomes with confirmed occurrence
#  acianthera[,c("scientificName", "taxonRank", "biome")]
#  #>                                                          scientificName  taxonRank                            biome
#  #> 8134                  Acianthera ochreata (Lindl.) Pridgeon & M.W.Chase    Species                 Caatinga;Cerrado
#  #> 24923    Acianthera ochreata subsp. cylindrifolia (Borba & Semir) Borba Subspecies                          Cerrado
#  #> 29550 Acianthera ochreata (Lindl.) Pridgeon & M.W.Chase subsp. ochreata Subspecies Atlantic_Forest;Caatinga;Cerrado

## -----------------------------------------------------------------------------
#  bf_solved <- solve_discrepancies(bf)
#  
#  #See attribute
#  attr(bf_solved, "solve_discrepancies")
#  #> TRUE

## -----------------------------------------------------------------------------
#  acianthera_solved <- subset_species(data = bf_solved, species = "Acianthera ochreata",
#                               include_subspecies = TRUE, include_variety = TRUE)
#  #Check biomes with confirmed occurrence
#  acianthera_solved[,c("scientificName", "taxonRank", "biome")]
#  #>                                                          scientificName  taxonRank                            biome
#  #> 16108                 Acianthera ochreata (Lindl.) Pridgeon & M.W.Chase    Species Atlantic_Forest;Caatinga;Cerrado
#  #> 24923    Acianthera ochreata subsp. cylindrifolia (Borba & Semir) Borba Subspecies                          Cerrado
#  #> 29550 Acianthera ochreata (Lindl.) Pridgeon & M.W.Chase subsp. ochreata Subspecies Atlantic_Forest;Caatinga;Cerrado
#  

