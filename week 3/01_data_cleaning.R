
# Purpose: Clean and prepare parasite co-infection data for analysis ----

# Load packages ----
library(tidyverse)
library(janitor)
library(here)

 # Read data ----
parasites_raw <- read_csv(here("data", "parasites.csv"))

# Examine structure ---
library(skimr)
skimr::skim(parasites_raw)
str(parasites)
#variable types show 3 (character,logical&numerical)
library(naniar)
naniar::vis_miss(parasites_raw)
summary(parasites_raw)
library(skimr)
skimr::skim(penguins_clean_names)
#2% worth of missing data
#mean fish length is 44.46, mean trematode count is 0.3478

# Create infection status variable ---
mutate(parasites,infection_status = ifelse(treatment == "Infected" & tapeworm_present == TRUE,
                                           "Tapeworm",
                                           "Uninfected"))
#appeared in console not in actual data...

parasites <-mutate(parasites,infection_status = ifelse(treatment == "Infected" & tapeworm_present == TRUE,
                                                       "Tapeworm",
                                                       "Uninfected"))

# Hint: Use case_when() or  if_else()
# Make a clean dataframe when happy
# parasites_clean <-

# Check data quality ----
#  # Check for negative values (impossible for mass, length measurements)
parasites |> 
  filter(if_any(c(fish_length_mm, trematode_count, ), 
                ~ . < 0))
parasites <- parasites %>%
  mutate(fish_length_mm = case_when(
    fish_id == "C004" ~ 48.8,
    TRUE ~ fish_length_mm
  ))

# Check ranges of all numeric variables at once
parasites |> 
  summarise(across(where(is.numeric), 
                   list(min = ~min(., na.rm = TRUE),
                        max = ~max(., na.rm = TRUE))))
# Exploratory plot ----
parasites|>
  ggplot(aes(x = fish_length_mm,
             y = trematode_count)) +
  geom_point(alpha = 0.7)
# wrong axes used 
parasites|>
  ggplot(aes(y = fish_length_mm,
             x = trematode_count)) +
  geom_point(alpha = 0.7)
# Save cleaned data ----
# write_csv(here("data", "parasites_clean.csv"))

write_csv(parasites, here("data", "parasites_clean.csv"))
