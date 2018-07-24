library(leaflet)

function(input, output) {
  
  lunch_spots <- read.csv("lunch_spots.csv", sep = ",", header = TRUE)
  
  observeEvent(input$goButton, {

    idx <- sample(dim(lunch_spots)[1], 1) # pick random lunch spot
    
    output$map <- renderLeaflet({
       
      leaflet() %>%
      
        addProviderTiles(providers$Esri.NatGeoWorldMap, options = providerTileOptions(noWrap = TRUE)) %>%
        
        addMarkers(lng = lunch_spots$lng[idx], lat = lunch_spots$lat[idx],
          
          label = HTML(paste0("<font size=5 color=navy><b>", lunch_spots$name[idx], "</b></font>", "</br>",
            "<font size=2 color=gray>", lunch_spots$address[idx], "</font>", "</br>",
            "<font size=2 color=gray>", lunch_spots$city[idx], ", ", lunch_spots$state[idx], " ", lunch_spots$zipcode[idx], "</font>", "</br>")),
          
          labelOptions = labelOptions(noHide = T,
                                      direction = "top",
                                      style = list("box-shadow" = "5px 5px rgba(0,0,0,0.25)",
                                                   "border-color" = "rgba(0,0,0,0.25)")))
      
      
      
    })
    
  })

}
