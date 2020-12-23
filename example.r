#Variables
b <- 11
b

a <- c(1,2,3,4,5)
a


# operators
a<- 15
b<-10
s=a+b
d=a-b
e=a/b
f=a*b
print (s)
print (d)
print (e)
print (f)


#Printing with cat 
fname<-"Rakesh"
lname<-"Shrestha"
age<-"20"
course<-"BScIT"

cat(fname,lname,age,course)
cat("First Name:", fname, "Last Name:", lname, "Age :", age, "Course :", course)

#conditional statement
#if statement
x <- -2
if(x < 0){
  print("x is a negative number")
}else{
  print("x is positive number")
}

# else if statement
x <- 0
if(x < 0){
  print("x is a negative number")
}else if(x == 0){
  print("x is zero")
}else{
  print("x is positive number")
}

#Loops
# For loops
for(i in 1:3){
  print(i^2)
}

#While loops
x <- 5
while(x<10){
  x <- x+1
  print(x)
}

# Creating matrices
matrix(1:6, nrow = 2)
matrix(1:6, ncol = 3)

m<- matrix(1:6, byrow = TRUE, nrow = 2)
print (m)

#list
details <- list("Rakesh", 11, 12)
names(details)<- c("Name", "Age", "Class")
details


#creating dataframe
name <- c("Rakesh", "Priyank", "Pramod", "Bibek", "Ram")
age <- c(21,21,23,25,23)
course <- c("BIT", "BBS", "BTECH", "BSC", "BBM")
df <- data.frame(name, age, course)
df

# naming the above data.frame
df <- data.frame(NAME=name, AGE=age , COURSE=course)
df

#Data Frame Structure
str(df)

#function
circ.area<- function(r){
Area<-pi*r^2
return(Area)
  }
circ.area(1)

# airthmetic operation function
airth<-function(a){
  sum<- 1+a
  print(sum)
  
}
airth(5)

#To know working directory
getwd()

#To read data from csv
data <- read.csv("Weather.csv")
print (data)
is.data.frame(data)
print(data$month)

print(max(data$hour))


#import your csv file to your Global Environment
data <- read.csv("Weather.csv",header = TRUE, sep =",")
data



