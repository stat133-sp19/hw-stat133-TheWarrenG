# Title:        NBA Player Data Processing
# Description:  This script is intended to synthesize several NBA player's data
#               into one file for visualization purposes
# Input:        Multiple csv files containing NBA player data
# Output:       A single csv file containing all of the content from the input,
#               multiple txt files containing summary statistics for each player
#               and the aggregation of players

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

iguodala["name"] = c("Andre Iguodala")
green["name"] = c("Draymond Green")
durant["name"] = c("Kevin Durant")
thompson["name"] = c("Klay Thompson")
curry["name"] = c("Stephen Curry")

iguodala["shot_made_flag"][iguodala["shot_made_flag"] == "y"] = c("shot_yes")
iguodala["shot_made_flag"][iguodala["shot_made_flag"] == "n"] = c("shot_no")
green["shot_made_flag"][green["shot_made_flag"] == "y"] = c("shot_yes")
green["shot_made_flag"][green["shot_made_flag"] == "n"] = c("shot_no")
durant["shot_made_flag"][durant["shot_made_flag"] == "y"] = c("shot_yes")
durant["shot_made_flag"][durant["shot_made_flag"] == "n"] = c("shot_no")
thompson["shot_made_flag"][thompson["shot_made_flag"] == "y"] = c("shot_yes")
thompson["shot_made_flag"][thompson["shot_made_flag"] == "n"] = c("shot_no")
curry["shot_made_flag"][curry["shot_made_flag"] == "y"] = c("shot_yes")
curry["shot_made_flag"][curry["shot_made_flag"] == "n"] = c("shot_no")

iguodala["minute"] = 12 * iguodala["period"] - iguodala["minutes_remaining"]
green["minute"] = 12 * green["period"] - green["minutes_remaining"]
durant["minute"] = 12 * durant["period"] - durant["minutes_remaining"]
thompson["minute"] = 12 * thompson["period"] - thompson["minutes_remaining"]
curry["minute"] = 12 * curry["period"] - curry["minutes_remaining"]

sink(file = "output/andre-iguodala-summary.txt")
summary(iguodala)
sink()
sink(file = "output/draymond-green-summary.txt")
summary(green)
sink()
sink(file = "output/kevin-durant-summary.txt")
summary(durant)
sink()
sink(file = "output/klay-thompson-summary.txt")
summary(thompson)
sink()
sink(file = "output/stephen-curry-summary.txt")
summary(curry)
sink()

all_shots <- rbind(iguodala, green, durant, thompson, curry)
write.csv(
  x = all_shots,
  file = "data/shots-data.csv"
)

sink("output/shots-data-summary.txt")
summary(all_shots)
sink()