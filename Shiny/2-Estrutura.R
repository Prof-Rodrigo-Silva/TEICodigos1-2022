library(shiny)

ui <- fluidPage(
  titlePanel("Estrutura da Pagina"),
  
  sidebarLayout( position = "left",
    sidebarPanel(
      h2("Dados de input")
    ),
    mainPanel(
      h2("Elementos de saida de dados"),
    ),
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
