library(magrittr)
library(dplyr)

stroopdat <- readr::read_csv("Stroop_agg.csv")

quantile(stroopdat$rt)

stroopdat <- stroopdat %>% filter(., trialtype == "congruent")

view(stroopdat)

view(stroopdat <- stroopdat %>%
  group_by(id) %>%
  mutate(q25 = quantile(stroopdat$rt, 0.25)) %>%
  filter(rt <= q25))


