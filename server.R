library(leaflet)

function(input, output) {

  lunch_spots = data.frame(name = c("Aloha Poke", "Chipotle", "Hannah's Bretzel", "Jersey Mike's"),
                           lng  = c(-87.635703, -87.640880, -87.641357, -87.634020),
                           lat  = c(41.881920, 41.880406, 41.880538, 41.881261))
  
  observeEvent(input$goButton, {

    idx <- sample(dim(lunch_spots)[1], 1)
        
    # output$text <- renderText({
    #   
    #   paste0(lunch_spots$name[idx])
    #   
    # })
    
    output$map <- renderLeaflet({
       
      leaflet() %>%
      
        addProviderTiles(providers$Esri.NatGeoWorldMap, options = providerTileOptions(noWrap = TRUE)) %>%
        
        addMarkers(lng = lunch_spots$lng[idx], lat = lunch_spots$lat[idx], label = lunch_spots$name[idx],
          labelOptions = labelOptions(noHide = T,
                                      direction = "top",
                                      style = list("color" = "MediumBlue",
                                                   "font-size" = "18px",
                                                   "box-shadow" = "5px 5px rgba(0,0,0,0.25)",
                                                   "border-color" = "rgba(0,0,0,0.5)")))
      
    })
    
  })

}
