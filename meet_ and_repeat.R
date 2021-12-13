BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep = "\t", header = T)


#Assigning datasets to data folder

write.table(BPRS, "data/BPRS.txt")
write.table(RATS, "data/RATS.txt")







library(tidyverse)
library(dplyr)
RATS$Group <- as.factor(RATS$Group)
RATS$ID <- as.factor(RAT1$ID)
BPRS$treatment<- as.factor(BPRS$treatment)
BPRS$subject <- as.factor(BPRS$subject)
str(RATS)
str(BPRS)


BPRSL<- BPRS %>% pivot_longer(cols = starts_with("week"), names_to = "Time")
BPRSL <- BPRS.long %>% mutate(week = as.integer(substr(Time,5,5)))
BPRSL  

RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 


str(RATSL)
str(BPRSL)
RATSL

#If I understood the assignment right, the content look more grouped now. 
#Now we have table showing each variable and its content side by side. 
#However, before we did the changes, this was not the case. 
#for example, it started with value of WD1 followed by other values of for example WD2 and so on. 
#So the reader must have known that after WD1 comes the value for WD2. Now, you can see all that at one glance.
