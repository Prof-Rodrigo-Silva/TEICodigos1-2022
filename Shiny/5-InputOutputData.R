library(shiny)

ui<- fluidPage(
  titlePanel("Entrada de Datas"),
  sidebarLayout(
    sidebarPanel(
      dateInput("idData", "Informe a data", format ="dd/mm/yyyy", language = "pt", autoclose = TRUE)
    ),
    mainPanel(
      verbatimTextOutput("idSaida")
    )
  )
)

server <- function(input, output){
  output$idSaida <- renderText({as.character(input$idData)})
}

shinyApp(ui, server)
