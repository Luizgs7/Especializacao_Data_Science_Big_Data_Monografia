library(ggplot2)
library(dplyr)

getwd()

read.csv(".\\data\\00_data_set_names.csv", sep=";")



setwd("..")
data_results <- read.csv(".\\01_results.csv", sep=";")
data_results %>%
  mutate(roc_auc = as.double(gsub(",", ".", roc_auc))) %>%
  ggplot(aes(x=roc_auc, y=dataset, color=paid_free)) + #framework
  geom_point(alpha=0.6, size=3) +
  theme_minimal()+
  theme(legend.position="bottom")
+
  xlim(0.5,1)


install.packages("qdap")
library("qdap")


# 01/05/2022
sum(character_count(readLines("clipboard", warn = FALSE)), na.rm=T)

sum(character_count(readLines("clipboard", warn = FALSE)), na.rm=T)

sum(character_count(readLines("clipboard", warn = FALSE)), na.rm=T)


