#working with ggplot2 diamond data

#Color Rank "D is best & J is worst" 
#Quality of the cut from fair - ideal
#Clarity "I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))"

#first, lets find out the distribution price of diamonds
ggplot(data=diamonds,aes(price))+geom_histogram()
#Average of the diamonds price is around $3933, with min $326 (ideal& premium cut) and max $18823 (premium cut)

#and lets see the distribution of each cut
ggplot(data=Diamonds,aes(cut))+geom_histogram()

#from the data collected, most of our data is from ideal, premium, very good, good & fair

#Next, let's see different average price for diamonds by color
#to check how does the average price looks like if we sort by color? 
ggplot(data=diamonds,aes(color,price))+geom_boxplot(aes(color=color))

#Why does the average price for F-J is higher than D-E?
#Let's plot by cut 
ggplot(data=diamonds,aes(cut,price))+geom_boxplot(aes(color=cut))

#Interesting to see that the average price for ideal cut is lower than the rest
#What could be the explanation?
#Let's look at the average price/carat
Diamonds <-diamonds%>%mutate(avg_carat=price/carat)
ggplot(data=Diamonds,aes(color,avg_carat))+geom_boxplot(aes(color=color))

#when we look at the boxplot now, the average/carat for each of the color looks similar. Let's check by cut 
ggplot(data=Diamonds,aes(cut,avg_carat))+geom_boxplot(aes(color=cut))

#by_cut price for ideal is still lower than the rest. so let's plot a point graph to see by cut & color
ggplot(data=Diamonds,aes(carat,avg_carat))+geom_point(aes(color=color))+facet_wrap(cut~color)

#Let's deep dive into ideal data set
Diamonds%>%ggplot(aes(carat))+geom_histogram()+facet_wrap(.~cut)
#majority of ideal cut is from small carat,
#let's do the same plot to see if majority of ideal cut prices falls below $5K
Diamonds%>%ggplot(aes(price))+geom_histogram()+facet_wrap(.~cut)

#from the plot, it confirms - thus this could explain as the ideal diamonds are mostly from small carat
#thus the avg_price for this ideal cut is lower than the rest of the other cuts

