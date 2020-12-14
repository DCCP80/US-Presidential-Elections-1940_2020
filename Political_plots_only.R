#set working directory
setwd("C:/Users/dca80/Desktop/DATA/R_DATA")
#Read the .csv file
election<-read.csv('2020_election_results.csv')

library(tidyverse)
library(gganimate)
library(ggplot2)
library(gifski)
library(gridExtra)
library(plotly)
library(ggrepel)

#popular vote and sums
Popular_Vote<-ggplot(data=election)+
  geom_line(aes(x=YEAR,y=REP_PV),color="red")+
  geom_line(aes(x=YEAR,y=DEM_PV),color="blue")+
  geom_line(aes(x=YEAR,y=SUM_PV),color = "black")+
  geom_point(aes(x=YEAR,y=REP_PV),color="red")+
  geom_point(aes(x=YEAR,y=DEM_PV),color="blue")+
  geom_point(aes(x=YEAR,y=SUM_PV),color = "black")+
  geom_text_repel(aes(x=YEAR,y=SUM_PV,label=Person,vjust=0))+
  ylab("Total Popular Votes")+
  xlab("")+
  scale_y_continuous(breaks = seq(0,160000000, by = 20000000), labels = function(n){format(n,scientific = FALSE)})+
  ggtitle("Popular Votes from \n 1940 - 2020")+
  ggthemes::theme_igray()+
  scale_x_continuous(breaks = seq(1940,2020, by=8))
Popular_Vote
#Electoral Vote
Electoral_Vote<-ggplot(data=election)+
  geom_line(aes(x=YEAR,y=REP_EV),color="red")+
  geom_line(aes(x=YEAR,y=DEM_EV),color="blue")+
  geom_line(aes(x=YEAR,y=SUM_EV),color = "black")+
  geom_point(aes(x=YEAR,y=REP_EV),color="red")+
  geom_point(aes(x=YEAR,y=DEM_EV),color="blue")+
  geom_point(aes(x=YEAR,y=SUM_EV),color = "black")+
  geom_text(aes(x=YEAR,y=REP_EV,label=REP_EV,vjust=1))+
  geom_text(aes(x=YEAR,y=DEM_EV,label=DEM_EV,vjust=1))+
  ylab("Electoral Votes")+
  xlab("")+
  ggtitle("Electoral Votes from \n 1940 - 2020")
Electoral_Vote
grid.arrange(Popular_Vote,Electoral_Vote,ncol=2)

