library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "Analyst Tools")

sidebar <- dashboardSidebar( 
  sidebarSearchForm(textId = "searchText", buttonId = "searchButton", label = "Search..."),
  sidebarMenu(id="tabs", sidebarMenuOutput("menu"))
)

body <- dashboardBody( 
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  )
  ,uiOutput("sideTabs")
)

shinyUI(dashboardPage(header, sidebar, body, skin = "blue"))
