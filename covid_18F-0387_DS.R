covid_data=read.csv('C:/Users/Muzzumil/Downloads/country_vaccinations.csv')



summary(covid_data)

table(covid_data$country)
 

table(covid_data$vaccines)


contry=covid_data[which(covid$country!='England' & covid$country!='Scotland'),]


table(covid_data$country)
