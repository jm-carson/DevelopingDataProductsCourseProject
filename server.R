#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(ggmap)

setwd("Q:/Business Intelligence/Projects/Territory Analysis/01_NY-NJ Territory Analysis/R")
Terr_Data <- read.csv("Customer Location 9-11-17 Including Delta Calls and Equipment.csv", header = TRUE)

Office <- sort(unique(Terr_Data$AloOffice))

shinyServer(function(input, output){
  
  dataset <- reactive({df<- data[Terr_Data$AloOffice == input$Office, ]})    
  output$add <- renderText({paste("Office:", input$Office)})   
  output$Controls <- renderUI({list(selectInput("Office", "Office", Office, selected=Office[1]) ) })
 
  output$mymap <- renderLeaflet({
    
    target_pos <- geocode(input$Office)
    LAT <- target_pos$lat
    LNG <- target_pos$lon

    leaflet(Terr_Data) %>%
      addTiles() %>%  # Add default OpenStreeMap tiles
      setView(lng = LNG, lat = LAT, zoom = 9) %>%
      addMarkers(lng = LNG, lat = LAT)
  })
  
})
