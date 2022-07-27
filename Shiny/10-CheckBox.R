library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("IDcheckbox", "Selecione os produtos", list("Anilhas LPO" = 1, "Barra LPO" = 2, "Kettlebell" = 3, "Dumbbell" = 4))
    ),
    mainPanel(
      actionButton("salvarProdutos", "Clique")
    )
  )
)

server <- function(input, output){
  observeEvent(input$salvarProdutos, {
    opcoesSelecionados <- as.data.frame(input$checkboxId)
    print(opcoesSelecionados)
  })
}
shinyApp(ui, server)
