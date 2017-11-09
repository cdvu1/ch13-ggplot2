# Exercise-4

# Set up: load `dplyr` and `ggplot2`
library(dplyr)
library(ggplot2)
setwd("~/Documents/FALL17/201/Exercises/ch13-ggplot2/exercise-4")

# Read, and then `source` the data-prep.R file. The `all.data` variable is now available
source('./data-prep.R')

# Create a column of percentage of registered voters who voted
all.data <- all.data %>% mutate(pct.voted = round((total.voted / registered.voters) * 100, digits = 1))

# Start by making a new `ggplot` with `all.data` as the data (no geometry yet)
# What do you see?
plot <- ggplot(data = all.data)

# Draw a scatter plot (with point geometry) with for the `all.data` set, 
# with the `total.population` mapped to the x-position and `registerd.voters` mapped to the y-position.
scatter.plot <- ggplot(data = all.data) +
  geom_point(mapping = aes(x = total.population, y = registered.voters))

# Draw a scatter plot (with point geometry) with for the `all.data` set, 
# with the `total.population` mapped to the x-position and `pct.voted` mapped to the y-position.
# Color the points as "blue"
scatter.plot2 <- ggplot(data = all.data) +
  geom_point(mapping = aes(x = total.population, y = pct.voted))

# Create the same scatter plot as above, but put the county names where the dots are
county.plot <- ggplot(data = all.data) +
  geom_text(mapping = aes(x = total.population, y = pct.voted, label = county))

# Draw a scatter plot comparing the female percentage to the percent voted
# Size the points by the population of the county
female.plot <- ggplot(data = all.data) +
  geom_point(mapping = aes(x = female.percentage, y = pct.voted, size = total.population))

# Draw a line graph comparing the total population to the percent male
# Make it a green line
male.plot <- ggplot(data = all.data) +
  geom_line(mapping = aes(x = male.percentage, y = pct.voted), color = 'green')
