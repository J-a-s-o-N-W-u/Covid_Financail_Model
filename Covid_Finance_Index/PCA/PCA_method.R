library("FactoMineR")###main package
library("factoextra")###main package
library(caret)
library(ggpubr)
library(moments)
library(psych)
library(DescTools)
library(purrr)
library(tidyverse)
library(caret)
library(heplots)
library(psych)
library(candisc)
library(MASS)
library(readxl)
#############
PCA<- read_excel("cov_fin_PCA_v_3.xlsx", 
                 sheet = "CFR_1&WUI_1")

#dataframe information#
View(PCA)
str(PCA)
describe(PCA)
###############

####PCA model######
model<- prcomp(PCA, center = TRUE, scale = TRUE)####if the scale is TRUE then the variables are standardization and the loadings also equal to resacle one#### 
model
summary(model)
get_eigenvalue(model)###show the eigenvalue for each principal component####
var<- get_pca_var(model)
var
var$coord####show the loadings for each variables####
var$cos2#:represents the quality of representation for variables on the factor map. It¡¦s calculated as the squared coordinates: var.cos2 = var.coord * var.coord.#
var$contrib