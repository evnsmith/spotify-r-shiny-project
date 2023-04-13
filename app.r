library(shiny)
library(spotifyr)
library(tidyverse)
setwd("C:/Users/blalalalalal/working/directory/")

source("mood_parameters.R")

# Set your Spotify API credentials
Sys.setenv(SPOTIFY_CLIENT_ID = "Client_ID")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "Client_Secret")

ui <- fluidPage(
  titlePanel("Spotify Music Recommendations"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("mood", "Select a mood:", choices = c("workout", "party", "chill", "study", "cooking", "commuting", "relaxing", "meditating", "playing video games", "sad")),
      selectInput("genre1", "Select a genre (Required:", choices = c("alternative", "blues", "classical", "country", "dance", "electronic", "folk", "hip-hop", "indie", "jazz", "metal", "pop", "soul", "reggae", "rock")),
      selectInput("genre2", "Select a genre (optional):", choices = c("alternative", "blues", "classical", "country", "dance", "electronic", "folk", "hip-hop", "indie", "jazz", "metal", "pop", "soul", "reggae", "rock")),
      selectInput("genre3", "Select a genre (optional):", choices = c("alternative", "blues", "classical", "country", "dance", "electronic", "folk", "hip-hop", "indie", "jazz", "metal", "pop", "soul", "reggae", "rock")),
      actionButton("submit_button", "Get Recommendations")
    ),
    
    mainPanel(
      h4("Recommended tracks:"),
      textOutput("recommendations")
    )
  )
)

server <- function(input, output) {
  track_names <- reactiveVal("") #no clue what this does 
  
  observeEvent(input$submit_button, {
    access_token <- get_spotify_access_token()
    
    # fix this, should have three genres
    selected_genres <- c(input$genre1, input$genre2, input$genre3)
    print(selected_genres)
    #mood params
    params <- mood_parameters(input$mood)
    
    # Get recommendations
    tracks <- get_recommendations(
      seed_genres = selected_genres,
      min_danceability = params$min_danceability,
      max_danceability = params$max_danceability,
      
      min_energy = params$min_energy,
      max_energy = params$max_energy,
      min_valence = params$min_valence,
      
      max_valence = params$max_valence,
      limit = 20
    )
    

    track_names(paste(tracks$name))
    
  })
  

  output$recommendations <- renderText({
    track_names()
  })
}

shinyApp(ui = ui, server = server)


