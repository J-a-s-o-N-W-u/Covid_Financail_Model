library(readxl)
raw_sd_data<- read_excel("cov_fin_cluster_v_2.xlsx", 
                         sheet = "model_1")

#dataframe information
View(raw_sd_data)
str(raw_sd_data)
##################

library(cluster)
library(stats)
library(factoextra)
library(FactoMineR)
##################use the get_dist() function, 
d_data<-get_dist(raw_sd_data, method = "manhattan") #Distance Matrix, data has been standardized in advance, here the method ="manhattan", "euclidean", "spearman", "pearson".

#######use the silhouette width to find the best cluster number and cluster by partitioning method which is one of K-medoids(PAM)
# Calculate silhouette width for many k using PAM
sil_witdth <-c(NA)
for(i in 2:10){
  pam_fit<-pam(d_data,
               diss=TRUE,
               k=i)
  sil_witdth[i] <- pam_fit$silinfo$avg.width
}
#plot silhouette width (higher is better)
plot(1:10, sil_witdth,
     xlab = "Number of clusters",
     ylab = "Silhouette Width")
lines(1:10, sil_witdth)  
str(pam_fit)

###Descriptive Statistics
pam_fit <- pam(d_data, diss = TRUE, k=6)
pam_results <- raw_sd_data %>%
  mutate(cluster =pam_fit$clustering)%>%
  group_by(cluster) %>%
  do(the_summary= summary(.))
pam_results$the_summary
str(pam_fit$clustering)
pam_fit$clustering
summary(pam_fit)

##Hierachical method:
###Agglomerative clustering
#methods to assess which measuring is better:
m<- c("average","single","complete","ward")
names(m)<- c("average","single","complete","ward")#different cluster measure
ac<- function(x){
  agnes(d_data, diss = TRUE, keep.diss = TRUE, method = x)$ac
}
library(purrr)
map_dbl(m, ac)#find the best measurement
###Ward method is better:
ward.clus<-agnes(d_data, diss = TRUE, keep.diss = TRUE, method = "ward")
pltree(ward.clus, cex = 0.6, hang=-1, main="Dendrogram of agnes")

w.cluster <- hclust(d_data, method="ward.D2")

##cut tree into K groups(denpend on the figure to choose the k=_.)
sub_grp <- cutree(w.cluster, k=3)
sub_grp
table(sub_grp)
##Descriptive statistic
library(dplyr)
ward_results <- raw_sd_data %>%
  mutate(cluster =sub_grp)%>%
  group_by(cluster) %>%
  do(the_summary= summary(.))
ward_results$the_summary
################