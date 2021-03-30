# Install package 
install.packages("ggplot2")

#Loading required packages
library (ggplot2)

#Load the data 
dat<-read.csv("g/jg.csv")

#Explore the data (looking at the data) 
str(dat)


ggplot(data = dat, aes(x= pop, y = height..cm., color = factor(rate)))+
  geom_jitter()+
  geom_boxplot()

ggplot(data = dat, aes(x= pop, y = height..cm., color = factor(bench)))+
  geom_jitter()+
  geom_boxplot()



ggplot(data = dat, aes(x= pop, y = leafno., color = factor(rate)))+
  geom_jitter()+
  geom_boxplot()

ggplot(data = dat, aes(x= pop, y = leafno., color = factor(bench)))+
  geom_jitter()+
  geom_boxplot()


#Bind the plot to specific data frame using the data arugment 
ggplot(data = stops_county)

#Define aesthetics
ggplot(data = stops_county, aes(x = pct_black_stopped, y = pct_white_stopped))

#add "geoms" - a graphical representation of the data in the plot(points, lines, bars)
ggplot(data = stops_county, aes(x = pct_black_stopped, y = pct_white_stopped))+
  geom_point()

#Now lets try with some other geom* 
ggplot(data = stops_county, aes(x = pct_black_stopped, y = pct_white_stopped))+
  geom_line()

#Lets make points more clear
MS_plot<-ggplot(data = stops_county, aes(x = pct_black_stopped, y = pct_white_stopped))+
  geom_point(alpha = 0.5, color = "blue")
MS_plot

#New layer 
MS_plot+
  geom_abline(intercept = 0, color = "red", linetype = "dashed")

#Regression line 
MS_plot+
  geom_smooth()

#Zoom in the range and define the x and y limits by just adding +
MS_plot+
  geom_abline(intercept = 0)+
  scale_x_continuous(limits= c(0,0.1))+
  scale_y_continuous(limits =c (0, 0.1))

#Themes in the ggplot (Show the different themes in the ggplot)
plot<-MS_plot+
  geom_abline(intercept = 0)+
  scale_x_continuous(limits= c(0,0.1))+
  scale_y_continuous(limits =c (0, 0.1))+
  theme_bw()
plot

#Titles and X and Y axis labels 
plot+
  labs (title = "Overview of the police stop among whites and blacks", 
        x= "Precentage of Black stopped", 
        y= "Precentage of white stopped")

#Specify the color, size and angle 
plot+
  labs (title = "Overview of the police stop among whites and blacks", 
        x= "Precentage of Black stopped", 
        y= "Precentage of white stopped")+
  theme(axis.text.x = element_text(color = "grey40", size = 12, angle = 90, hjust=.5, vjust = .5),
        axis.text.y = element_text(color = "grey40", size = 12, angle = 90, hjust=.5, vjust = .5),
        text = element_text(size=15)) #change the colors 


#############################Univariate distributions#########################

#load new data 
stops<-read.csv("g/MS_stops.csv")

#look at the data 
head(stops)
str(stops)

#Discerte varaibles 
ggplot(stops, aes(violation))+
  geom_bar()

#fill the bars 
ggplot(stops, aes(violation))+
  geom_bar(fill = "red")

#Based on the condition 
ggplot(stops, aes(violation))+
  geom_bar(aes(fill = driver_gender))

#Based on the proporations to tell 0 and 1
ggplot(stops, aes(violation))+
  geom_bar(aes(fill = driver_gender), position = "fill")

#Axis and title 
#We can use the same code as mentioned above for scatter plots 
ggplot(stops, aes(violation))+
  geom_bar(aes(fill = driver_gender), position = "fill")+
labs (title = "Proporation of male and female drivers violations", 
      x= "Violation", 
      y= "Proporation")+
  theme(axis.text.x = element_text(color = "grey40", size = 12, angle = 0, hjust=.2, vjust = .2),
        axis.text.y = element_text(color = "grey40", size = 12, angle = 0, hjust=.2, vjust = .2),
        text = element_text(size=15)) #change the colors 


############################Box-plots###############################

#new package
library(dplyr)

#Subsetting just for one county 
Chickasaw_stops <- filter(stops, county_name == "Chickasaw County")

#Box-plots
ggplot(data = Chickasaw_stops, aes(x = violation, y = driver_age)) +
  geom_boxplot()


#Adding poinst to have better understanding of measurments and their distribution 
ggplot(data = Chickasaw_stops, aes(x = violation, y = driver_age)) +
  geom_boxplot() +
  geom_jitter()


#Clean it up by using alpha
ggplot(data = Chickasaw_stops, aes(x = violation, y = driver_age)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.5, color = "tomato")

#Bring box-plots before 
ggplot(data = Chickasaw_stops, aes(x = violation, y = driver_age)) +
  geom_jitter(alpha = 0.5, color = "tomato")+
  geom_boxplot(alpha = 0) 

#Themes 

#color boxplots 
ggplot(data = Chickasaw_stops, aes(x = violation, y = driver_age, fill = violation)) +
  geom_boxplot()+
  theme_bw()

#Show how to add x and y axis text 

#save the plot 
  
