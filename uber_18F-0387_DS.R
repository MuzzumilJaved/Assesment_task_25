
library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(DT)
library(scales)

dataset_of_2014=read.csv('C:/Users/Muzzumil/Downloads/uber.csv')

dataset_of_2014$Date.Time <- as.POSIXct(dataset_of_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S")
dataset_of_2014$Time <- format(as.POSIXct(dataset_of_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S"), format="%H:%M:%S")


dataset_of_2014$Date.Time <- ymd_hms(dataset_of_2014$Date.Time)
dataset_of_2014$day <- factor(day(dataset_of_2014$Date.Time))
dataset_of_2014$month <- factor(month(dataset_of_2014$Date.Time, label = TRUE))
dataset_of_2014$year <- factor(year(dataset_of_2014$Date.Time))
dataset_of_2014$dayofweek <- factor(wday(dataset_of_2014$Date.Time, label = TRUE))


dataset_of_2014$hour <- factor(hour(hms(dataset_of_2014$Time)))
dataset_of_2014$minute <- factor(minute(hms(dataset_of_2014$Time)))
dataset_of_2014$second <- factor(second(hms(dataset_of_2014$Time)))


hour_data <- dataset_of_2014 %>%
  group_by(hour) %>%
  dplyr::summarize(Total = n()) 
datatable(hour_data)


ggplot(hour_data, aes(hour, Total)) + 
  geom_bar( stat = "identity", fill = "steelblue", color = "red") +
  ggtitle("Trips Every Hour") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)

month_hour <- dataset_of_2014 %>%
  group_by(month, hour) %>%
  dplyr::summarize(Total = n())

ggplot(month_hour, aes(hour, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Hour and Month") +
  scale_y_continuous(labels = comma)


day_group <- dataset_of_2014 %>%
  group_by(day) %>%
  dplyr::summarize(Total = n()) 
datatable(day_group)

ggplot(day_group, aes(day, Total)) + 
  geom_bar( stat = "identity", fill = "steelblue") +
  ggtitle("Trips Every Day") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)