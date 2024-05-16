## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE,
  warning = FALSE
)

## -----------------------------------------------------------------------------
#  library(florabr)
#  #Folder where you stored the data with the function get_florabr()
#  #Load data
#  bf <- load_florabr(data_dir = my_dir,
#                     data_version = "Latest_available",
#                     type = "short") #short version
#  #> Loading version 393.401

## -----------------------------------------------------------------------------
#  #Get available options to filter by lifeForm
#  get_attributes(data = bf,
#                 attribute = "lifeForm",
#                 kingdom = "Plantae")
#  #>               lifeForm
#  #> 1      Aquatic-Benthos
#  #> 2      Aquatic-Neuston
#  #> 3     Aquatic-Plankton
#  #> 4                Shrub
#  #> 5                 Tree
#  #> 6               Bamboo
#  #> 7              Cushion
#  #> 8             Dendroid
#  #> 9              Unknown
#  #> 10          Dracaenoid
#  #> 13                Herb
#  #> 14          Flabellate
#  #> 15             Foliose
#  #> 16 Liana/scandent/vine
#  #> 19           Palm_tree
#  #> 21             Pendent
#  #> 23            Subshrub
#  #> 24           Succulent
#  #> 25            Thallose
#  #> 26                 Mat
#  #> 27                Weft
#  #> 28                Tuft
#  
#  #Get available options to filter by  Biome
#  get_attributes(data = bf,
#                 attribute = "Biome",
#                 kingdom = "Plantae")
#  #>                 biome
#  #> 1              Amazon
#  #> 2     Atlantic_Forest
#  #> 3            Caatinga
#  #> 4             Cerrado
#  #> 5               Pampa
#  #> 6            Pantanal
#  #> 7 Not_found_in_brazil
#  
#  #Get available options to filter by vegetation
#  get_attributes(data = bf,
#                 attribute = "vegetationType",
#                 kingdom = "Plantae")
#  #>                         vegetation
#  #> 1                   Anthropic_Area
#  #> 2                         Caatinga
#  #> 3            Amazonian_Campinarana
#  #> 4          High_Altitude_Grassland
#  #> 5                    Flooded_Field
#  #> 6                        Grassland
#  #> 7             Highland_Rocky_Field
#  #> 8                         Carrasco
#  #> 9                          Cerrado
#  #> 10                  Gallery_Forest
#  #> 11          Inundated_Forest_Igapo
#  #> 12              Terra_Firme_Forest
#  #> 13                Inundated_Forest
#  #> 14    Seasonallly_Deciduous_Forest
#  #> 15       Seasonal_Evergreen_Forest
#  #> 16 Seasonally_Semideciduous_Forest
#  #> 17                      Rainforest
#  #> 18      Mixed_Ombrophyllous_Forest
#  #> 19                        Mangrove
#  #> 20                      Palm_Grove
#  #> 21                        Restinga
#  #> 22               Amazonian_Savanna
#  #> 23              Aquatic_vegetation
#  #> 24         Rock_outcrop_vegetation
#  #> 25             Not_found_in_Brazil

## -----------------------------------------------------------------------------
#  af_spp <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        kingdom = "Plantae", group = "All", subgroup = "All",
#                        family = "All", genus = "All",
#                        lifeForm = "Tree", #Specify tree species
#                        filter_lifeForm = "in",
#                        habitat = "All", filter_habitat = "in",
#                        biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_biome = "in", #In Atlantic Forest
#                        state = "All", filter_state = "in",
#                        vegetation = "All", filter_vegetation = "in",
#                        endemism = "Endemic", #Only endemics to Brazil
#                        origin = "Native", #Only natives
#                        taxonomicStatus = "Accepted",
#                        nomenclaturalStatus = "All")
#  nrow(af_spp)
#  #> [1] 2372

## -----------------------------------------------------------------------------
#  #First 7 unique values of biomes in the filtered dataset
#  unique(af_spp$Biome)[1:7]
#  #> [1] "Atlantic_Forest"
#  #> [2] "Atlantic_Forest;Cerrado"
#  #> [3] "Atlantic_Forest;Caatinga"
#  #> [4] "Amazon;Atlantic_Forest;Caatinga;Cerrado"
#  #> [5] "Amazon;Atlantic_Forest;Cerrado"
#  #> [6] "Atlantic_Forest;Caatinga;Cerrado"
#  #> [7] "Amazon;Atlantic_Forest"

