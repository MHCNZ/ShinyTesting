# Copyright Dr Malcolm Campbell 2018. all rights reserved
# #WELLCONNECTEDNZ project 2017-2019 (NSC / MoH / HRC funded)

# Basic shiny map for Christchurch

library(shiny)
library(leaflet)

labeltext <- c("Whats the Point?")

ui <- fluidPage(
  leafletOutput("mymap"),
  p())

server <- function(input, output, session){
  
points <- eventReactive(input$recalc, {cbind(rnorm(1)/40 +172.6088, rnorm(1)/40 - 43.5322)}, ignoreNULL = FALSE)
  
output$mymap <- renderLeaflet({
leaflet() %>%
addProviderTiles(providers$Stamen.TonerLite, options = providerTileOptions(noWrap = TRUE) ) %>%
addMarkers(data = points(), label=labeltext, labelOptions = labelOptions(
style = list("font-weight" = "normal", padding = "3px 8px"),textsize = "12px",direction = "auto")) %>%
setView(lat=-43.5, lng=172.7 , zoom=11)})
}

shinyApp(ui, server)
#
