library(shiny)

ui <- fluidPage(
  titlePanel("Entrada Numerica"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("idNumero", "Informe um numero", 0, min = 0, max = 100, step = 5)
    ),
    
    mainPanel(
      verbatimTextOutput("idSaida")
    )
  )
)

server <- function(input, output){
  output$idSaida <- renderText({input$idNumero})
}

shinyApp(ui, server)
