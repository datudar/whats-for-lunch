library(leaflet)

fluidPage(

  verticalLayout(
    
    br(), br(),
    
    actionButton(inputId = "goButton", label = "What's for Lunch?"),
    
    hr(), 
    
    textOutput("text"),
    
    br(),
    
    leafletOutput("map")

  )
)
