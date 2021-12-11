BPRS1 <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS1 <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep = "\t", header = T)


#Assigning datasets to data folder

write.table(BPRS1, "data/BPRS.txt")
write.table(RATS1, "data/RATS.txt")







library(tidyverse)
library(dplyr)
RATS1$Group <- as.factor(RATS1$Group)
RATS1$ID <- as.factor(RATS1$ID)
BPRS1$treatment<- as.factor(BPRS1$treatment)
BPRS1$subject <- as.factor(BPRS1$subject)
str(RATS1)
str(BPRS1)



BPRS1.long <- BPRS1 %>% pivot_longer(cols = starts_with("week"), names_to = "Time")
BPRS1.long <- BPRS1.long %>% mutate(week = as.integer(substr(Time,5,5)))
BPRS1.long  


RATS1.long <- RATS1 %>% pivot_longer(cols = starts_with("WD"), names_to = "Time")
RATS1.long <- RATS1.long %>% mutate(WD = as.integer(substr(WD,3,5)))
RATS1.long

str(RATS1.long)
str(BPRS1.long)

#If I understood the assignment right, the content look more grouped now. 
#Now we have table showing each variable and its content side by side. 
#However, before we did the changes, this was not the case. 
#for example, it started with value of WD1 followed by other values of for example WD2 and so on. 
#So the reader must have known that after WD1 comes the value for WD2. Now, you can see all that at one glance.
