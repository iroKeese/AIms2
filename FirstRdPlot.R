# First Round Delegation Plot
# This script creates a bar plot showing delegation in the first round by algorithm

library(ggplot2)
library(dplyr)

# Load data
choices <- read.delim("~/work/zz_nextcloud/y_AImsAndAixperience/Experiments/ProlificData/files_Fri_02-06-2026_15-28-25-48/260206_1528_537_lotteryChoices.xls")

# Apply same exclusions as in AnalysisAIms2.rmd
prolificData <- read.csv("~/work/zz_nextcloud/y_AImsAndAixperience/Experiments/ProlificData/files_Fri_02-06-2026_15-28-25-48/prolific_demographic_export_approved.csv")
prolificData$logCompleTime <- log(prolificData$Time.taken)
prolificData$tooFast <- 1*(prolificData$logCompleTime < mean(log(prolificData$Time.taken)) - 2*sd(log(prolificData$Time.taken)))

choices <- subset(choices, BotCheck1attempt == 1 & Part1CQsPassedOnAttempt <= 2 & Part2CQsPassedOnAttempt <= 2 & Reliable >= 6 & AIUsageInStudy == 0 & Delegated >= 0 & ProlificID %in% prolificData$Participant.id[prolificData$tooFast == 0])

# Create Algorithm column (convert numeric to factor)
choices <- choices %>%
  mutate(Algorithm = ifelse(EVAlgorithm == 1, "EV", "Pref"))

# Filter for first round decisions in Part 2
first_round_data <- choices %>%
  filter(Part == 2 & WithinPartDecisionNumber == 1)

# Create the plot
FirstRdPlot <- first_round_data %>%
  ggplot(aes(x = Algorithm, y = Delegated, fill = Algorithm)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    width = 0.6,
    color = "black"
  ) +
  stat_summary(
    fun.data = mean_cl_boot,
    geom = "errorbar",
    width = 0.2
  ) +
  scale_x_discrete(limits = c("Pref", "EV")) +
  scale_fill_manual(
    values = c("Pref" = "#4E79A7", "EV" = "#D55E00")
  ) +
  scale_y_continuous(limits = c(0, 1), labels = scales::percent_format(accuracy = 1)) +
  labs(
    x = "EV Algorithm",
    y = "Delegation",
    title = "First-Round Delegation by Algorithm"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Display the plot
print(FirstRdPlot)

# Save the plot
ggsave("FirstRdPlot.pdf", FirstRdPlot, width = 6, height = 4, dpi = 300)
ggsave("FirstRdPlot.png", FirstRdPlot, width = 6, height = 4, dpi = 300)

cat("First Round Delegation Plot created successfully!\n")