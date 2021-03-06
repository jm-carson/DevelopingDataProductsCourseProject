#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(ggmap)

ui <- fluidPage(

  leafletOutput("mymap", height="850px"),
  absolutePanel(top=20, left=70, uiOutput("Controls"))

)