## -----------------------------------------------------------------------------
#  only_af_spp <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        kingdom = "Plantae", group = "All", subgroup = "All",
#                        family = "All", genus = "All",
#                        lifeForm = "Tree", #Specify tree species
#                        filter_lifeForm = "in",
#                        habitat = "All", filter_habitat = "in",
#                        biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_biome = "only", #ONLY in Atlantic Forest
#                        state = "All", filter_state = "in",
#                        vegetation = "All", filter_vegetation = "in",
#                        endemism = "Endemic", #Only endemics to Brazil
#                        origin = "Native", #Only natives
#                        taxonomicStatus = "Accepted",
#                        nomenclaturalStatus = "All")
#  nrow(only_af_spp)
#  #> [1] 1858
#  unique(only_af_spp$biome)
#  #> [1] "Atlantic_Forest"

## -----------------------------------------------------------------------------
#  south_af_spp <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        kingdom = "Plantae", group = "All", subgroup = "All",
#                        family = "All", genus = "All",
#                        lifeForm = "Tree", #Specify tree species
#                        filter_lifeForm = "in",
#                        habitat = "All", filter_habitat = "in",
#                        biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_biome = "only", #Only in Atlantic Forest
#                        state = c("PR", "SC", "RS"), #states - Use the acronynms
#                        filter_state = "in", #IN at least one of these states
#                        vegetation = "All", filter_vegetation = "in",
#                        endemism = "Endemic", #Only endemics to Brazil
#                        origin = "Native", #Only natives
#                        taxonomicStatus = "Accepted",
#                        nomenclaturalStatus = "All")
#  nrow(south_af_spp)
#  #> [1] 372
#  
#  #First 10 unique values of states in the filtered dataset
#  unique(south_af_spp$states)[1:10]
#  #>  [1] "BA;ES;PR;RJ;SC;SP"               "AL;BA;CE;ES;MA;MG;PB;PE;PR;RJ;SE;SP"
#  #>  [3] "PR;RS;SC"                        "BA;CE;ES;MA;MG;PE;PR;RJ;SP"
#  #>  [5] "MG;PR;RJ;SC;SP"                  "MG;PR;RJ;RS;SC;SP"
#  #>  [7] "BA;ES;MG;PR;RJ;SC;SP"            "MG;PR;RS;SC;SP"
#  #>  [9] "PR;RJ;RS;SC;SP"                  "ES;MG;PR;RJ;RS;SC;SP"

## -----------------------------------------------------------------------------
#  south_af_spp2 <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        kingdom = "Plantae", group = "All", subgroup = "All",
#                        family = "All", genus = "All",
#                        lifeForm = "Tree", #Specify tree species
#                        filter_lifeForm = "in",
#                        habitat = "All", filter_habitat = "in",
#                        biome = "Atlantic_Forest", #Occurring in the At. Forest
#                        filter_biome = "only", #Only in Atlantic Forest
#                        state = c("PR", "SC", "RS"), #states - Use the acronynms
#                        filter_state = "and", #PR and SC and RS
#                        vegetation = "All", filter_vegetation = "in",
#                        endemism = "Endemic", #Only endemics to Brazil
#                        origin = "Native", #Only natives
#                        taxonomicStatus = "Accepted",
#                        nomenclaturalStatus = "All")
#  nrow(south_af_spp2)
#  #> [1] 29
#  
#  #All unique states in the filtered dataset
#  unique(south_af_spp2$states)
#  #> [1] "PR;RS;SC"       "MG;PR;RS;SC;SP" "PR;RS;SC;SP"    "ES;PR;RS;SC;SP"
#  #> [5] "MG;PR;RS;SC"

## -----------------------------------------------------------------------------
#  south_af_spp3 <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        kingdom = "Plantae", group = "All", subgroup = "All",
#                        family = "All", genus = "All",
#                        lifeForm = "Tree", #Specify tree species
#                        filter_lifeForm = "in",
#                        habitat = "All", filter_habitat = "in",
#                        biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_biome = "only", #Only in Atlantic Forest
#                        state = c("PR", "SC", "RS"), #states - Use the acronynms
#                        filter_state = "only", #PR and SC and RS, no other else
#                        vegetation = "All", filter_vegetation = "in",
#                        endemism = "Endemic", #Only endemics to Brazil
#                        origin = "Native", #Only natives
#                        taxonomicStatus = "Accepted",
#                        nomenclaturalStatus = "All")
#  nrow(south_af_spp3)
#  #> [1] 13
#  
#  #The unique state in the filtered dataset
#  unique(south_af_spp3$states)
#  #> [1] "PR;RS;SC"

