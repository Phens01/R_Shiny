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

    output$project_code <- ({
        renderText(input$projCode)
    })
    
    output$project_name <- ({
      renderText(input$projName)
    })
    
    output$technology_used <- ({
      renderText(input$tech)
    })
    
    output$location <- {(
      renderText(input$loc)
    )}
    
    output$no_of_days_spent <- {(
      renderText(input$ndayspent)
    )}
    
    output$department <- {(
      renderText(input$dept)
    )}
    

})
