# Title:        NBA Player Shot Charts
# Description:  This script is intended to visualize the NBA players' shots
#               using shot charts
# Input:        A single csv file containing multiple NBA players' shot data
# Output:       A shot chart of all NBA players

library(jpeg)
library(grid)
library(ggplot2)

court_file <- "images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

all_shots <- read.csv("data/shots-data.csv",
                      header = TRUE,
                      stringsAsFactors = FALSE)

iguodala <- read.csv("data/andre-iguodala.csv",
                     header = TRUE,
                     stringsAsFactors = FALSE)
green <- read.csv("data/draymond-green.csv",
                  header = TRUE,
                  stringsAsFactors = FALSE)

durant <- read.csv("data/kevin-durant.csv",
                   header = TRUE,
                   stringsAsFactors = FALSE)
thompson <- read.csv("data/klay-thompson.csv",
                     header = TRUE,
                     stringsAsFactors = FALSE)
curry <- read.csv("data/stephen-curry.csv",
                  header = TRUE,
                  stringsAsFactors = FALSE)

pdf(file = "images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
dev.off()

pdf(file = "images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
dev.off()

pdf(file = "images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
dev.off()

pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
dev.off()

pdf(file = "images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()
dev.off()

pdf(file = "images/gsw-shot-charts.pdf", width = 8, height = 7)
ggplot(data = all_shots) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  facet_wrap(~ name) +
  theme_minimal()
dev.off()

png(filename = "images/gsw-shot-charts.png", width = 8, height = 7, units = "in")
ggplot(data = all_shots) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  facet_wrap(~ name) +
  theme_minimal()
dev.off()
