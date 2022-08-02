#install.packages("shiny")

library(shiny)


ui <- fluidPage(
  
  titlePanel("Meu primeiro App com o Shiny")
)

server <- function(input, output){
  
}

shinyApp(ui, server)
