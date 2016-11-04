fluidRow(

#   box(tags$img(src="anchor.jpg"), textAreaInput("test", "shadow", 5, 10), plotOutput("plot1", height = 250))
#   
#   ,box(
#     title = "Controls - Test",
#     sliderInput("slider", "Number of observations:", 1, 100, 50)    
#   )
  
#   ,box(
#     tags$div(class="panel panel-default"
#        ,tags$div(class="panel-heading"
#            ,tags$span( class = "glyphicon glyphicon-search" )
#            ,"Evidence (drag here)"
#        )
#        ,tags$div(class="panel-body"
#            ,id = "sort2"
#        )
#     )  
#   )
  box(collapsible=TRUE, title="Title Goes Here",
      "placeholder"
  )
  ,box(collapsible=TRUE, title="Title Goes Here",
      "placeholder"  
  )       
)
