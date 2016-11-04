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
  ,fluidRow(
    box(status="primary"
      ,tags$div(class="panel-body", id = "evidence", style="overflow-y:scroll; height:150px; background-color: #fff;")
      ,width=NULL, collapsible = TRUE#, solidHeader=TRUE
      ,title="Evidence (drag here)"  
    )
  )
  ,uiOutput("sideTabs")
)

shinyUI(dashboardPage(header, sidebar, body, skin = "blue"))
