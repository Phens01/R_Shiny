library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(title = "Demo App", skin = "black",
    dashboardHeader(title = "Phen's",
                    dropdownMenuOutput("msgOutput"),
#                    dropdownMenu(type = "message",
#                                messageItem(from = "Finance Update", message = "Weare on threshold"),
#                                messageItem(from = "Sales Update", message = "sales are at 55%", icon = icon("bar-chart"), time = "20:35"),
#                                messageItem(from = "Sales Update", message = "sales meeting at 6PM on Monday", icon = icon("handshake-o"), time = "03-25-2017")
#                    )
                    dropdownMenu(type = "notifications", 
                                 notificationItem(
                                   text = "2 new tabs added to the dashboard",
                                   icon = icon("dashboard"),
                                   status = "success"
                                 ),
                                 
                                 notificationItem(
                                   text = "server is currently running at 95% load",
                                   icon = icon("warning"),
                                   status = "warning"
                                 )
                                 ),

                    dropdownMenu(type = "tasks",
                                 taskItem(
                                   text = "shiny Dashboard Education",
                                   value = 80,
                                   color = "blue",
                                 ),
                                 taskItem(
                                   text = "Overall R Education",
                                   value = 55,
                                   color = "red",
                                 ),
                                 taskItem(
                                   text = "Data Science Education",
                                   value = 40,
                                   color = "green",
                                 )
                      
                    )
                    ),
    dashboardSidebar(
      sidebarSearchForm("searchText", "buttonSearch", "Search"),
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
          menuSubItem("Dashboard Finance", tabName = "finance"),
          menuSubItem("Dashboard Sales", tabName = "sales"),
        menuItem("Detailed Analysis", tabName = "detail",badgeLabel = "New", badgeColor = "green", icon = icon("book")),
        menuItem("Raw Data", tabName = "rawdata", icon = icon("database"))
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(
          tabName = "dashboard",
          h1("Dashboard"),
          fluidRow(
            infoBox("Sales",10000, icon = icon("thumbs-up")),
            infoBox("Conversion %", paste0('20%'), icon = icon("warning")),
            infoBoxOutput("approvedSales")
          ),
          
          fluidRow(
            valueBox(15*200, "Budget for 15 Days", icon = icon("hourglass-3")),
            valueBoxOutput("itemRequested")
          ),
          fluidRow(
            box(title = "Histogram of Iris", status = "primary", solidHeader = T, plotOutput("histogram")),
            box(title = "Controls for Dashboard", status = "warning", solidHeader = T,
                "Use these controls to fine tune your bins",br(),br(),
                "Do not use lot of control as it confuses the user",
                sliderInput("bins", "Number of breaks",1,50,25),
                textInput("text_Input","Search opportunities", value = "123456")
                )
          ),
          fluidRow(
            tabBox(
              tabPanel(title = "Sepal Length",plotOutput("table1")),
              tabPanel(title = "Sepal Width",plotOutput("table2")),
              tabPanel(title = "Petal Length",plotOutput("table3")),
              tabPanel(title = "Petal Width",plotOutput("table4"))
            )
          )
        ),
        
        tabItem(
          tabName = "finance",
          h1("Finance Dashboard")
        ),
        
        tabItem(
          tabName = "sales",
          h1("Sales Dashboard")
        ),
        
        tabItem(
          tabName = "detail"
        ),
        
        tabItem(
          tabName = "rawdata"
        )
      )
    )
  )
)
