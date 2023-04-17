library(shiny)
library(spotifyr)
library(tidyverse)

setwd("C:/Users/evans/OneDrive/Desktop/spotify-r-shiny-project/")

source("mood_parameters.R")

Sys.setenv(SPOTIFY_CLIENT_ID = "815f62f7621945dd96d787d9f3ecd145")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "667b464bc1f84a9f933bd3db19e3cfc2")

access_token <- get_spotify_access_token()

ui <- fluidPage(
  titlePanel("Spotify Music Recommendations"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("mood", "Select a mood:", 
                  choices = c("workout", "party", "chill", "study", "cooking", "commuting", "relaxing", "meditating", "playing video games", "sad")),
      selectInput("genre1", "Select a genre:", 
                  choices = c("alternative", "blues", "classical", "country", "dance", "electronic", "folk", "hip-hop", "indie", "jazz", "metal", "pop", "soul", "reggae", "rock")),
      selectInput("genre2", "Select a genre:", 
                  choices = c("alternative", "blues", "classical", "country", "dance", "electronic", "folk", "hip-hop", "indie", "jazz", "metal", "pop", "soul", "reggae", "rock")),
      selectInput("genre3", "Select a genre:", 
                  choices = c("alternative", "blues", "classical", "country", "dance", "electronic", "folk", "hip-hop", "indie", "jazz", "metal", "pop", "soul", "reggae", "rock")),
      actionButton("submit_button", "Get Recommendations")
    ),
    
    mainPanel(
      h4("Recommended tracks:"),
      htmlOutput("recommendations")
    )
  )
)

server <- function(input, output) {
  track_names <- reactiveVal("")
  
  Sys.setenv(SPOTIFY_CLIENT_ID = "815f62f7621945dd96d787d9f3ecd145")
  Sys.setenv(SPOTIFY_CLIENT_SECRET = "667b464bc1f84a9f933bd3db19e3cfc2")
  
  observeEvent(input$submit_button, {
    access_token <- get_spotify_access_token()
    
    selected_genres <- c(input$genre1, input$genre2, input$genre3)
    print(selected_genres)
    
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
    
    # Combine track and artist names
    track_names(paste0(tracks$name, collapse = "<br>"))
  })
  
  output$recommendations <- renderUI({
    HTML(track_names())
  })
}

shinyApp(ui = ui, server = server)


