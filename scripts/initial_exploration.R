# Week 1: Initial Data Exploration ====
# Author: [Your Name]
# Date: [Today's Date]

# Load packages ====
library(tidyverse)
library(here)
library(naniar)
library(janitor)
library(skimr)
# Load data ====
mosquito_egg_raw <- read_csv(here("data", "mosquito_egg_data.csv"),
                             name_repair = janitor::make_clean_names)

# Basic overview ====
glimpse(mosquito_egg_raw)
summary(mosquito_egg_raw)
skim(mosquito_egg_raw)

# React table====
# view interactive table of data
view(mosquito_egg_raw)


# Counts by site and treatment====

mosquito_egg_raw |> 
  group_by(site, treatment) |> 
  summarise(n = n())

# Observations ====
# Your observations (add as comments below):
# - What biological system is this?
#   
# - What's being measured?
#   the eggs laid and the eggs hatched 
# - How many observations?
#   205
# - Anything surprising?
#   the script being able to create a table that quickly 
# - Any obvious problems?
# none that i can see 

# FIX 1: [Issue description] ====

# Show the problem:missing data

summary(mosquito_egg_data)
#shows the number of NAs

# Fix it:
mosquito_egg_data_step1 <- mosquito_egg_raw |>
  # YOUR CODE HERE
  mosquito_egg_data|> 
  drop_na()

   # Verify it worked:
  # [Code to check change happened]
summary(mosquito_egg_data)
  
  # What changed and why it matters:
  # [2-3 sentences explaining consequences]
  # not much changed.. the code to remove the rows with NAs did not seem to work
  
  
  # FIX 2: [Issue description] strings in the treatment column 

# Show the problem:
# [Code]
# 3 names in treatment column
mosquito_egg_data |> str_detect(treatment) 

# Fix it:
mosquito_egg_data_step2 <- mosquito_egg_data_step1 |>
  # YOUR CODE
  
  
  # Verify it worked:
  # [Code]
  
  # What changed and why it matters:
  # [2-3 sentences]
  #