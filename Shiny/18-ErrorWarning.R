library(shiny)
#install.packages("shinyalert")
library(shinyalert)

ui = fluidPage(
  useShinyalert(),  # Set up shinyalert
  actionButton("btn", "Mostrar mensagem")
)

server = function(input, output) {
  observeEvent(input$btn, {
    shinyalert(title = "Mensagem de ERRO!",type = "error") #error #default #warning
  })
}

shinyApp(ui, server)
