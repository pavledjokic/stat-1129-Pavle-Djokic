#Question 1

mat1 <- matrix(c(7,2,9,4,12,13), nrow = 2, ncol = 3)
mat1

mat2 <- matrix(c(1, 2, 3, 7, 8, 9, 12, 13, 14, 19, 20, 21), nrow=3,ncol=4)
mat2

#Matrix Multiplication
mat3 <- mat1%*%mat2

#Resulting Matrix
mat3

#Question 2

#2.A
df <- data.frame(
  id = c(1, 2, 3, 4, 5),
  name = c("Peter", "Amy", "Ryan", "Gary", "Michelle"),
  salary = c(623.30, 515.20, 611.00, 729.00, 843.25)
)

#2.B
df <- cbind(df, department = c("IT", "Finance", "HR", "Accounting", "R&D"))

df

#2.C
df[c(1, 3, 5), c(2, 3)]

#2.D
barplot(df[c(1,4,5), c(3)], names.arg = df[c(1,4,5), c(2)])

#2.E
high <- max(df$salary)
low <- min(df$salary)
med <- median(df$salary)

pievector <- c(max(df$salary), min(df$salary), median(df$salary))
pielabel <- c("Highest Salary", "Lowest Salary", "Median Salary")
pie(pievector, pielabel, main = "Pie Chart of Salary")

#Loading Necessary Packages
library(ggplot2)
theme_set(theme_minimal())
library("tidyverse")

#Loading Data from Midterm Project
amazon <- read.csv("c:/stat/amazon-orders.csv")

#Cleaning Data
df1 <- amazon[ , c(1, 28, 29, 30, 31)]

head(df1)

#Converting Date into Correct Format & Dollar Figures into numberic
df1$Order.Date <- as.Date(df1$Order.Date, "%m/%d/%Y")
df1$Item.Total = as.numeric(gsub("\\$", "", df1$Item.Total))
df1$Item.Subtotal = as.numeric(gsub("\\$", "", df1$Item.Subtotal))
df1$Item.Subtotal.Tax = as.numeric(gsub("\\$", "", df1$Item.Subtotal.Tax))
df1$Total.Promotions = as.numeric(gsub("\\$", "", df1$Total.Promotions))
head(df1)

#Summary Statistics of Item Total
sum(df1$Item.Total)
mean(df1$Item.Total)
median(df1$Item.Total)
max(df1$Item.Total)
min(df1$Item.Total)
sd(df1$Item.Total)

#New Data Frame that Groups Orders by Date
df2 <- aggregate(df1[, c(2, 3, 4, 5)], by=df1["Order.Date"], sum)

#New Data Frame that Adds Month Column
df3 <- cbind(df1, month = format(as.Date(df1$Order.Date, "%d/%m/%Y"), "%b"))

#New Data Frame that Groups Orders by Month
dfmonthly <- aggregate(df3[, c("Item.Total")], by=df3["month"], sum)

#Summary Statistics of Order Total by Month
aggregate(df3[, c(5)], by=df3["month"], sum)
aggregate(df3[, c(5)], by=df3["month"], mean)
aggregate(df3[, c(5)], by=df3["month"], median)
aggregate(df3[, c(5)], by=df3["month"], max)
aggregate(df3[, c(5)], by=df3["month"], min)
aggregate(df3[, c(5)], by=df3["month"], sd)

#Pie Chart of Total Item Total by Month
pie(dfmonthly$x, dfmonthly$month, main = "Pie Chart of Total Item Total by Month")

#Barplot of Item Total by Date
barplot(df2[, c(5)], main = "Barplot of Item Total by Date", xlab = "Date", ylab = "Item Total")

#Barplot of Item Total by Month
barplot(dfmonthly$x, names.arg = dfmonthly$month, main = "Barplot of Item Total by Month", xlab = "Month", ylab = "Item Total")

#Using Tidyverse to Prepare the Data -> Collapses "Item.Subtotal" & "Item.Subtotal.Tax" into Key-Value Pairs in New Data Frame
dfplot <- df2 %>%
  select(Order.Date, Item.Subtotal, Item.Subtotal.Tax) %>%
  gather(key = "variable", value = "value", -Order.Date)
head(dfplot)

#Using ggplot to Create Multiple Line Comaprison of Item Subtotal & Item Subtotal Tax
ggplot(dfplot, aes(x = Order.Date, y = value)) + 
  geom_line(aes(color = variable, linetype = variable)) + 
  scale_color_manual(values = c("darkred", "steelblue")) +
  xlab("Order Date") + ylab("Value in $") +
  ggtitle("Multiple Line Comparison of Item Subtotal & Item Subtotal Tax")
