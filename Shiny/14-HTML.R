library(shiny)


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
    ),
    mainPanel(
      tags$code("if x > 10 then"),
      tags$p("Um parágrafo"),
      tags$h1("Texto que possui o tamanho h1"),
      tags$h2("Texto que possui o tamanho h2"),
      tags$h3("Texto que possui o tamanho h3"),
      tags$h4("Texto que possui o tamanho h4"),
      tags$h5("Texto que possui o tamanho h5"),
      tags$h6("Texto que possui o tamanho h6"),
      tags$strong("Texto em negrito"),
      tags$em("Itálico"),
      tags$br(),
      tags$u("Texto sublinhado"),
      tags$br(),
      tags$label("Informe seus dados nos campos abaixo")
      
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
