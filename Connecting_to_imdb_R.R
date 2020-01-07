############################################ connecting to omdib##################################

devtools::install_github("hrbrmstr/omdbapi")


library(omdbapi)
library(tidyverse)






omdb <- function(Key, Title, Year, Plot, Format){
  baseurl <- "http://www.omdbapi.com/?"
  params <- c("apikey=", "t=", "y=", "plot=", "r=")
  values <- c(Key, Title, Year, Plot, Format)
  param_values <- map2_chr(params, values, str_c)
  args <- str_c(param_values, collapse = "&")
  str_c(baseurl, args)
}


omdb("34b7bacb", "The Avengers", "2012", "short", "xml")



request_Avengers <- omdb("34b7bacb", "Avengers", "2012", "Full", "json")
con <- curl(request_Avengers)
answer_json <- readLines(con)
close(con)
answer_json %>% 
  prettify()



search_by_title("Captain America")

#find_by_id: Retrieve OMDB info by IMDB ID search
#find_by_title: Retrieve OMDB info by title search
#get_actors: Get actors from an omdb object as a vector
#get_countries: Get countries from an omdb object as a vector
#get_directors: Get directors from an omdb object as a vector
#get_genres: Get genres from an omdb object as a vector
#get_writers: Get writers from an omdb object as a vector
#search_by_title: Lightweight OMDB title search
search_by_title("Captain America", year_of_release=2013)
games <- search_by_title("Captain America", type="game")
glimpse(games)
find_by_title("Game of Thrones", type="series", season=1, episode=1)
get_writers(find_by_title("Star Trek: Deep Space Nine", season=4, episode=6))
get_genres(find_by_title("Star Trek: Deep Space Nine", season=5, episode=7))
get_countries(find_by_title("The Blind Swordsman: Zatoichi"))









install.packages("Rserve")
library(Rserve)
Rserve()


