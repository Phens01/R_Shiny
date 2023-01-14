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
    headerPanel(title = "Shiny tabset"),
      sidebarLayout(
        sidebarPanel(
          selectInput("ngear", "Select the gear number", c("Cylinders" = "cyl", "Transmission" = "am", "Gears" = "gear")),
          submitButton("update!")
        ),
        
        mainPanel(
          tabsetPanel(type = "tab",
            tabPanel("Data", tableOutput("mtcars"), downloadButton("downloadData", "Download Data")),
            tabPanel("Summary", verbatimTextOutput("summ")),
            tabPanel("plot", plotOutput("plot"), downloadButton("downloadPlot", "Download Plot")),
            tabPanel("Image", tags$img(src = "mickey.png")),
            tabPanel("Vidéo", tags$video(src = "AD.mp4", width="880px", type = "video/mp4", controls = "controls"))
            
          )
        )
      )
  )
)
