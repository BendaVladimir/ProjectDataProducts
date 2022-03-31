library(factoextra)
library(cluster)
data("USArrests")
df <- scale(USArrests)

apply_number_cluster <- function(nclusters, nstarts, dataframe) {
  
  out_res <- kmeans(dataframe, nclusters, nstart=nstarts)
  
  fviz_cluster(out_res, data=dataframe, nstart=nstarts, geom = c("point"))
  
}

apply_silhouette_analysis <- function(nclusters, nstarts, dataframe) {
  
  fviz_nbclust(dataframe, kmeans, method = "wss") +
    geom_vline(xintercept = nclusters, linetype = 2) + # add line for better visualisation
    labs(subtitle = "Elbow method") 
  
}
  

server <- function(input, output) {

  output$clusterHistogram <- renderPlot({
    apply_number_cluster(input$centers_number, input$nstart, df)
  })
  
  output$silhouettePlot <- renderPlot({
    apply_silhouette_analysis(input$centers_number, input$nstart, df)
  })
  
  }