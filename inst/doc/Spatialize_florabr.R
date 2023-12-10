## ---- include = FALSE---------------------------------------------------------
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

## ---- message=FALSE, warning=F------------------------------------------------
#  library(florabr)
#  library(terra)
#  #Folder where you stored the data with the function get_florabr()
#  #Load data
#  bf <- load_florabr(data_dir = my_dir,
#                     data_version = "Latest_available",
#                     type = "short") #short version
#  #> Loading version 393.389

## -----------------------------------------------------------------------------
#  #Example species
#  spp <- c("Araucaria angustifolia", "Adesmia paranensis")
#  #Get spatial polygons
#  spp_spt <- get_spat_occ(data = bf, species = spp,
#                         State = TRUE, Biome = TRUE, intersection = TRUE,
#                         verbose = TRUE)
#  #> Getting states of Araucaria angustifolia
#  #> Getting biomes of Araucaria angustifolia
#  #> Getting biomes of Araucaria angustifolia
#  #> Getting states of Adesmia paranensis
#  #> Getting biomes of Adesmia paranensis
#  #> Getting biomes of Adesmia paranensis

## -----------------------------------------------------------------------------
#  par(mfrow = c(3, 2), mar = c(2, 0, 2, 0))
#  plot(spp_spt$`Araucaria angustifolia`$States,
#       main = paste0(names(spp_spt)[[1]], " - States"), mar = NA)
#  plot(spp_spt$`Araucaria angustifolia`$Biomes,
#       main = paste0(names(spp_spt)[[1]], " - Biomes"), mar = NA)
#  plot(spp_spt$`Araucaria angustifolia`$States_Biomes,
#       main = paste0(names(spp_spt)[[1]], " - Intersection"), mar = NA)
#  plot(spp_spt$`Adesmia paranensis`$States,
#       main = paste0(names(spp_spt)[[2]], " - States"), mar = NA)
#  plot(spp_spt$`Adesmia paranensis`$Biomes,
#       main = paste0(names(spp_spt)[[2]], " - Biomes"), mar = NA)
#  plot(spp_spt$`Adesmia paranensis`$States_Biomes,
#       main = paste0(names(spp_spt)[[2]], " - Intersection"), mar = NA)

## ----IMG01, eval=TRUE, echo=FALSE---------------------------------------------
knitr::include_graphics("vignettes_img/IMG01.png")

## -----------------------------------------------------------------------------
#  data("states")
#  states <- terra::unwrap(states)
#  data("biomes")
#  biomes <- terra::unwrap(biomes)
#  par(mfrow = c(2, 1), mar = c(0, 0, 0, 0))
#  plot(states, main = "Brazilian states with simplified geometries")
#  plot(biomes, main = "Brazilian biomes with simplified geometries")

## ----IMG02, eval=TRUE, echo=FALSE---------------------------------------------
knitr::include_graphics("vignettes_img/IMG02.png")

## ---- warning=FALSE, results='hide', message=FALSE----------------------------
#  #Install geobr if necessary and load package
#  if(!require(geobr)){
#      install.packages("geobr")
#  }
#  #Load geobr
#  library(geobr)

## ---- warning=FALSE, results='hide', message=FALSE----------------------------
#  br_states <- geobr::read_state(simplified = FALSE)
#  #Convert br_states from sf to SpatVect
#  br_states <- vect(br_states)

## -----------------------------------------------------------------------------
#  #Plot only State of Parana as example
#  par(mfrow = c(1, 2), mar = c(2, 2, 2, 2))
#  plot(br_states[br_states$abbrev_state == "PR"],
#       main = "Not simplified geometries", mar = NA)
#  plot(states[states$abbrev_state == "PR"],
#       main = "Simplified geometries",
#       mar = NA)

## ----IMG03, eval=TRUE, echo = FALSE-------------------------------------------
knitr::include_graphics("vignettes_img/IMG03.png")

## ---- warning=FALSE, results='hide'-------------------------------------------
#  br_biomes <- geobr::read_biomes()
#  #Convert br_biomes from sf to SpatVect
#  br_biomes<- terra::vect(br_biomes)
#  #Drop off coastal system:
#  br_biomes <- terra::subset(br_biomes,
#                             br_biomes$name_biome != "Sistema Costeiro")

## ---- results='hide'----------------------------------------------------------
#  #See names of biomes
#  br_biomes$name_biome
#  #Names that must be in the Spatvector to match with Brazilian Flora:
#  biomes$name_biome
#  #> [1] "Amazônia"       "Caatinga"       "Cerrado"        "Mata Atlântica"
#  #> [5] "Pampa"          "Pantanal"
#  #Translate
#  br_biomes$name_biome[which(br_biomes$name_biome == "Amazônia")] <- "Amazon"
#  br_biomes$name_biome[which(
#    br_biomes$name_biome == "Mata Atlântica")] <- "Atlantic_Forest"

## -----------------------------------------------------------------------------
#  spp_spt_2 <- get_spat_occ(data = bf, species = spp,
#                  State = TRUE, Biome = TRUE, intersection = TRUE,
#                  State_vect = br_states, #The non-simplified Spatvector
#                  state_column = "abbrev_state", #Column name with states acronyms
#                  Biome_vect = br_biomes, #The non-simplified Spatvector
#                  biome_column = "name_biome", #Column name with names of biomes
#                  verbose = TRUE)

