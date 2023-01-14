#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$input_file <- renderTable({
    file_to_read = input$file
    if(is.null(file_to_read)){
      return()
    }
    
    read.table(file_to_read$datapath, sep = input$sep, header = input$header)
  })

})
