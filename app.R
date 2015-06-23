## main.R ##

library(shiny)
library(shinydashboard)

apps <- dir("apps", full=FALSE)
apps <- apps[which(grepl("app", apps))]

header <- dashboardHeader(title = "Analyst Tools")

sidebar <- dashboardSidebar( 
  sidebarSearchForm(textId = "searchText", buttonId = "searchButton", label = "Search..."),
  sidebarMenu( uiOutput("sideMenu") )
)

body <- dashboardBody( 
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  uiOutput("sideTabs") 
)

ui <- dashboardPage(header, sidebar, body, skin = "blue")

server <- function(input, output, session) { 

  # loop that sources all server code for the individual apps
  output$sideTabs <- renderUI({
    tabs <- lapply(apps, function(app) {
      tabItem( tabName=app, source(paste("apps/", app, "/ui.R", sep=""), local=TRUE) )
    })
    
    dashTab <- tabItem( tabName = "dashboard", source("apps/dashboard.R", local=TRUE) )
    tabs <- c(list(dashTab), tabs)
    
    tagAppendChild(tabItems(), tabs)
  })
  
  output$sideMenu <- renderUI({
    items <- lapply(apps, function(app) {
      menuItem(app, tabName=app, icon=icon("line-chart"))
    })
    
    dash <- menuItem("Dashboard", tabName="dashboard", icon=icon("dashboard"))
    items <- c(list(dash), items)
    
    tagAppendChild(sidebarMenu(), items)
  })

}

shinyApp(ui, server)
