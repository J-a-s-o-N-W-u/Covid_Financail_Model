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
#dataframe information#
View(my_data)
str(my_data)
describe(my_data)
#Set up as factor# This is not necessary
my_data$Sentiment<-factor(my_data$Sentiment)
str(my_data)
###############

# Transfer data to standardized
set.seed(1223)
preproc.param <- my_data %>%
  preProcess(method= c("center", "scale"))##standardized#
train.transformed <- preproc.param %>% predict(my_data)
describe(train.transformed)
pairs.panels(train.transformed[1:5])
################

#BoxMtest
library(heplots)
res<-boxM(cbind(Beta,CFR_1,WUI_1,P_T,N_P, C_H_I,pdnd_2,ripo_2,nipo_2,s_2,CEFD_2)~pearson,data = train.transformed)
res

##Linear Discriminant Analysis
library(MASS)
model<-lda(pearson~., data = train.transformed)
model

####plot:
plot(model,col=as.integer(train.transformed$pearson))

lda.data <- cbind(train.transformed, predict(model)$x)
ggplot(lda.data, aes(LD1, LD2)) +
  geom_point(aes(color = pearson))

###LDA prediction:
lda.train<-predict(model)
train.transformed$lda<-lda.train$class
(train.table<-table(train.transformed$lda, train.transformed$Sentiment))
sum(diag(train.table))/sum(train.table)
###test against the model:
lda.test<-predict(model, test.transformed)
test.transformed$lda<-lda.test$class
table(test.transformed$lda, test.transformed$Sentiment)
