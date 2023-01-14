library(shiny)
library(shinydashboard)

shinyServer(function(input, output){
  
  output$histogram <- renderPlot({
    hist(iris$Sepal.Length, breaks =input$bins )
  })
  
  output$table1 <- renderPlot({plot(iris$Sepal.Length)})
  output$table2 <- renderPlot({plot(iris$Sepal.Width)})
  output$table3 <- renderPlot({plot(iris$Petal.Length)})
  output$table4 <- renderPlot({plot(iris$Petal.Width)})
  
  output$msgOutput <- renderMenu({
    msgs <- apply(read.csv("messages.csv"),1, function(row){
      messageItem(from = row[["from"]], message = row[["message"]])
    })
    
    dropdownMenu(type = "messages",  .list = msgs)
  })
  
  output$approvedSales <- renderInfoBox({
    infoBox("approval Sales", "10,000,000", icon = icon("bar-chart-o"))
  })
  
  output$itemRequested <- renderInfoBox({
    valueBox(15*200, "Item Requested by Employees", icon = icon("fire"), color = "red")
  })
  
})