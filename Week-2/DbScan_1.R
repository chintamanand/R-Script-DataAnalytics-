install.packages("fpc")
install.packages("dbscan")
install.packages("factoextra")

  
  # Load the data 
  data("multishapes", package = "factoextra")
df <- multishapes[, 1:2]
# Compute DBSCAN using fpc package
library("fpc")
set.seed(123)
db <- fpc::dbscan(df, eps = 0.15, MinPts = 5)
# Plot DBSCAN results
library("factoextra")
fviz_cluster(db, data = df, stand = FALSE,
             ellipse = FALSE, show.clust.cent = FALSE,
             geom = "point",palette = "jco", ggtheme = theme_classic())
