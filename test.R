#test
#amend
x = rnorm(100,60,5)
plot(density(x))
hist(x,breaks = 10,xlab = "Label 1",ylab = "Label 2")
?hist
x[seq(1,100,2)]
install.packages(dplyr)
library(dplyr)

#matrix
data = round(rnorm(24,40,3))
m1 = matrix(data = data, nrow = 4, ncol = 6) 
m1
df= mtcars
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')], factor)
df$cyl
class(mtcars)
table(df$gear,df$am)
aggregate(. ~ cyl, data = df, mean)
df
df %>% group_by(cyl, gear) %>% summarise(meanwt = mean(wt, na.rm = T), meanmpg =mean(mpg, na.rm = T), maxhp = max(hp))

install.packages(gsheet)
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"
sales3 = as.data.frame(gsheet2tbl(url))
str(sales3)
head(sales3)
dim(sales3)
library(dplyr)
names(sales3)
#find out Loyal Customers, Customers who gave high revenue, High Revenue Part Nos, PartNos which give highest Margin; #top n=2 from each region- total revenue
#parts sold in East and china region

regionSales <- sales3 %>% group_by(region) %>% summarise(MARGIN = sum(margin)) %>% arrange(desc(MARGIN)) %>% head(10)
sales3 %>% group_by(custname) %>% summarise(REVENUE  = sum(revenue, na.rm = T), COUNT = n()) %>% top_n(2,COUNT)

#ggplot----
library(ggplot2)
ggplot(data = regionSales, aes(x=region, y=MARGIN)) + geom_bar(stat = 'Identity')
ggplot(df, aes(x=wt,y=mpg)) +geom_point(aes(color=am, shape=carb,size=hp))
ggplot(df %>% group_by(cyl,gear) %>% summarise(CNT = n()),
       aes(x=cyl,y=CNT),fill=gear) + geom_bar()

ggplot(df, aes(x = gear, y = mpg ,fill = carb)) +geom_boxplot() + facet_grid(am~cyl)
       