## -----------------------------------------------------------------------------
#  complete_names <- c("Araucaria brasiliana var. ridolfiana (Pi.Savi) Gordon",
#                      " Solanum restingae  S.Knapp",
#                      "Butia cattarinensis  Noblick & Lorenzi   ",
#                      "Homo   sapiens")
#  #Human specie was used just as an example that will be used to illustrate the
#  #next function
#  binomial_names <- get_binomial(species_names = complete_names)
#  binomial_names
#  #> [1] "Araucaria brasiliana" "Solanum restingae"    "Butia cattarinensis"
#  #> [4] "Homo sapiens"

## -----------------------------------------------------------------------------
#  #Create example
#  checked_names <- check_names(data = bf,
#                               species = binomial_names,
#                               max_distance = 0.1,
#                               kingdom = "Plantae")
#  checked_names
#  #             input_name           Spelling       Suggested_name Distance taxonomicStatus nomenclaturalStatus           acceptedName        family
#  # 1 Araucaria brasiliana            Correct Araucaria brasiliana        0         Synonym                <NA> Araucaria angustifolia Araucariaceae
#  # 2 Araucaria brasiliana            Correct Araucaria brasiliana        0         Synonym        Illegitimate Araucaria angustifolia Araucariaceae
#  # 3    Solanum restingae            Correct    Solanum restingae        0        Accepted             Correct      Solanum restingae    Solanaceae
#  # 4  Butia cattarinensis Probably_incorrect   Butia catarinensis        1        Accepted                <NA>     Butia catarinensis     Arecaceae
#  # 5         Homo sapiens          Not_found                 <NA>       NA            <NA>                <NA>                   <NA>          <NA>

## -----------------------------------------------------------------------------
#  #Get only accepted names
#  accepted_names <- unique(checked_names$acceptedName)
#  accepted_names <- na.omit(accepted_names) #Remove NA
#  
#  #Subset species
#  my_sp <- subset_species(data = bf, species = accepted_names,
#                        include_subspecies = FALSE,
#                        include_variety = FALSE,
#                        kingdom = "Plantae")
#  my_sp
#  #>                      species                          scientificName
#  #> 11785      Solanum restingae               Solanum restingae S.Knapp
#  #> 26790 Araucaria angustifolia Araucaria angustifolia (Bertol.) Kuntze
#  #> 99881     Butia catarinensis    Butia catarinensis Noblick & Lorenzi
#  #>       acceptedName kingdom       Group Subgroup        family     genus
#  #> 11785         <NA> Plantae Angiosperms     <NA>    Solanaceae   Solanum
#  #> 26790         <NA> Plantae Gymnosperms     <NA> Araucariaceae Araucaria
#  #> 99881         <NA> Plantae Angiosperms     <NA>     Arecaceae     Butia
#  #>        lifeForm     habitat                 Biome            States
#  #> 11785     Shrub Terrestrial       Atlantic_Forest                BA
#  #> 26790      Tree Terrestrial Atlantic_Forest;Pampa MG;PR;RJ;RS;SC;SP
#  #> 99881 Palm_tree Terrestrial Atlantic_Forest;Pampa             RS;SC
#  #>       vegetationType
#  #> 11785 Restinga
#  #> 26790 High_Altitude_Grassland;Mixed_Ombrophyllous_Forest;
#  #>       Seasonally_Semideciduous_Forest
#  #> 99881 Restinga
#  #>       origin    endemism taxonomicStatus nomenclaturalStatus
#  #> 11785 Native     Endemic        Accepted             Correct
#  #> 26790 Native Non-endemic        Accepted             Correct
#  #> 99881 Native     Endemic        Accepted                <NA>
#  #>       vernacularName
#  #> 11785 <NA>
#  #> 26790 araucaria, pinheiro-do-parana, curi, pinheiro-brasileiro,
#  #> pinho-do-parana
#  #> 99881 <NA>
#  #>       taxonRank
#  #> 11785   Species
#  #> 26790   Species
#  #> 99881   Species

