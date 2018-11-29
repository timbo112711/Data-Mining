library(arules)
library(arulesViz)
library(dplyr)

setwd("~/Dropbox/SMU/7331_mining/pdti_DataMining/Lab_3/")

df = read.csv('./data_cleaned.csv')

head(df)

df[] <- lapply(df,as.character)

rules <- apriori(df, parameter = list(minlen=2,supp=0.05, conf=0.8))

rules.sorted <- sort(rules, by="lift")

plot(rules.sorted, method="grouped")

head(df)
