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
  
  mtreact <- reactive({
    mtcars[, c("mpg", input$ngear)]
  })
  
  output$mtcars <- renderTable({
    mtreact()
  })
  
  output$summ <- renderPrint({
    summary(mtreact())
  })
  
  output$plot <- renderPlot({
    with(mtreact(), boxplot(mpg~mtreact()[,2]))
  })
  
  output$downloadData <- downloadHandler(
    filename = function(){
      paste("mtcars", "csv", sep = ".")
    },
    
    content = function(file){
      write.csv(mtreact(), file)
    }
  )
  
  output$downloadPlot <- downloadHandler(
    filename = function(){
      paste("mtcars-plot", "png", sep = ".")
    },
    
    content = function(file){
      png(file)
      with(mtreact(), boxplot(mpg~mtreact()[,2]))
      dev.off()
    }
  )
  

})
