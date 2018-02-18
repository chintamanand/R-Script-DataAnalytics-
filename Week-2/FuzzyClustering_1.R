#Fuzzy Clustering
#install.packages("factoextra")
library(factoextra)
library(cluster)
head(USArrests)
df <- scale(USArrests)     # Standardize the data
result<- fanny(df, 2)
head(result)
print(summary(result))

fviz_cluster(result, ellipse.type = "norm", repel = TRUE,
             palette = "jco", ggtheme = theme_minimal(),legend = "right")