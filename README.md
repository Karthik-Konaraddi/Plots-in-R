# Plots-in-R

**Weight Loss Dataset**

**1. Histogram: depicting the weight loss by groups within 3 months.**

**R Function:** ggplot(data.long)+ geom_histogram(mapping=aes(x=WeightLoss,fill=factor(group)))+
ggtitle("Weight Loss by Group within 3 months")+
scale_x_continuous(breaks = 1:10)+
geom_line( mapping=aes(x=WeightLoss,y=SelfEsteemScore,group = WeightLoss))+
geom_point( mapping=aes(x=WeightLoss,y=SelfEsteemScore,color="blue",group WeightLoss))+
facet_grid(WeightLossMonth~group)+
theme(legend.position = "bottom",panel.grid.minor.x = element_blank(),panel.grid.major.x = element_blank(),legend.box = 'vertical',plot.title = element_text(hjust = 0.5) )+
scale_fill_discrete(name = "Group")
 

![image](https://user-images.githubusercontent.com/15854238/147429051-afc51b4a-26b5-4c8d-9e1f-33578ac506a8.png)





**2. Scatter plot: Weight Loss vs Self Esteem Month 1**

**R Function:** ggplot(weight_loss,aes(x=wl1, y=se1)) + 
                            geom_point(aes(color=group)) + 
                            facet_grid(cols = vars(group))
		 
![image](https://user-images.githubusercontent.com/15854238/147429058-118c3f92-da2a-4df7-ba0d-ed7683a3cb16.png)


**3. Scatter Plot: Weight Loss vs Self Esteem Month 2 and 3**
      
![image](https://user-images.githubusercontent.com/15854238/147429064-160c089a-651e-4d65-bfbb-b5172e29a3a7.png)

![image](https://user-images.githubusercontent.com/15854238/147429077-9bf11801-8902-4cf7-b317-207e27ab7ef6.png)


**4. Boxplot: Weight Loss vs. Self-Esteem - Month 1**

**R Function:** ggplot() + 
     geom_boxplot(data= weight_loss,mapping = aes(wl1,group))+
     geom_boxplot(data= weight_loss,mapping = aes(se1,group), fill="green4")
     
![image](https://user-images.githubusercontent.com/15854238/147429092-c62c890f-97f5-499f-9241-5ceec9166a3e.png)
	 

**5. Added a new variable to the long.data, with the subjects’s weight in kilograms (kg) (1 kg = 2.204 pounds).**

**R Function :mutate (weight_kg = WeightLoss/2.204) #R Function used to create a variable**
      
![image](https://user-images.githubusercontent.com/15854238/147429100-cacf5fe6-1cd3-4e7f-8124-61d962464922.png)


	














