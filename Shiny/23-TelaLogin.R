library(shiny)
#install.packages("shinymanager")
library(shinymanager)
setwd("/home/rodrigo/Área de Trabalho/RStudio/Shiny")

credentials <- data.frame(
  user = c("Rodrigo", "Naiade"),
  password = c("12345", "123"),
  stringsAsFactors = FALSE
)

ui <- fluidPage(
  titlePanel("Testando shinyManager!"),
  
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      tags$p("Logado!"),
    )
  )
)

server <- function(input, output,  session) {
  
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials),
    timeout = 25
  )
  
}

ui <- secure_app(ui, language="pt-BR",
                 tags_top = tags$div(tags$img(src = "rbage.png", width = 100)),
                 tags_bottom = tags$div(
                   tags$p(
                     "Problemas no",
                     tags$a(
                       href = "mailto:profrodrigorosadasilva@gmail.com?Subject=Problema para acessar",
                       target="_top", "acesso")
                   )
                 ),
                 background = "linear-gradient(rgba(193,135,105), rgba(193,135,105,0.33))"
)

shinyApp(ui, server)

#https://cssgenerator.org/rgba-and-hex-color-generator.html
#https://cran.r-project.org/web/packages/shinymanager/shinymanager.pdf