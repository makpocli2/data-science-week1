
# Author: [Meg Akpocli]
# Purpose: Analyse effect of tapeworm infection on trematode counts

# Load packages ----
library(tidyverse)
library(performance)
install.packages("performance")
install.packages("emmeans")
library(emmeans)
library(here)
library(broom)
library(MASS)

# Load cleaned data ----
parasites <- read_csv(here("data", "parasites_clean.csv"))

# 1. Linear model (demonstration of failure) ----
lm_model <- lm(trematode_count ~ fish_length_mm + infection_status + fish_length_mm:infection_status,
               data = parasites)
summary(lm_model)
# 2. Poisson GLM - additive model ----
glm_model <- glm(trematode_count ~ fish_length_mm + infection_status, 
                 family = poisson, 
                 data = parasites)
summary(glm_model)
# Check overdispersion
ggplot(parasites, aes(x = fish_length_mm, y = trematode_count, colour = infection_status)) +
  geom_point(size = 3, alpha = 0.6) +
  scale_colour_manual(values = c("orange", "blue")) +
  labs(x = "Fish length (mm)",
       y = "Trematode count") +
  theme_minimal()

# 3. Test interaction ----
glm_interaction <- glm(trematode_count ~ fish_length_mm + infection_status + fish_length_mm:infection_status,
                       family = poisson,
                       data = parasites)
check_overdispersion(glm_interaction)
anova(glm_model, glm_interaction, test = "Chisq")
#the interaction isnt significant as the p value is 0.6859
# Compare models
# [Your code here]

# 4. Address overdispersion ----
glm_quasi <- glm(trematode_count ~ fish_length_mm + infection_status,
                 family = quasipoisson,
                 data = parasites)
check_overdispersion(glm_quasi)
summary(glm_quasi)
#dispersion ration =1.427 and p value=0.005
# 5. Final model selection ----
#as the dispersion ratio is 1.427, the negative binomial isn't need

# 6. Extract results ----
tidy(glm_quasi, exponentiate = TRUE, conf.int = TRUE)
emmeans(glm_quasi, ~ infection_status + fish_length_mm,
        at = list(fish_length_mm = c(35, 45, 55)),
        type = "response")
summary(glm_quasi)
# 7. Make a suitable plot to accompany the model ----
# [Your code here]