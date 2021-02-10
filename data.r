#PDFA Assignment
#Lim Zheng Yu
#TP051131

#Import data
filepath = 'C:/Users/HP/Documents/R-ass/4.Hourlyweatherdata.csv'
data = read.csv(filepath)


#Attach Library
library(ggplot2)
library(dplyr)

#summary of dataset
summary(data)

#Pre Processing
#Drop Year Column
data = select (data,-c(year))

#change time_hour column data type to time 
data$time_hour = strptime(data$time_hour,'%d/%m/%Y %H:%M')

#analysis example 1
#analysis in temperature
#In this example, an analysis between X and Y is given to analysis the Histogram of Temperature
#declaration
month = facet_wrap(~month)

#Visualization and exploration
output = ggplot(data, 
              mapping = aes(x = temp)) + 
              geom_histogram() + 
              labs(title = 'Histogram of Temperature',
              x = 'Temperature')

#output
output + month

#analysis example 2
#In this example, an analysis between X and Y is given to analyze the temperature in each month
#visualization and exploration
output = ggplot(data, 
                mapping = aes(x = month, y = temp, color = origin)) 
                + geom_boxplot() + 
                labs(title = 'Temperature in each Month',
                x = 'Month', 
                y = 'Temperature')

#output
output

#analysis example 3
#In this example, an analysis between X and Y is given to analyze Dew Points against temperature
#declaration
line = stat_smooth(method = "lm")

#visualization and exploration
output = ggplot(data = data, mapping = aes(x = temp, y = dewp, color = origin)) + geom_point(alpha = 0.15)+ line + labs(title = 'Dew Point against Temperature', x = 'Temperature ', y = 'Dew Point')

#output
output

#analysis example 4
#analysis Dew point against humid
#In this example, an analysis between X and Y is given to
#declaration
line = stat_smooth(method = "lm")

#visualization and exploration
output = ggplot(data = data, mapping = aes(x = dewp, y = humid, color = origin)) + geom_point(alpha = 0.15)+ line + labs(title = 'Scatter Plot of Dew Point against Humid',x = 'Dew Point ', 
                                                                                                                         y = 'Humidty %')

#output
output

#analysis example 5
#analysis precipitate data
#In this example, an analysis between X and Y is given to
#visualization and exploration
output = ggplot(data = data, mapping = aes(x = precip)) + geom_histogram() + labs(title = 'Histogram of Precipitate', x = 'Precipitate (Volume)', y = 'Amount')

#output
output

#analysis example 6
#In this example, an analysis between X and Y is given to analysis precipitate per month
#visualization and exploration
output = (
  data %>%
    filter(data$precip>0) %>% #data manipulation to filter the data
    ggplot(mapping = aes(x = factor(month), y = precip)) +  geom_boxplot() + labs(title = 'Precipitate per Month',x = 'Month', y = 'Precipitate')
)
output

#analysis example 7
#In this example, an analysis between X and Y is given to analyze in visibility in miles
#visualization and exploration
output = ggplot(data = data, mapping = aes(x =visib)) + geom_histogram() + labs(title = 'Histogram of Visibility', x = 'Visibility (Miles)',y = 'Amount')

#output
output

#analysis example 8
#analysis humid and visibility in miles
#In this example, an analysis between X and Y is given to
#visualization and exploration
output = ggplot(data = data, mapping = aes(x = factor(visib), y = humid)) + geom_boxplot() + labs(title = 'Boxplot of Humid against Visibility', x = 'Visibility', y = 'Humid')
#output
output

#analysis example 9
#analysis precipitate and visibility
#In this example, an analysis between X and Y is given to
output = (
  data %>%
    filter(data$precip>0) %>% #data manipulation
    ggplot(mapping = aes(x = factor(visib), y = precip)) + geom_boxplot() + labs(title = 'Boxplot of Precipitate against visibility',x = 'visibility (Miles)', y = 'Precipitate (Inch)')
)
#output
output

#analysis example example rks
#In this example, an analysis between X and Y is given to
#analysis precipitate against humid 
line = stat_smooth(method = "lm")
output = ggplot(data = data, mapping = aes(x = humid, y = precip, color = origin)) + geom_point(alpha = 0.15) + line + labs(title = 'Scatter Plot of Precipitate against temp',
                                                                                                                            x = 'Humid ', y = 'Precipitate (Inch)')
#output
output
#analysis example 10
#In this example, an analysis between X and Y is given to
#analysis precipitate against humid 
line = stat_smooth(method = "lm")
output = ggplot(data = data, mapping = aes(x = temp, y = precip, color = origin)) + geom_point(alpha = 0.15) + line + labs(title = 'Scatter Plot of Precipitate against Humid',
                                                                                                                            x = 'Humid ', y = 'Precipitate (Inch)')
#output
output

#analysis example 11
#In this example, an analysis between X and Y is given to
#analysis pressure per month
output = ggplot(data = data, mapping = aes(x = factor(month), y = pressure, na.rm = TRUE)) + geom_boxplot() + labs(title = 'BoxPlot of Pressure against Month',x = 'Month '
                                                                                                                   , y = 'Pressure (Milibars)')
#output
output

#analysis example 12
#In this example, an analysis between X and Y is given to
#analysis pressure against temperature
line = stat_smooth(method = "lm")
output = ggplot(data = data, mapping = aes(x = temp, y = pressure, color = origin, na.rm = TRUE)) + geom_point(alpha = 0.15)+ line + labs(title = 'Scatter Plot of Pressure against Temperature'
                                                                                                                                          ,x = 'Temperature ', y = 'Pressure (Milibars)')
#output
output

#analysis example 13
#In this example, an analysis between X and Y is given to
#analysis wind speed data
airport = facet_wrap(~origin)
#visualization and exploration
output = ggplot(data = data, mapping = aes(x = wind_speed, na.rm = TRUE)) + geom_histogram() + labs(title = 'Histogram of Wind speed',x = 'Wind speed (MPH)') + airport
#output
output

#analysis example 14
#In this example, an analysis between X and Y is given to compare Wind Gust against Wind Speed
line = stat_smooth(method = "lm")
#visualization and exploration
output = ggplot(data = data, mapping = aes(x = wind_speed, y = wind_gust, na.rm = TRUE, color = origin)) + geom_point(alpha = 0.15)+ line + labs(title = 'Scatter Plot of Wind Gust against Wind Speed'
                                                                                                                                                 ,x = 'Wind Speed (MPH)', y = 'Wind Gust (MPH)')
#output the result
output

#Extra Analysis Example 1
#for this example, the scatter plot with histogram is plot to get the relationship between dew point and temperature
library(ggExtra)
g = ggplot(data = data, mapping = aes(temp, dewp, color = origin)) + geom_count() + geom_smooth(method="lm", se=F)
ggMarginal(g, type = "histogram", fill="transparent")

#Extra Analysis Example 2
#In this extra features, this will visualize the density of pressure for each month
ggplot(data = data, mapping = aes(x = factor(month), y = pressure, na.rm = TRUE)) + geom_violin() + labs(title="The Density of Pressure for each Month'", x="Month", y="Pressure")



