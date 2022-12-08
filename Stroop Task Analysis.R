library(magrittr)
library(dplyr)
library(ggplot2)

stroopdat <- readr::read_csv("Stroop_agg.csv")

quantile(stroopdat$rt)

stroopdat <- stroopdat %>% filter(., trialtype == "congruent")


view(stroopdat <- stroopdat %>%
  group_by(id) %>%
  mutate(q25 = quantile(stroopdat$rt, 0.25)) %>%
  filter(rt <= q25))

# A really basic boxplot.
ggplot(stroopdat, aes(x =id, y=rt)) + 
  geom_boxplot(fill="skyblue", alpha=0.2) +
  geom_jitter(color="black", size=1, alpha=0.9)