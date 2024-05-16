## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message  = FALSE,
  eval = FALSE,
  fig.width = 8,
  fig.height = 6
)

## ----Get data, results='hide', message=FALSE, warning=FALSE, echo=FALSE-------
#  my_dir <- file.path(file.path(tempdir(), "florabr"))
#  dir.create(my_dir)
#  get_florabr(output_dir = my_dir, #directory to save the data
#              data_version = "latest", #get the most recent version available
#              overwrite = T) #Overwrite data, if it exists

## ----message=FALSE, warning=F-------------------------------------------------
#  library(florabr)
#  library(terra)
#  #Folder where you stored the data with the function get_florabr()
#  #Load data
#  bf <- load_florabr(data_dir = my_dir,
#                     data_version = "Latest_available",
#                     type = "short") #short version
#  #> Loading version 393.401

## -----------------------------------------------------------------------------
#  #Load Flora e Funga do Brasil data
#  data("bf_data")
#  #Select endemic and native species of trees with occurrence only in Amazon
#  am_trees <- select_species(data = bf_data,
#                            include_subspecies = FALSE,
#                            include_variety = FALSE,
#                            kingdom = "Plantae",
#                            group = "All", subgroup = "All",
#                            family = "All", genus = "All",
#                            lifeForm = "Tree", filter_lifeForm = "only",
#                            habitat = "All", filter_habitat = "in",
#                            biome = "Amazon",
#                            filter_biome = "only",
#                            state = "All", filter_state = "and",
#                            vegetation = "All",
#                            filter_vegetation = "in",
#                            endemism = "Endemic", origin = "Native",
#                            taxonomicStatus = "Accepted",
#                            nomenclaturalStatus = "All")
#  #Get presence-absence matrix
#  pam_am <- get_pam(data = am_trees, by_biome = TRUE, by_state = TRUE,
#                   by_vegetation = FALSE, remove_empty_sites = TRUE,
#                   return_richness_summary = TRUE,
#                   return_spatial_richness = TRUE,
#                   return_plot = TRUE)
#  #Visualize (as tibble) the PAM for the first 5 species and 7 sites
#  tibble::tibble(pam_am$PAM[1:7, 1:5])
#  # # A tibble: 7 × 5
#  #   Biome  States `Euxylophora paraensis` `Galipea congestiflora` `Hortia longifolia`
#  #   <fct>  <fct>                    <dbl>                   <dbl>               <dbl>
#  # 1 Amazon AM                           1                       0                   1
#  # 2 Amazon MA                           1                       1                   0
#  # 3 Amazon PA                           1                       1                   1
#  # 4 Amazon TO                           1                       1                   0
#  # 5 Amazon MT                           0                       0                   1
#  # 6 Amazon RR                           0                       0                   1
#  # 7 Amazon AC                           0                       0                   0

## -----------------------------------------------------------------------------
#  #Visualize (as tibble) the richness summary table
#  tibble::tibble(pam_am$Richness_summary[1:7,])
#  # # A tibble: 7 × 3
#  #   Biome  States Richness
#  #   <fct>  <fct>     <dbl>
#  # 1 Amazon AM          606
#  # 2 Amazon MA           34
#  # 3 Amazon PA          296
#  # 4 Amazon TO            7
#  # 5 Amazon MT           63
#  # 6 Amazon RR           45
#  # 7 Amazon AC          107

## ----IMG09, eval=TRUE, echo = FALSE-------------------------------------------
knitr::include_graphics("vignettes_img/Image_09.png")

