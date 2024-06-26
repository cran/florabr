% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_synonym.R
\name{get_synonym}
\alias{get_synonym}
\title{Retrieve synonyms for species}
\usage{
get_synonym(data, species)
}
\arguments{
\item{data}{(data.frame) the data.frame imported with the
\code{\link{load_florabr}} function}

\item{species}{(character) names of the species}
}
\value{
A data.frame containing unique synonyms of the specified species
along with relevant information on taxonomic and nomenclatural statuses.
}
\description{
Retrieve synonyms for species
}
\examples{
data("bf_data") #Load Flora e Funga do Brasil data
#Species to extract synonyms
spp <- c("Araucaria angustifolia", "Adesmia paranensis")
spp_synonyms <- get_synonym(data = bf_data, species = spp)
spp_synonyms

}
\references{
Flora e Funga do Brasil. Jardim Botânico do Rio de Janeiro. Available at:
http://floradobrasil.jbrj.gov.br/
}
