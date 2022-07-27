#library(shiny)
setwd("/home/rodrigo/Área de Trabalho/RStudio/Shiny")
getwd()

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      tags$img(src="rbage.png", height=200, width=170)
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
