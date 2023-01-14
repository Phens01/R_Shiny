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
shinyUI(fluidPage(
    headerPanel(title = "Shiny File Upload Example"),

    sidebarLayout(
      sidebarPanel(
        fileInput("file", "Upload the file"),
        h5("Max file size to upload is 5 Mb"),
        radioButtons("sep","seperator", choices = c(Comma=',', Period='.', Tilde="~", minus="-")),
        checkboxInput("header", "header?")
      ),
      
      mainPanel(
        tableOutput("input_file")
      )
    )
))
