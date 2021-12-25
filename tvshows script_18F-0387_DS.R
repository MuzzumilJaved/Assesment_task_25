
library(tidyverse)
tvshows=read.csv('C:/Users/Muzzumil/Downloads/tv_shows.csv')



duplicate_func=tvshows[!duplicated(tvshows$Title),]
#dup[dup$Rotten.Tomatoes=='']
#dup$Rotten.Tomatoes=gsub('','0',dup$Rotten.Tomatoes)
#dup$IMDb=gsub('','0',dup$IMDb)
#dup$IMDb <- ifelse(nchar(dup$IMDb)=="", "0", dup$IMDb)



duplicate_func$Rotten.Tomatoes=as.numeric(dup$Rotten.Tomatoes)

typeof(bar)
no_na=duplicate_func[which(duplicate_func$IMDb!=""),]
no_na=no_na[which(no_na$Rotten.Tomatoes!=""),]
class(duplicate_func$IMDb)


bar=no_na[8:11]
bar=data.frame(sum(bar$Netflix),sum(bar$Hulu),sum(bar$Prime.Video),sum(bar$Disney.))

bar=as.numeric(unlist(bar))

 barplot(bar , border=F , names.arg=c('netflix','hulu','prime video','disney') , 
                  las=2 , 
                  col=c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6) , rgb(0.3,0.9,0.4,0.6) ,  rgb(0.3,0.9,0.4,0.6)) , 
                  ylim=c(0,2000) , 
                  main="" )

 
 
library(ggplot2)
library(dplyr)

ggplot(data, aes(x=c('netflix','hulu','prime video','disney'), y=, fill=c('netflix','hulu','prime video','disney'))) + geom_violin() 

library(ggplot2)
library(hrbrthemes)

ggplot(no_na, aes(x=no_na$IMDb, y=no_na$Rotten.Tomatoes, color=no_na$IMDb)) + 
  geom_point(size=2) +
  theme_ipsum()
