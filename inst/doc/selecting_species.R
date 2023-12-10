## ---- include = FALSE---------------------------------------------------------
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
#  #> Loading version 393.389

## -----------------------------------------------------------------------------
#  #Get available options to filter by lifeForm
#  get_attributes(data = bf,
#                 attribute = "lifeForm",
#                 Kingdom = "Plantae")
#  #>               lifeForm            Forma_de_vida
#  #> 1      Aquatic-Benthos          Aquatica-Bentos
#  #> 2      Aquatic-Neuston         Aquatica-Neuston
#  #> 3     Aquatic-Plankton        Aquatica-Plancton
#  #> 4                Shrub                  Arbusto
#  #> 5                 Tree                   Arvore
#  #> 6               Bamboo                    Bambu
#  #> 7              Cushion                    Coxim
#  #> 8             Dendroid                Dendroide
#  #> 9              Unknown             Desconhecida
#  #> 10          Dracaenoid               Dracenoide
#  #> 13                Herb                     Erva
#  #> 14          Flabellate                Flabelado
#  #> 15             Foliose                  Folhosa
#  #> 16 Liana/scandent/vine Liana/voluvel/trepadeira
#  #> 19           Palm_tree                 Palmeira
#  #> 21             Pendent                 Pendente
#  #> 23            Subshrub               Subarbusto
#  #> 24           Succulent                Suculenta
#  #> 25            Thallose                   Talosa
#  #> 26                 Mat                   Tapete
#  #> 27                Weft                    Trama
#  #> 28                Tuft                     Tufo
#  
#  #Get available options to filter by  Biome
#  get_attributes(data = bf,
#                 attribute = "Biome",
#                 Kingdom = "Plantae")
#  #>                 Biome                Bioma
#  #> 1              Amazon             Amazonia
#  #> 2     Atlantic_Forest       Mata_Atlantica
#  #> 3            Caatinga             Caatinga
#  #> 4             Cerrado              Cerrado
#  #> 5               Pampa                Pampa
#  #> 6            Pantanal             Pantanal
#  #> 7 Not_found_in_Brazil Nao_ocorre_no_Brasil
#  
#  #Get available options to filter by VegetationType
#  get_attributes(data = bf,
#                 attribute = "vegetationType",
#                 Kingdom = "Plantae")
#  #>                     VegetationType                           TipoVegetacao
#  #> 1                   Anthropic_Area                          Area Antropica
#  #> 2                         Caatinga                Caatinga (stricto sensu)
#  #> 3            Amazonian_Campinarana                             Campinarana
#  #> 4          High_Altitude_Grassland                       Campo de Altitude
#  #> 5                    Flooded_Field                         Campo de Varzea
#  #> 6                        Grassland                             Campo Limpo
#  #> 7             Highland_Rocky_Field                          Campo rupestre
#  #> 8                         Carrasco                                Carrasco
#  #> 9                          Cerrado                    Cerrado (lato sensu)
#  #> 10                  Gallery_Forest              Floresta Ciliar ou Galeria
#  #> 11          Inundated_Forest_Igapo                       Floresta de Igapo
#  #> 12              Terra_Firme_Forest                 Floresta de Terra Firme
#  #> 13                Inundated_Forest                      Floresta de Varzea
#  #> 14    Seasonallly_Deciduous_Forest            Floresta Estacional Decidual
#  #> 15       Seasonal_Evergreen_Forest         Floresta Estacional Perenifolia
#  #> 16 Seasonally_Semideciduous_Forest        Floresta Estacional Semidecidual
#  #> 17                      Rainforest Floresta Ombrofila (= Floresta Pluvial)
#  #> 18      Mixed_Ombrophyllous_Forest                Floresta Ombrofila Mista
#  #> 19                        Mangrove                               Manguezal
#  #> 20                      Palm_Grove                               Palmeiral
#  #> 21                        Restinga                                Restinga
#  #> 22               Amazonian_Savanna                        Savana Amazonica
#  #> 23              Aquatic_Vegetation                      Vegetacao Aquatica
#  #> 24         Rock_outcrop_Vegetation   Vegetacao Sobre Afloramentos Rochosos
#  #> 25             Not_found_in_Brazil                    Nao ocorre no Brasil

