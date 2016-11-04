library(shiny)
library(shinydashboard)

# create vector of individual app folder names
apps <- list.dirs("apps", full.names=FALSE, recursive = FALSE)

shinyServer(function(input, output, session) { 
  
  # create sidebar menu
  output$menu <- renderMenu({
    items <- lapply(apps, function(app) {
      menuItem(app, tabName=app, icon=icon("line-chart"))
    })
    
    dash <- menuItem("Dashboard", tabName="dashboard", icon=icon("dashboard"))
    items <- tagList(dash, items)
    
    sidebarMenu(items)
  })
  isolate({ updateTabItems(session, inputId="tabs", selected="dashboard") })

  # create tabItems for dashboard body
  output$sideTabs <- renderUI({
    # loop through apps folder and pull in ui.R code for each individual app
    tabs <- lapply(apps, function(app) {
      tabItem( tabName=app, source(file.path("apps", app, "ui.R"), local=TRUE) )
    })
    
    # add the dashboard.R code as the first tabItem in tabItems
    dashTab <- tabItem( tabName = "dashboard", source("apps/dashboard.R", local=TRUE) )
    tabs <- tagList(dashTab, tabs)
    
    tagAppendChild(tabItems(), tabs)
  })

  # loop through apps folder and pull in server.R code for each individual app
  lapply(apps, function(app) {
    source(file.path("apps", app, "server.R"), local=TRUE) 
  })
  
})
