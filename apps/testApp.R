library(shiny)
library(shinythemes)

appName <- "app3"

ui = shinyUI(fluidPage(title=appName, titlePanel(appName), theme = shinytheme("cerulean"),
  
  source(paste("apps/", appName, "/ui.R", sep=""), local=TRUE)
  
))
  
server = shinyServer(function(input, output) {
  
  source(paste("apps/", appName, "/server.R", sep=""), local=TRUE)
  
})

app <- shinyApp(ui, server)

runApp(app)