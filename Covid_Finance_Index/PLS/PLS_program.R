library(forecast)
library(tseries)
library(urca)
library(readxl)
PLS_VIX<- read_excel("cov+fin/cov_fin_VIX_PLS_2.xlsx",
                     sheet = "Or_CFR_1_1")
#####See the dataframe:
View(PLS_VIX)
str(PLS_VIX)
#######################

###Set up the variables as the timeseries variables
x1 <- PLS_VIX[,4]
x2 <- PLS_VIX[,5]
x3<-PLS_VIX[,6]
x4<- PLS_VIX[,7]
x5<-PLS_VIX[,8]
x6<-PLS_VIX[,9]
x7<-PLS_VIX[,10]
x8<-PLS_VIX[,11]
x9<-PLS_VIX[,12]
x10<-PLS_VIX[,13]
x11<-PLS_VIX[,14]
x12<-PLS_VIX[,15]
x13<-PLS_VIX[,16]
x14<-PLS_VIX[,17]
x15<-PLS_VIX[,18]
y <-PLS_VIX[,2]

x1<-ts(x1)
x2<-ts(x2)
x3<-ts(x3)
x4<-ts(x4)
x5<-ts(x5)
x6<-ts(x6)
x7<-ts(x7)
x8<-ts(x8)
x9<-ts(x9)
x10<-ts(x10)
x11<-ts(x11)
x12<-ts(x12)
x13<-ts(x13)
x14<-ts(x14)
x15<-ts(x15)
y<-ts(y)
##############################

#Timeseries regression:
#Run the time series regression, using the tslm() function.
#having the loading value.
loading_x1 <- tslm(x1~y, data = PLS_VIX) 
summary(loading_x1)
loading_x2<- tslm(x2~y, data=PLS_VIX)
summary(loading_x2)
loading_x3<-tslm(x3~y, data = PLS_VIX)
summary(loading_x3)
loading_x4<-tslm(x4~y, data=PLS_VIX)
summary(loading_x4)
loading_x5<-tslm(x5~y, data=PLS_VIX)
summary(loading_x5)
loading_x6<- tslm(x6~y, data = PLS_VIX)
summary(loading_x6)
loading_x7<-tslm(x7~y, data = PLS_VIX)
summary(loading_x7)
loading_x8<-tslm(x8~y, data = PLS_VIX)
summary(loading_x8)
loading_x9<-tslm(x9~y, data = PLS_VIX)
summary(loading_x9)
loading_x10<-tslm(x10~y, data = PLS_VIX)
summary(loading_x10)
loading_x11<-tslm(x11~y, data = PLS_VIX)
summary(loading_x11)
loading_x12<-tslm(x12~y, data = PLS_VIX)
summary(loading_x12)
loading_x13<-tslm(x13~y, data = PLS_VIX)
summary(loading_x13)
loading_x14<-tslm(x14~y, data = PLS_VIX)
summary(loading_x14)
loading_x15<-tslm(x15~y, data = PLS_VIX)
summary(loading_x15)
#############################

#run the cross-sectional regression and export
###Here the sheet is not the same as previous
#get the each day covid index.

v<-data.frame(PLS_VIX)
resultsList <- list()

for (i in 1:ncol(PLS_VIX)) {
  lmfit <- lm(v[, i] ~loadings, data = PLS_VIX )
  resultsList[[i]] <- coefficients(lmfit)
}
resultsList
write.csv(resultsList,file ="resultlist.csv",row.names = T, col.names = T)
#######################################