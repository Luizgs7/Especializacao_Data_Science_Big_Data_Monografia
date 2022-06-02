library(ggplot2)
library(dplyr)
library(tidyr)
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


#setwd("..")
data_results <- read.csv(".\\data\\01_results.csv", sep=";")
data_results = data_results %>%
  mutate(roc_auc = as.numeric(gsub(",", ".", roc_auc)))


str(data_results)
sum(data_results$roc_auc, na.rm=T)

data_results_new = data_results %>%
                    drop_na(roc_auc) %>%
                    group_by(dataset,paid_free) %>%
                    mutate(rank_paid_free = as.integer(factor(roc_auc))) %>%
                    #mutate(rank_paid_free = order(roc_auc , decreasing=TRUE)) %>%
                    ungroup() %>%
                    group_by(dataset) %>%
                    mutate(rank_dataset = as.integer(factor(roc_auc))) %>%
                    #mutate(rank_dataset = order(roc_auc , decreasing=TRUE)) %>%
                    ungroup()

# Pontos por tipo
data_results_new  %>% filter(dataset=='adult') %>% arrange(rank_dataset)
data_results_new %>%
  group_by(paid_free) %>%
  summarise(Frequency = sum(rank_paid_free))

# Pontos por tipo + framework
data_results_new %>%
  group_by(framework, paid_free) %>%
  summarise(Frequency = sum(rank_paid_free))
