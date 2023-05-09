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
library(tidyverse)
library(caret)
library(readxl)
my_data <- read_excel("DA_model.xlsx", 
                      sheet = "CFR_1&WUI_1")
##Dataframe information
View(my_data)
str(my_data)
describe(my_data)
my_data$Sentiment<-factor(my_data$pearson)#not necessary
str(my_data)
####
# Transfer data to standardized
set.seed(1223)
preproc.param <- my_data %>%
  preProcess(method= c("center", "scale"))
train.transformed <- preproc.param %>% predict(my_data)
describe(train.transformed)
########

###Canonical discriminant analysis, first do the monova test
Y<-cbind(train.transformed$Beta,train.transformed$CFR_1,train.transformed$WUI_1 , train.transformed$P_T,train.transformed$N_P, train.transformed$C_H_I, train.transformed$pdnd_2,train.transformed$ripo_2,train.transformed$nipo_2,train.transformed$s_2,train.transformed$CEFD_2)
colnames(Y)= c("Beta","CFR_1","WUI_1","P_T","N_P","C_H_I","pdnd","ripo","nipo","s","cefd")
Model_1<-manova(Y~pearson, data= train.transformed)#Do the monova test
summary(Model_1)

####Canonical Discriminant analysis
Model <- candisc(Model_1, term = "pearson")
Model
summary(Model)
str(Model)
Model$structure
Model$coeffs.raw
####
heplot(Model)

