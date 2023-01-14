#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    headerPanel(title = "Text Input Shiny Widget"),
    sidebarLayout(
      sidebarPanel(
        textInput("projCode", "Enter your project code"),
        textInput("projName", "Enter your project name"),
        textInput("tech", "Technology you are using ?"),
        radioButtons("loc", "what is your location?", choices = c("Off-site", "On-site"), selected = "On-site", inline = T),
        sliderInput("ndayspent", "N° of days spent", 1, 100,value = c(10,20), step = 5),
        selectInput("dept", "What is your department?", choices = c("Marketing", "Finance","Economy","Technology", "Mathematics"), multiple = T)
      ),
      
      mainPanel(
        textOutput("project_code"),
        textOutput("project_name"),
        textOutput("technology_used"),
        textOutput("location"),
        textOutput("no_of_days_spent"),
        textOutput("department")
      )
    )
  )
  
)
