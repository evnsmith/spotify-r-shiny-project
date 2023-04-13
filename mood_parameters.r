library(spotifyr)
rm(list=ls())
mood_parameters <- function(mood) {
  params <- list(
    min_danceability = 0.0,
    max_danceability = 1.0,
    min_energy = 0.0,
    max_energy = 1.0,
    min_instrumentalness = 0.0,
    max_instrumentalness = 1.0,
    min_popularity = 0.0,
    max_popularity = 1.0,
    min_speechiness = 0.0,
    max_speechiness = 1.0,
    min_tempo = 0.0,
    max_tempo = 1.0,
    min_valence = 0.0,
    max_valence = 1.0
  )
  
  if (mood == "workout") {
    params$min_danceability <- 0.7
    params$max_danceability <- 1.0
    
    params$min_energy <- 0.8
    params$max_energy <- 1.0
    
    params$min_valence <- 0.5
    params$max_valence <- 1.0
    
  } else if (mood == "party") {
    params$min_danceability <- 0.7
    params$max_danceability <- 1.0
    
    params$min_energy <- 0.7
    params$max_energy <- 1.0
    
    params$min_valence <- 0.6
    params$max_valence <- 1.0
    
  } else if (mood == "chill") {
    params$min_danceability <- 0.0
    params$max_danceability <- 0.5
    
    params$min_energy <- 0.0
    params$max_energy <- 0.5
    
    params$min_valence <- 0.0
    params$max_valence <- 0.6
    

    
  } else if (mood == "study") {
    
    params$min_danceability <- 0.4
    params$max_danceability <- 0.8
    
    params$min_energy <- 0.4
    params$max_energy <- 0.8
   
    params$min_valence <- 0.4
    params$max_valence <- 0.8

    params$min_instrumentalness <- 0.5
    params$max_instrumentalness <- 1.0
    
  } else if (mood == "commuting") {
    params$min_danceability <- 0.2
    params$max_danceability <- 0.7
    
    params$min_energy <- 0.3
    params$max_energy <- 0.8
    
    params$min_valence <- 0.2
    params$max_valence <- 0.8
    
  } else if (mood == "relaxing") {
    params$min_danceability <- 0.0
    params$max_danceability <- 0.5
    
    params$min_energy <- 0.0
    params$max_energy <- 0.4
    
    params$min_valence <- 0.0
    params$max_valence <- 0.6
    
  } else if (mood == "meditating") {
    params$min_danceability <- 0.0
    params$max_danceability <- 0.3
    
    params$min_energy <- 0.0
    params$max_energy <- 0.3
    
    params$min_valence <- 0.0
    params$max_valence <- 0.4
  
    params$min_instrumentalness <- 0.6
    params$max_instrumentalness <- 1.0
    
  } else if (mood == "playing video games") {
    params$min_danceability <- 0.2
    params$max_danceability <- 0.6
    
    params$min_energy <- 0.2
    params$max_energy <- 0.7
    
    params$min_valence <- 0.2
    params$max_valence <- 0.7
    
  } else if (mood == "sad") {
    params$min_danceability <- 0.0
    params$max_danceability <- 0.4
    
    params$min_energy <- 0.0
    params$max_energy <- 0.4
    
    params$min_valence <- 0.0
    params$max_valence <- 0.4
  }
  
  return(params)
} 

