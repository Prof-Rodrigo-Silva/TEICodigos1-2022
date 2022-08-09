library(shiny)

ui <- fluidPage(
  
  fluidRow(
    column(style = "border: 1px solid black",width = 4,"Conteudo"),
    column(style = "border: 1px solid black",width = 4,"Conteudo"),
    column(style = "border: 1px solid black",width = 4,"Conteudo")
  ),
  
  fluidRow(
    column(style = "border: 1px solid black",width = 4,"Conteudo"),
    column(style = "border: 1px solid black",width = 4,"Conteudo"),
    column(style = "border: 1px solid black",width = 4,"Conteudo")
  ),
  
  fluidRow(
    column( width = 4,"Conteudo"),
    column( width = 4,"Conteudo"),
    column( width = 4,"Conteudo")
  )
)

server <- function(input, output) { 
  
}

shinyApp(ui, server)







