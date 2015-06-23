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
  box(collapsible=TRUE, title="Some More Evidence..."
      ,tags$div(class="panel-body", id = "sort3"
         ,tags$li("item one")
         ,tags$li("item two")
         ,tags$li("item three")
         ,tags$li("item four")
      )
  )
  ,box(collapsible=TRUE, title="Some Evidence..."
    ,tags$div(class="panel-body", id = "sort1"
        ,lapply(
          colnames(mtcars)
          ,function(co){
            tag("p"
              ,list(
                class = class(mtcars[,co])
                ,tags$span( class = "glyphicon glyphicon-move" )
                ,tags$strong( co  )
              )
            )
          }
        )      
      )
    )       
  # make specified items draggable for evidence
  ,sortableR( "sort1", options = list( group = list(name="evidenceGroup", pull = "clone", put = FALSE) ) )
  ,sortableR( "sort3", options = list( group = list(name="evidenceGroup", pull = "clone", put = FALSE) ) )
  ,sortableR( "dPlot", options = list( group = list(name="evidenceGroup", pull = "clone", put = FALSE) ) )
#   ,sortableR( "sort2", options = list( group = "sortGroup1" ) )
)