## -----------------------------------------------------------------------------
#  af_spp <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        Kingdom = "Plantae", Group = "All", Subgroup = "All",
#                        Family = "All", Genus = "All",
#                        LifeForm = "Tree", #Specify tree species
#                        filter_LifeForm = "in",
#                        Habitat = "All", filter_Habitat = "in",
#                        Biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_Biome = "in", #In Atlantic Forest
#                        State = "All", filter_State = "in",
#                        VegetationType = "All", filter_Vegetation = "in",
#                        Endemism = "Endemic", #Only endemics to Brazil
#                        Origin = "Native", #Only natives
#                        TaxonomicStatus = "Accepted",
#                        NomenclaturalStatus = "All")
#  nrow(af_spp)
#  #> [1] 2346

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
#                        Kingdom = "Plantae", Group = "All", Subgroup = "All",
#                        Family = "All", Genus = "All",
#                        LifeForm = "Tree", #Specify tree species
#                        filter_LifeForm = "in",
#                        Habitat = "All", filter_Habitat = "in",
#                        Biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_Biome = "only", #ONLY in Atlantic Forest
#                        State = "All", filter_State = "in",
#                        VegetationType = "All", filter_Vegetation = "in",
#                        Endemism = "Endemic", #Only endemics to Brazil
#                        Origin = "Native", #Only natives
#                        TaxonomicStatus = "Accepted",
#                        NomenclaturalStatus = "All")
#  nrow(only_af_spp)
#  #> [1] 1848
#  unique(only_af_spp$Biome)
#  #> [1] "Atlantic_Forest"

## -----------------------------------------------------------------------------
#  south_af_spp <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        Kingdom = "Plantae", Group = "All", Subgroup = "All",
#                        Family = "All", Genus = "All",
#                        LifeForm = "Tree", #Specify tree species
#                        filter_LifeForm = "in",
#                        Habitat = "All", filter_Habitat = "in",
#                        Biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_Biome = "only", #Only in Atlantic Forest
#                        State = c("PR", "SC", "RS"), #States - Use the acronynms
#                        filter_State = "in", #IN at least one of these states
#                        VegetationType = "All", filter_Vegetation = "in",
#                        Endemism = "Endemic", #Only endemics to Brazil
#                        Origin = "Native", #Only natives
#                        TaxonomicStatus = "Accepted",
#                        NomenclaturalStatus = "All")
#  nrow(south_af_spp)
#  #> [1] 370
#  
#  #First 10 unique values of states in the filtered dataset
#  unique(south_af_spp$States)[1:10]
#  #>  [1] "BA;ES;PR;RJ;SC;SP"               "AL;BA;CE;ES;MA;MG;PB;PE;PR;RJ;SE;SP"
#  #>  [3] "PR;RS;SC"                        "BA;CE;ES;MA;MG;PE;PR;RJ;SP"
#  #>  [5] "MG;PR;RJ;SC;SP"                  "MG;PR;RJ;RS;SC;SP"
#  #>  [7] "BA;ES;MG;PR;RJ;SC;SP"            "MG;PR;RS;SC;SP"
#  #>  [9] "PR;RJ;RS;SC;SP"                  "ES;MG;PR;RJ;RS;SC;SP"