## -----------------------------------------------------------------------------
#  my_sp2 <- subset_species(data = bf, species = accepted_names,
#                        include_subspecies = TRUE,
#                        include_variety = TRUE,
#                        kingdom = "Plantae")
#  my_sp2[1:5,]
#  #>                      species                            scientificName
#  #> 11785      Solanum restingae                 Solanum restingae S.Knapp
#  #> 26790 Araucaria angustifolia   Araucaria angustifolia (Bertol.) Kuntze
#  #> 35204 Araucaria angustifolia    Araucaria angustifolia var. alba Reitz
#  #> 35205 Araucaria angustifolia  Araucaria angustifolia var. caiova Reitz
#  #> 35206 Araucaria angustifolia Araucaria angustifolia var. caiuva Mattos
#  #>                 acceptedName kingdom       Group Subgroup        family
#  #> 11785                   <NA> Plantae Angiosperms     <NA>    Solanaceae
#  #> 26790                   <NA> Plantae Gymnosperms     <NA> Araucariaceae
#  #> 35204 Araucaria angustifolia Plantae Gymnosperms     <NA> Araucariaceae
#  #> 35205 Araucaria angustifolia Plantae Gymnosperms     <NA> Araucariaceae
#  #> 35206 Araucaria angustifolia Plantae Gymnosperms     <NA> Araucariaceae
#  #>           genus lifeForm     habitat                 Biome            States
#  #> 11785   Solanum    Shrub Terrestrial       Atlantic_Forest                BA
#  #> 26790 Araucaria     Tree Terrestrial Atlantic_Forest;Pampa MG;PR;RJ;RS;SC;SP
#  #> 35204 Araucaria
#  #> 35205 Araucaria
#  #> 35206 Araucaria
#  #>       vegetationType
#  #> 11785 Restinga
#  #> 26790 High_Altitude_Grassland;Mixed_Ombrophyllous_Forest;
#  #>       Seasonally_Semideciduous_Forest
#  #> 35204
#  #> 35205
#  #> 35206
#  #>       origin    endemism taxonomicStatus nomenclaturalStatus
#  #> 11785 Native     Endemic        Accepted             Correct
#  #> 26790 Native Non-endemic        Accepted             Correct
#  #> 35204   <NA>        <NA>         Synonym                <NA>
#  #> 35205   <NA>        <NA>         Synonym                <NA>
#  #> 35206   <NA>        <NA>         Synonym                <NA>
#  #>       vernacularName
#  #> 11785 <NA>
#  #> 26790 araucaria, pinheiro-do-parana, curi, pinheiro-brasileiro,
#  #> pinho-do-parana
#  #> 35204 <NA>
#  #> 35205 <NA>
#  #> 35206 <NA>
#  #>       taxonRank
#  #> 11785   Species
#  #> 26790   Species
#  #> 35204   Variety
#  #> 35205   Variety
#  #> 35206   Variety

## -----------------------------------------------------------------------------
#  spp <- c("Araucaria angustifolia", "Adesmia paranensis")
#  spp_syn <- get_synonym(data = bf, species = spp)
#  spp_syn
#  #>                       synonym           acceptedName taxonomicStatus      nomenclaturalStatus
#  #> 35323    Araucaria brasiliana Araucaria angustifolia         Synonym                     <NA>
#  #> 35325  Araucaria brasiliensis Araucaria angustifolia         Synonym                     <NA>
#  #> 35327        Araucaria dioica Araucaria angustifolia         Synonym                     <NA>
#  #> 35328       Araucaria elegans Araucaria angustifolia         Synonym                     <NA>
#  #> 35329    Araucaria ridolfiana Araucaria angustifolia         Synonym                     <NA>
#  #> 35330       Araucaria saviana Araucaria angustifolia         Synonym                     <NA>
#  #> 35332   Columbea angustifolia Araucaria angustifolia         Synonym Legitimate_but_incorrect
#  #> 35333     Columbea brasiliana Araucaria angustifolia         Synonym Legitimate_but_incorrect
#  #> 60644            Pinus dioica Araucaria angustifolia         Synonym                     <NA>
#  #> 141020     Araucaria bibbiani Araucaria angustifolia         Synonym                     <NA>
#  #> 141021   Araucaria lindleyana Araucaria angustifolia         Synonym                     <NA>
#  #> 141041   Araucaria brasiliana Araucaria angustifolia         Synonym             Illegitimate
#  #> 85308    Adesmia psoraleoides     Adesmia paranensis         Synonym Legitimate_but_incorrect

