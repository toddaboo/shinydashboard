# Sidebar with a slider input for number of bins
sidebarLayout(
  fluidRow(
    box(status="primary", title="Test App 1",
      sliderInput("bins1",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
  
    # Show a plot of the generated distribution
    box(status="warning", title="Histogram 1",
      plotOutput("dPlot")
    )
  ),
  fluidRow(
    box(collapsible=T,
       dataTableOutput("tbl")
    )
  )
  
)