## -----------------------------------------------------------------------------
#  south_af_spp2 <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        Kingdom = "Plantae", Group = "All", Subgroup = "All",
#                        Family = "All", Genus = "All",
#                        LifeForm = "Tree", #Specify tree species
#                        filter_LifeForm = "in",
#                        Habitat = "All", filter_Habitat = "in",
#                        Biome = "Atlantic_Forest", #Occurring in the At. Forest
#                        filter_Biome = "only", #Only in Atlantic Forest
#                        State = c("PR", "SC", "RS"), #States - Use the acronynms
#                        filter_State = "and", #PR and SC and RS
#                        VegetationType = "All", filter_Vegetation = "in",
#                        Endemism = "Endemic", #Only endemics to Brazil
#                        Origin = "Native", #Only natives
#                        TaxonomicStatus = "Accepted",
#                        NomenclaturalStatus = "All")
#  nrow(south_af_spp2)
#  #> [1] 29
#  
#  #All unique states in the filtered dataset
#  unique(south_af_spp2$States)
#  #> [1] "PR;RS;SC"       "MG;PR;RS;SC;SP" "PR;RS;SC;SP"    "ES;PR;RS;SC;SP"
#  #> [5] "MG;PR;RS;SC"

## -----------------------------------------------------------------------------
#  south_af_spp3 <- select_species(data = bf,
#                        include_subspecies = FALSE, include_variety = FALSE,
#                        Kingdom = "Plantae", Group = "All", Subgroup = "All",
#                        Family = "All", Genus = "All",
#                        LifeForm = "Tree", #Specify tree species
#                        filter_LifeForm = "in",
#                        Habitat = "All", filter_Habitat = "in",
#                        Biome = "Atlantic_Forest", #Occuring in the At. Forest
#                        filter_Biome = "only", #Only in Atlantic Forest
#                        State = c("PR", "SC", "RS"), #States - Use the acronynms
#                        filter_State = "only", #PR and SC and RS, no other else
#                        VegetationType = "All", filter_Vegetation = "in",
#                        Endemism = "Endemic", #Only endemics to Brazil
#                        Origin = "Native", #Only natives
#                        TaxonomicStatus = "Accepted",
#                        NomenclaturalStatus = "All")
#  nrow(south_af_spp3)
#  #> [1] 13
#  
#  #The unique state in the filtered dataset
#  unique(south_af_spp3$States)
#  #> [1] "PR;RS;SC"

## -----------------------------------------------------------------------------
#  complete_names <- c("Araucaria brasiliana var. ridolfiana (Pi.Savi) Gordon",
#                      "Solanum restingae S.Knapp",
#                      "Butia cattarinensis Noblick & Lorenzi",
#                      "Homo sapiens")
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
#                               Kingdom = "Plantae")
#  checked_names
#  #>             input_name          Spelling       Suggested_name Distance
#  #> 1 Araucaria brasiliana           Correct Araucaria brasiliana        0
#  #> 2 Araucaria brasiliana           Correct Araucaria brasiliana        0
#  #> 3    Solanum restingae           Correct    Solanum restingae        0
#  #> 4  Butia cattarinensis Probably_incorrect   Butia catarinensis        1
#  #> 5         Homo sapiens         Incorrect                 <NA>       NA
#  #>   taxonomicStatus nomenclaturalStatus           acceptedName        family
#  #> 1         Synonym                <NA> Araucaria angustifolia Araucariaceae
#  #> 2         Synonym        Illegitimate Araucaria angustifolia Araucariaceae
#  #> 3        Accepted             Correct      Solanum restingae    Solanaceae
#  #> 4        Accepted                <NA>     Butia catarinensis     Arecaceae
#  #> 5            <NA>                <NA>                   <NA>          <NA>

## -----------------------------------------------------------------------------
#  #Get only accepted names
#  accepted_names <- unique(checked_names$acceptedName)
#  accepted_names <- na.omit(accepted_names) #Remove NA
#  
#  #Subset species
#  my_sp <- subset_species(data = bf, species = accepted_names,
#                        include_subspecies = FALSE,
#                        include_variety = FALSE,
#                        Kingdom = "Plantae")
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
#  #>       Origin    Endemism taxonomicStatus nomenclaturalStatus
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
#                        Kingdom = "Plantae")
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
#  #>       Origin    Endemism taxonomicStatus nomenclaturalStatus
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

