
data<-read.csv("student.csv")
value<-subset(data)
print(value)

data<-read.csv("student.csv")
value<-subset(data,Course=="BscIT")
print(value)

data<-read.csv("student.csv")
alldata<-subset(data,Fees==max(Fees))
print(alldata)

data<-read.csv("student.csv")
alldata<-subset(data,Fees==min(Fees))
print(alldata)



data<-read_xlsx("EMP.xlsx",sheet =  1)
print(data) 


data<-read_xlsx("EMP.xlsx",sheet =  1)
alldata<-subset(data,SALARY==min(SALARY))
print(alldata)

data<-read_xlsx("EMP.xlsx",sheet =  1)
alldata<-subset(data,SALARY==max(SALARY))
print(alldata)


library(readxl)
