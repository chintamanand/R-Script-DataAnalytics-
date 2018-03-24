#question 1

df <- read.csv("C:/Users/mahe/Desktop/latest Lab3/lab3/Online Retail.csv")
#print(df)
retail=data.frame(df)

#question 2

sum_total_items=sum(retail$Quantity[which(retail$Country=="United Kingdom")])
print(sum_total_items)


#question 3
amt=sum((retail$UnitPrice*retail$Quantity)[which(retail$CustomerID=="13744"  & as.Date(retail$InvoiceDate) == "20-02-11")])
print(amt)

#question 4
france=which(retail$Quantity==max(retail$Quantity[which(retail$Country=="France")]))

new_df2=retail[which(retail$Country=="France"),c(1:8)]
new_df=data.frame(new_df2)

next_table=aggregate(new_df$Quantity,by=list(Category=new_df$StockCode), FUN=sum)
stupid=which.max(next_table[,2])
print(next_table[stupid,])

#question 5
relevant=which(as.Date(retail$InvoiceDate)>="31/03/11" & as.Date(retail$InvoiceDate)<="01/07/11")
print(relevant)



