## Packages
library(plyr)
library(caTools)
library(dplyr)
library(chron)
library(arules)
library(arulesViz)
library(ggplot2)
library(lattice)

## Set working directory 
setwd("C:\\Users\\TMccw\\OneDrive\\DataScience\\Data Mining\\GitHub\\pdti_local\\Lab_3")

# List files in wd
list.files()

## Bring in data 
df <- data.frame(read.csv("data_cleaned.csv"))
attach(df)

#########
## EDA ##
#########

  # Find all NA's
row.has.na <- apply(df, 1, function(x){any(is.na(x))})
sum(row.has.na)

  # Exploring data
dim(df) # dimensions of the df
head(df) # first few rows in the df
str(df)  # descrption of each column
summary(df) # summary stats 

##################
## Ploting Data ##
##################

# Histograms
hist(customer_id, col = "green", xlab = "Customer ID")
hist(month_sold, col = "blue", main = "Items sold per Month", xlab = "Month Sold", xlim = c(1,12), breaks = 12)
hist(day, main = "Items sold per Day", col = "red", xlab = "Day Sold", xlim = c(1,31), breaks = 31)
hist(day_of_year, main = "Histogram of Days of the Year", 
     col = "orange", xlab = "Day of the Year", xlim = c(1,365), 
     breaks = 365)

plot(price_groups)
plot(quantity_groups)
plot(Country)

C <- ggplot(df) + geom_bar(aes(Country)) + 
  scale_y_continuous(limits = c(0,495478)) + 
  coord_flip()

# Pie Charts

# Month sold
counts = table(month_sold)  ## get counts
names(counts) <- c("January - 35,147", "Feburary - 27,707", "March - 36,748",
                   "April - 29,916", "May - 37,030", "June - 36,874", "July - 39,518", 
                   "August - 35,284", "September - 50,226", "October - 60,742",
                   "November - 84,711", "December - 68,006")
pie(counts, main = "Frequency of Purchases per Month", col = c("purple", "violetred1", "green3","cornsilk", 
                                                  "cyan", "white", "red", "blue","orange", 
                                                 "yellow", "brown", "pink"))  

# Price Groups
counts2 = table(price_groups)
names(counts2) <- c("", "Price Level 1 - 113,124", "Price Level 2 - 119,971", "Price Level 3 - 93,042", 
                    "Price Level 4 - 123,061", "Price Level 5 - 92,709")
pie(counts2, main = "Frequency of Price Levels (1-5)", col = c("cornsilk","purple", "yellow", 
                                                               "cyan", "white", "red")) 

# Quantity Groups
counts3 = table(quantity_groups)
names(counts3) <- c("","Quantity Level 1 - 158,850", "Quantity Level 2 - 81,829", 
                    "Quantity Level 3 - 128,230", "Quantity Level 4 - 102,972",
                    "Quantity Level 5 - 70,027")
pie(counts3, main = "Frequency of Quantity Levels (1-5)", col = c("purple", "yellow", 
                                                               "orange", "blue", "green")) 



#################################
#### Association Rule Mining ####
#################################

  # run the apriori algorithm
isets <- apriori(df, parameter=list(minlen = 2, support=0.05, conf = 0.8))

  # sort and display frequent itemsets 
isets <- sort(isets, by="support") 
inspect(head(isets, n=10))
length(isets)

  # get maximal itemsets
is_max <- isets[is.maximal(isets)]
inspect(head(sort(is_max, by="support")))
length(is_max)

# 1. ################################################################################

  # generate some rules from the frequent itemsets
rules <- apriori(df, parameter = list(minlen=2,supp=0.05, conf=0.8))
inspect(head(rules, n=10))
quality(head(rules))

rules <- sort(rules, by="lift")
inspect(head(rules, n=10))
interestMeasure(rules[1:10], method=c("phi", "gini"), trans=trans)

plot(rules)   
plot(rules, method="grouped matrix")
inspect(rules)
length(rules)

# 2. ###############################################################################

  # generate some rules from the frequent itemsets
rules <- apriori(df, parameter = list(minlen=2,supp=0.1, conf=0.8))
inspect(head(rules, n=10))
quality(head(rules))

rules <- sort(rules, by="lift")
inspect(head(rules, n=10))
interestMeasure(rules[1:10], method=c("phi", "gini"), trans=trans)

plot(rules)   
plot(rules, method="grouped matrix")
inspect(rules)
length(rules)

# 3. ###############################################################################

  # generate some rules from the frequent itemsets
rules <- apriori(df, parameter = list(minlen=2,supp=0.15, conf=0.85))
inspect(head(rules, n=10))
quality(head(rules))

rules <- sort(rules, by="lift")
inspect(head(rules, n=10))
interestMeasure(rules[1:10], method=c("phi", "gini"), trans=trans)

plot(rules)   
plot(rules, method="grouped matrix")
inspect(rules)
length(rules)

# 4. ###############################################################################

  # generate some rules from the frequent itemsets
rules <- apriori(df, parameter = list(minlen=2,supp=0.2, conf=0.85))
inspect(head(rules, n=10))
quality(head(rules))

rules <- sort(rules, by="lift")
inspect(head(rules, n=10))
interestMeasure(rules[1:10], method=c("phi", "gini"), trans=trans)

plot(rules)   
plot(rules, method="grouped matrix")
inspect(rules)
length(rules)

# 5. ###############################################################################

  # generate some rules from the frequent itemsets
rules <- apriori(df, parameter = list(minlen=2,supp=0.01, conf=0.8))
inspect(head(rules, n=10))
quality(head(rules))

rules <- sort(rules, by="lift")
inspect(head(rules, n=10))
interestMeasure(rules[1:10], method=c("phi", "gini"), trans=trans)

plot(rules)   
plot(rules, method="grouped matrix")
inspect(rules)
length(rules)