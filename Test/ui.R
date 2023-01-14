#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
shinyUI(
  dashboardPage(
    dashboardHeader(title = "Graphic Phens"),
    dashboardSidebar(
      menuItem("Accueil", tabName = "accueil", icon = icon("home")),
      menuItem("Description", tabName = "descript", icon = icon("comment")),
      menuItem("Visualisation", tabName = "visual", icon = icon("desktop")),
      menuItem("A propos", tabName = "apropos", icon = icon("copyright"))
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "accueil",
                h1("Accueil"),
                mainPanel(
                  
                )
                ),
        tabItem(tabName = "descript",
          h1("Description")
        ),
        tabItem(tabName = "visual",
          h1("Visualisation")
        ),
        tabItem(tabName = "apropos",
          h2("A propos")
        )
      )
    )
  )
)
