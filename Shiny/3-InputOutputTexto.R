library(shiny)

ui <- fluidPage(
  titlePanel("Entrada e Saida de dados"),
  
  sidebarLayout( position = "left",
                 sidebarPanel(
                   textInput("idTexto", "Informe um texto")
                 ),
                 
                 mainPanel(
                   textOutput("idTexto")
                 ),
  )
)

server <- function(input, output){
  output$idTexto <- renderText({input$idTexto})
}

shinyApp(ui, server)

#Shiny provides a family of functions that turn R objects into output for your user interface. Each function creates a specific type of output.

###FUNCOES PARA SAIDA DE DADOS###
#OutputFunction	      Creates                                                 
#dataTableOutput	    DataTable
#htmlOutput	          raw HTML
#imageOutput	        image
#plotOutput	          plot
#tableOutput	        table
#textOutput	          text
#uiOutput	            raw HTML

###FUNCOES RENDER###
#renderFunction	      creates
#renderDataTable	    DataTable
#renderImage	        images (saved as a link to a source file)
#renderPlot	          plots
#renderPrint	        any printed output
#renderTable	        data frame, matrix, other table like structures
#renderText	          character strings
#renderUI	            a Shiny tag object or HTML

