hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
str(hd)
dim(hd)
summary(hd)
str(gii)
dim(gii)
summary(gii)

head(gii)
library(dplyr)
rename(gii, FeseconEdu = Population.with.Secondary.Education..Female.)
names(gii)
names(gii)[7] <- "FeSecondEdu" 
names(gii) [8] <- "MaSecondEdu"
names(gii)
names(gii)[3] <- "AdolesBirRa"
names(gii) [6] <- "ParlamRep"
names(gii) [4] <- "MatMortRatio"
names(gii) [9] <- "LabForParFe"
names(gii) [10] <- "LabForParMa"
names(gii)

gii$edu2F/edu2M = (gii$FeSecondEdu + gii$MaSecondEdu) / 2

human <- filter(n==2, id.m-id.p>650) %>%  
  inner_join(gii,by=c("id.p"="id"),suffix=c("",".p")) %>%
  inner_join(hd,by=c("id.m"="id"),suffix=c("",".m")) %>%

  
