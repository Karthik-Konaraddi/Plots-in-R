#Reading data in R
weight_loss=read.csv("C:/Users/kkonar2/OneDrive - University of Illinois at Chicago/Documents/R Projects/Data Mining/Assignment 1/weightLoss.csv")
df=data.frame(weight_loss)

#Renaming the 1st column to "id"; the 3rd to the 5th columns respectively to "WeightLoss month1", "WeightLoss month2", and "WeightLoss month3"; and the 6th to the 8th columns to "SelfEsteem month1", "SelfEsteem month2", "SelfEsteem month3", respectively
colnames(df)[1:2]<-c("id","group")
colnames(df)[3:5]<-c("WeightLoss month1","WeightLoss month2","WeightLoss month3")
colnames(df)[6:8]<-c("SelfEsteem month1", "SelfEsteem month2", "SelfEsteem month3")
weight_loss_new<-df


#Using the melt() function from the "Reshape2" package to reshape the dataset based on the WeightLoss month variables into a single column. 
#Using "id" and "group" as the "id variables".Let's call this reshaped data frame "wl.data".
library(reshape2)
melt(weight_loss_new)
w1.data<-melt(weight_loss_new,id.vars =c("id","group"),measure.vars = c("WeightLoss month1","WeightLoss month2","WeightLoss month3") )

#Renaming the 3rd and 4th columns of wl.data to "WeightLoss Month" and "WeightLoss".
colnames(w1.data)[3:4]<-c("WeightLossMonth","WeightLoss")

#This time using the melt() function to reshape the data based on "SelfEsteem month" variables.
#Lets Call this dataset "we.data". Rename the 3rd and 4th columns of we.data to "SelfEsteem Month" and "SelfEsteem Score".
melt(weight_loss_new)
we.data<-melt(weight_loss_new,id.vars =c("id","group"),measure.vars = c("SelfEsteem month1","SelfEsteem month2","SelfEsteem month3") )
colnames(we.data)[3:4]<-c("SelfEsteemMonth","SelfEsteemScore")


#Combining the two datasets "wl.data" and "we.data" and calling the new dataset as "data.long". and making sure each column is repeated once.
data.long <- cbind(w1.data,we.data[,c("SelfEsteemMonth","SelfEsteemScore")])


#Using the Weight Loss (pounds) as a categorical data and getting the weight loss frequencies by groups.
library(dplyr)
w1.data %>% group_by(WeightLoss) %>% summarise(n=n())
View(y)

#Using the dataset "data.long" and the ggplot() function from "ggplot2" package to create the following histogram.
library(ggplot2)
ggplot(data.long)+
  geom_histogram(mapping=aes(x=WeightLoss,fill=factor(group)))+
  ggtitle("Weight Loss by Group within 3 months")+
  scale_x_continuous(breaks = 1:10)+
  geom_line( mapping=aes(x=WeightLoss,y=SelfEsteemScore,group = WeightLoss))+
  geom_point( mapping=aes(x=WeightLoss,y=SelfEsteemScore,color="blue",group = WeightLoss))+
  facet_grid(WeightLossMonth~group)+
  theme(legend.position = "bottom",panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank(),legend.box = 'vertical',plot.title = element_text(hjust = 0.5) )+
 scale_fill_discrete(name = "Group")

# Using the "weightLoss.data" and the ggplot() function to produce scatter plot below.
ggplot(weight_loss,aes(x=wl1, y=se1)) + 
  geom_point(aes(color=group)) + 
  facet_grid(cols = vars(group))+
  ggtitle("Weight Loss vs. Self-Esteem - Month 1")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="Weight Loss", y="Self-EsteemScore")

#Generated similar scatter plots for "Weight Loss vs Self-Esteem - Month 2" and "Weight Loss vs Self-Esteem - Month 3".
ggplot(weight_loss,aes(x=wl2, y=se2)) + 
  geom_point(aes(color=group)) + 
  facet_grid(cols = vars(group))+ 
  ggtitle("Weight Loss vs. Self-Esteem - Month 2")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="Weight Loss", y="Self-Esteem Score")

ggplot(weight_loss,aes(x=wl3, y=se3)) + 
  geom_point(aes(color=group)) + 
  facet_grid(cols = vars(group))+ 
  ggtitle("Weight Loss vs. Self-Esteem - Month 3")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="Weight Loss", y="Self-Esteem Score")

#R code that generates the following boxplot for Weight Loss vs. Self-Esteem - Month 1
ggplot() + 
  geom_boxplot(data= weight_loss,mapping = aes(wl1,group))+
  geom_boxplot(data= weight_loss,mapping = aes(se1,group), fill="green4")+
  ggtitle("Weight Loss vs. Self-Esteem - Month 1")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(x="Weight Loss         Self-Esteem Score", y="Group")

#Adding a new variable to the long.data, with the subjects's weight in kilograms (kg) (1 kg = 2.204 pounds).
View(data.long)
data.long %>%
  select(id,WeightLoss)%>%
  mutate(weight_kg = WeightLoss/2.204)
  