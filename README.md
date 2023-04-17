# Spotify Music Recommendations

This is a simple Spotify music recommendations app built using R, Shiny, and the Spotify API. The app takes user input for moods and genres, then generates a list of recommended tracks based on the selected preferences

![Screenshot of the app](Screenshot 2023-04-17 143412.png)
## Features

- Selection of moods and genres for personalized music recommendations
- Mood parameters to fine-tune recommendations based on energy, danceability, valence
- Integration with the Spotify API for real-time recommendations

## Usage

1. Install the necessary R packages: `shiny`, `spotifyr`, and `tidyverse`
2. Set your Spotify API credentials by replacing the placeholders for `SPOTIFY_CLIENT_ID` and `SPOTIFY_CLIENT_SECRET`
3. Run the Shiny app

## Mood Parameter & Genre Selection

The app allows users to select a mood and up to three genres to generate recommendations. The mood parameter influences the energy, danceability, valence, and other attributes of the recommended tracks. This is achieved by modifying the parameters passed to the `get_recommendation` function. The genre selection is used as a seed to filter recommendations by the user's preferred music styles.

## Improvements

- UI Enhancements
- Additional Parameters
- Artist & Track Name Alignment

## Issues Faced

One of the issues faced was getting the artist name and the track name to align together. Improvement needs to be made to correctly allign these together. 

## Dependencies

- R
- Shiny
- spotifyr
- tidyverse

