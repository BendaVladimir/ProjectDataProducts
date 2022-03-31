ui <- fluidPage(
  

  titlePanel("Simulation of changing clusters and nstart parameters"),
  

  sidebarLayout(
    

    sidebarPanel(
      

      sliderInput(inputId = "centers_number",
                  label = "Number of centers:",
                  min = 2,
                  max = 10,
                  value = 5),
      
      sliderInput(inputId = "nstart",
                  label = "n start parameter:",
                  min = 10,
                  max = 100,
                  value = 50)
      
    ),
    

    mainPanel(

      plotOutput(outputId = "clusterHistogram"),
      plotOutput(outputId = "silhouettePlot")
      
    )
  )
)