## -----------------------------------------------------------------------------
#  par(mfrow = c(2, 2), mar = c(2, 2, 2, 2))
#  plot(spp_spt$`Araucaria angustifolia`$States,
#       main = paste0(names(spp_spt)[[1]], " - States simplified"), mar = NA)
#  plot(spp_spt_2$`Araucaria angustifolia`$States,
#       main = paste0(names(spp_spt)[[1]], " - States non-simplified"), mar = NA)
#  plot(spp_spt$`Araucaria angustifolia`$Biomes,
#       main = paste0(names(spp_spt)[[1]], " - Biomes simplified"), mar = NA)
#  plot(spp_spt$`Araucaria angustifolia`$Biomes,
#       main = paste0(names(spp_spt)[[1]], " - Biomes non-simplified"), mar = NA)

## ----IMG04, eval=TRUE, echo = FALSE-------------------------------------------
knitr::include_graphics("vignettes_img/IMG04.png")

## -----------------------------------------------------------------------------
#  my_spp <- c("Abatia americana", "Araucaria angustifolia")
#  pol_spp <- get_spat_occ(data = bf, species = my_spp,
#                         State = TRUE, Biome = TRUE, intersection = TRUE,
#                         verbose = TRUE)
#  par(mfrow = c(2, 2), mar = c(2, 0, 2, 0))
#  plot(pol_spp$`Abatia americana`$States,
#       main = paste0(names(pol_spp)[[1]], " - States"), mar = NA)
#  plot(pol_spp$`Abatia americana`$Biomes,
#       main = paste0(names(pol_spp)[[1]], " - Biomes"), mar = NA)
#  plot(pol_spp$`Araucaria angustifolia`$States,
#       main = paste0(names(pol_spp)[[2]], " - States"), mar = NA)
#  plot(pol_spp$`Araucaria angustifolia`$Biomes,
#       main = paste0(names(pol_spp)[[2]], " - Biomes"), mar = NA)

## ----IMG05, eval=TRUE, echo = FALSE-------------------------------------------
knitr::include_graphics("vignettes_img/IMG05.png")

## -----------------------------------------------------------------------------
#  data("occurrences")
#  #select Abatia americana and Araucaria angustifolia from the dataset
#  occ <- subset(occurrences, occurrences$species %in% my_spp)
#  head(occ)
#  #>                  species         x         y
#  #> 1 Araucaria angustifolia -51.15749 -29.58290
#  #> 2 Araucaria angustifolia -50.02454 -28.44414
#  #> 3 Araucaria angustifolia -46.77204 -23.45729
#  #> 4 Araucaria angustifolia -48.98117 -25.49632
#  #> 5 Araucaria angustifolia -54.50869 -25.55113
#  #> 6 Araucaria angustifolia -50.92680 -27.01826

## -----------------------------------------------------------------------------
#  occ_check <- filter_florabr(data = bf, occ = occ,
#                      by_State = TRUE, buffer_State = 20,
#                      by_Biome = TRUE, buffer_Biome = 20,
#                      by_Endemism = TRUE, Buffer_Brazil = 20,
#                      State_vect = NULL,
#                      Biome_vect = NULL, BR_vect = NULL,
#                      value = "flag&clean", keep_columns = TRUE,
#                      verbose = FALSE)
#  #> Returning list with flagged and cleaned occurrences

## ---- warning=FALSE, results='hide'-------------------------------------------
#  #Install mapview if necessary and load package
#  if(!require(mapview)){
#      install.packages("geobr")
#  }
#  #Load mapview
#  library(mapview)

## ---- fig.width= 9------------------------------------------------------------
#  #Convert points to spatvector
#  abatia_occ <- subset(occ_check$flagged,
#                       occ_check$flagged$species == "Abatia americana")
#  abatia_occ <- vect(abatia_occ, geom = c("x", "y"))
#  
#  #Iteractive plot
#  mapview(pol_spp$`Abatia americana`$States) +
#    mapview(abatia_occ, zcol = "Inside_State",
#            col.regions = c("red", "green"))

## ----IMG06, eval=TRUE, echo = FALSE, fig.pos="H", out.width="90%"-------------
knitr::include_graphics("vignettes_img/IMG06.png")

## ---- fig.width= 9------------------------------------------------------------
#  #Iteractive plot
#  mapview(pol_spp$`Abatia americana`$Biomes) +
#    mapview(abatia_occ, zcol = "Inside_Biome",
#            col.regions = c("red", "green"))
#  

## ----IMG07, eval=TRUE, echo = FALSE, fig.pos="H", out.width="90%"-------------
knitr::include_graphics("vignettes_img/IMG07.png")

## ---- results='hide'----------------------------------------------------------
#  #Get Brazl Polygon
#  br <- geobr::read_country()

## ---- warning=FALSE-----------------------------------------------------------
#  #Iteractive plot
#  mapview(br) +
#    mapview(abatia_occ, zcol = "Inside_BR",
#            col.regions = c("red", "green"))

## ----IMG08, eval=TRUE, echo = FALSE, fig.pos="H", out.width="90%"-------------
knitr::include_graphics("vignettes_img/IMG08.png")

