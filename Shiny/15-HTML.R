library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      tags$p("TESTE COM ESTILO (STYLE)", style="color:blue"),
      HTML('<p><h1> TESTE COM TAG HTML</h1></p>'),
      tags$div(style="background-color: #00BFFF;text-align:center",
               tags$p("texto que esta dentro da div")      
      ),
      tags$label("Informe o seu problema"),
      tags$br(),
      tags$textarea("idTextArea", rows=3, cols=5)
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
