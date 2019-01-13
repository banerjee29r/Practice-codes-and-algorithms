#Xlsx file converted to CSV for convenience.
#Reading CSV file by selection
df<-read.csv(file.choose(),header = T)
df
class(df)
#checking the column names in the data frame.
names(df)
a<-nrow(df)
for (i in a) {df$Annualized.Return.of.bid.winner.this.month=df$Net.amount.recd.by.Bid.winner+sum(df$Amount.returned.to.everyone.in.the.group)}
df$Annualized.benefit.of.bid.winner.this.month= df$Annualized.Return.of.bid.winner.this.month - sum(df$Contribution)
df
library(scales)
total.contribution<-sum(df$Contribution)
df$Annualized.percentage.return.of.bid.winner.this.month<-percent(df$Annualized.Return.of.bid.winner.this.month/total.contribution)
df
b<-df$Annualized.Return.of.bid.winner.this.month[25]
c<-df$Annualized.Return.of.bid.winner.this.month[1]
#What is the Annualized  Return of the person who bids in the last month?
print(paste("The Annualized return of the person who bids in the last month is",b))
#What is the Annualized  Return of the person who bids in the First month?
print(paste("The Annualized return of the person who bids in the first month is",c))
library(dplyr)
#Write an R/Python script which calculates the annualized return of chit fund participant ?- Show the Return % for each month's bid winner.
Sol<-select(df,Month,Annualized.Return.of.bid.winner.this.month,Annualized.percentage.return.of.bid.winner.this.month)
Sol
#Visualization
library(ggplot2)
sp <- ggplot(data=Sol, aes(x=Month, y=Annualized.Return.of.bid.winner.this.month)) + geom_bar(stat="identity")
sp
g1<-sp + geom_hline(yintercept=total.contribution, linetype="dashed", color = "red")+geom_text(aes(0,total.contribution,label = total.contribution, vjust = -1))
g1

install.packages('rmarkdown')
rmarkdown::render('C:/Users/DELL/Documents/assignment1.R')
