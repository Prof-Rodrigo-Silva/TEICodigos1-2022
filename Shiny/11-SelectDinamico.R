library(dplyr)
library(readxl)
library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)
#install.packages("shinythemes")
library(shinythemes)

getwd()
setwd("/home/rodrigo/Área de Trabalho/RStudio/Shiny")
dados <- read_xlsx(path = "dados.xlsx")

estados <- list("RS - Rio Grande do Sul" = 1, "SP - São Paulo" = 2,"SC - Santa Catarina" = 3)

choices_RS <- list("Bagé" = 105, "Porto Alegre" = 106, "Caçapava do Sul" = 107)
choices_SP <- list("São Paulo " = 205,"Guarulhos" = 206, "Campinas" = 207)
choices_SC <- list("Florianopolis" = 305, "São Miguel do Oeste" = 306 , "Criciuma" = 307)

ui <- dashboardPage(skin = "blue",
                    dashboardHeader(
                      title = "Seleção",
                      titleWidth = 186
                    ),
                    dashboardSidebar(
                      tags$p(),
                      selectInput("selectEstado", label = "Estados", choices = estados),
                      uiOutput("ui"),
                      #Documentacao: https://shiny.rstudio.com/articles/selectCidade-ui.html
                      
                      tags$div(class = "alinhamento",
                               actionButton("filtrar", "Filtrar")
                      )
                    ),
                    dashboardBody(
                      tags$style(type="text/css", ".alinhamento {color: black;height:40px;display:flex;align-items: center;justify-content: center;}"),
                      tabsetPanel(
                        navbarMenu("Dados cidade",
                                   tabPanel(
                                     title = "Dados cidade",
                                     value = "page1",
                                     fluidRow(
                                       column(12,
                                              tags$h3(class = "alinhamento", "Dados"),
                                       )
                                     ),
                                     fluidRow(
                                       column(4,
                                              textOutput("cidade")  
                                       ),
                                       column(4,
                                              textOutput("estado")
                                       ),
                                       column(4,
                                              textOutput("populacao")
                                       )
                                     )
                                   )
                        )
                      )
                    )
)

server <- function(input, output, session) {
  
  output$ui <- renderUI({
    if (is.null(input$selectEstado))
      return()
    
    switch(input$selectEstado,
           "1" = selectInput("selectCidade", label = "Cidade",
                             choices = choices_RS),
           "2" = selectInput("selectCidade", label = "Cidade",
                             choices = choices_SP),
           "3" = selectInput("selectCidade", label = "Cidade",
                             choices = choices_SC)
    )
    
  })
  
  observeEvent(input$filtrar, {
    
    opcaoSelecionada <- input$selectCidade
    dadosFiltrados <- dados[dados$codigoCidade == opcaoSelecionada, ]
    dadosFiltrados <- as.data.frame(dadosFiltrados)
    
    output$cidade <- renderText({ 
      dadosFiltrados[1,2] 
    })
    
    output$estado <- renderText({ 
      dadosFiltrados[1,3] 
    })
    
    output$populacao <- renderText({ 
      dadosFiltrados[1,4] 
    })
    
  })
}

shinyApp(ui, server)

