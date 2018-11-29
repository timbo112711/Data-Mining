library(arules)
library(arulesViz)
library(dplyr)
library(readr)
library(dplyr)
library(tidyr)
library(arules)
library(arulesViz)
library(methods)
library(tseries)
library(ggplot2)

setwd("~/Dropbox/SMU/7331_mining/pdti_DataMining/Lab_3/")


# import python pre-processed for other mining
df = read.csv('./data_cleaned.csv')

rules <- apriori(df, parameter = list(minlen=2,supp=0.05, conf=0.8))

rules.sorted <- sort(rules, by="lift")

plot(rules.sorted, method="grouped")

head(df)

summary(rules)

items(rules)

inspect(rules)

df_rules <- as(rules,"data.frame")




rules1 <- apriori(df, parameter = list(minlen=2,supp=0.05, conf=0.8))
df_rules1 <- as(rules1,"data.frame")
plot(rules1)

rules1.sorted <- sort(rules1, by="lift")
plot(rules1.sorted, method="grouped")

rules2 <- apriori(df, parameter = list(minlen=2,supp=0.15, conf=0.8))
df_rules2 <- as(rules2,"data.frame")
plot(rules2)

rules3 <- apriori(df, parameter = list(minlen=2,supp=0.05, conf=0.5))
df_rules3 <- as(rules3,"data.frame")
plot(rules3)


rules4 <- apriori(df, parameter = list(minlen=2,supp=0.15, conf=0.8))
df_rules4 <- as(rules4,"data.frame")
plot(rules4)
# market basket data set 

#raw data
orig = read.csv('./online_retail.csv')

# create baskets dataframe
df_baskets <- orig %>% 
  group_by(InvoiceNo,InvoiceDate) %>%
  summarise(basket = as.vector(list(StockCode)))

# compute transactions
transactions <- as(df_baskets$basket, "transactions")

plot.new
hist(size(transactions), breaks = 0:150, xaxt="n", ylim=c(0,250000), 
     main = "Number of Items per basket", xlab = "#Items")
axis(1, at=seq(0,160,by=10), cex.axis=0.8)
mtext(paste("Total:", length(transactions), "baskets,", sum(size(transactions)), "items"))

rules_baskets <- apriori(transactions, parameter = list(minlen=2,supp=0.05, conf=0.8))

rules_baskets.sorted <- sort(rules, by="lift")

inspect(rules_baskets)

df_rules_baskets <- as(rules_baskets,"data.frame")

##ARIMA
orig$daily_rev <- orig$UnitPrice * orig$Quantity

aggdata <-aggregate(orig$daily_rev, by=list(as.Date(orig$InvoiceDate)),
                    FUN=sum, na.rm=TRUE)

ggplot2(orig$daily_rev)

arima(orig$daily_rev)  



ggplot(df, aes(df$day_of_year), df$quantity_groups)) + geom_line() + scale_x_date('month')  + ylab("Daily Bike Checkouts") +
  xlab("")

ggplot()

df$day_of_year


