# Script to create all 5 figures for the paper
# Run this script to generate publication-ready figures

library(dplyr)
library(ggplot2)
library(tidyr)
library(scales)

# Load data
choices <- read.delim("~/work/zz_nextcloud/y_AImsAndAixperience/Experiments/ProlificData/files_Fri_02-06-2026_15-28-25-48/260206_1528_537_lotteryChoices.xls")
subjects <- read.csv("~/work/zz_nextcloud/y_AImsAndAixperience/Experiments/ProlificData/files_Fri_02-06-2026_15-28-25-48/allSubjects.csv", header = T)
prolificData <- read.csv("~/work/zz_nextcloud/y_AImsAndAixperience/Experiments/ProlificData/files_Fri_02-06-2026_15-28-25-48/prolific_demographic_export_approved.csv")

# Apply exclusions
prolificData$logCompleTime <- log(prolificData$Time.taken)
prolificData$tooFast <- 1*(prolificData$logCompleTime < mean(log(prolificData$Time.taken)) - 2*sd(log(prolificData$Time.taken)))

choices <- subset(choices, BotCheck1attempt == 1 & Part1CQsPassedOnAttempt <= 2 & Part2CQsPassedOnAttempt <= 2 & Reliable >= 6 & AIUsageInStudy == 0 & Delegated >= 0 & ProlificID %in% prolificData$Participant.id[prolificData$tooFast == 0])
subjects <- subset(subjects, ProlificID %in% choices$ProlificID)

# Add algorithm label
choices <- choices %>%
  mutate(Algorithm = ifelse(EVAlgorithm == 1, "EV", "Pref"))

# ============================================
# FIGURE 1: Average Delegation Over Decisions
# ============================================
cat("Creating Figure 1: Average Delegation Over Decisions\n")

choicesAv <- choices %>%
  filter(Part == 2) %>%
  group_by(Algorithm, WithinPartDecisionNumber) %>%
  summarise(
    avDeleg = mean(Delegated, na.rm = T),
    se = sd(Delegated, na.rm = T) / sqrt(n()),
    .groups = "drop"
  )

fig1 <- ggplot(choicesAv, aes(
  x = WithinPartDecisionNumber,
  y = avDeleg,
  color = Algorithm,
  group = Algorithm
)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = avDeleg - se, ymax = avDeleg + se), width = 0.2) +
  scale_color_manual(
    values = c("Pref" = "#4E79A7", "EV" = "#D55E00"),
    labels = c("Pref" = "Preference Algorithm", "EV" = "EV Algorithm")
  ) +
  labs(
    x = "Decision Number",
    y = "Average Delegation Rate",
    color = "Algorithm",
    title = "Average Delegation Over Decisions (Part 2)"
  ) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10)
  )

ggsave("Figure1_AverageDelegation.png", fig1, width = 8, height = 5, dpi = 300)

# ============================================
# FIGURE 2: Distribution of Average Delegation
# ============================================
cat("Creating Figure 2: Distribution of Average Delegation\n")

delegAv <- choices %>%
  filter(Part == 2) %>%
  group_by(Algorithm, ProlificID) %>%
  summarise(
    avDeleg = mean(Delegated, na.rm = T),
    .groups = "drop"
  ) %>%
  mutate(Algorithm = factor(Algorithm, levels = c("Pref", "EV")))

fig2 <- ggplot(delegAv, aes(x = Algorithm, y = avDeleg, fill = Algorithm)) +
  geom_violin(trim = FALSE, alpha = 0.6) +
  geom_boxplot(
    width = 0.15,
    outlier.shape = NA,
    alpha = 0.8
  ) +
  stat_summary(
    fun = mean,
    geom = "point",
    shape = 18,
    size = 3,
    color = "black"
  ) +
  scale_fill_manual(
    values = c("Pref" = "#4E79A7", "EV" = "#D55E00"),
    labels = c("Pref" = "Preference Algorithm", "EV" = "EV Algorithm")
  ) +
  labs(
    x = "Algorithm",
    y = "Average Delegation Rate",
    fill = "Algorithm",
    title = "Average Delegation by Algorithm"
  ) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  theme_minimal() +
  theme(
    legend.position = "none",
#    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text.x = element_text(size = 11)
  )

ggsave("Figure2_DistributionDelegation.png", fig2, width = 6, height = 5, dpi = 300)

# ============================================
# FIGURE 3: ECDF of Average Delegation
# ============================================
cat("Creating Figure 3: ECDF of Average Delegation\n")

fig3 <- ggplot(delegAv, aes(x = avDeleg, color = Algorithm)) +
  stat_ecdf(linewidth = 1) +
  scale_color_manual(
    values = c("Pref" = "#4E79A7", "EV" = "#D55E00"),
    labels = c("Pref" = "Preference Algorithm", "EV" = "EV Algorithm")
  ) +
  labs(
    x = "Average Delegation Rate",
    y = "Cumulative Probability",
    color = "Algorithm",
    title = "ECDF of Average Delegation (Part 2)"
  ) +
  scale_x_continuous(labels = percent_format(accuracy = 1)) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10)
  )

ggsave("Figure3_ECDF.png", fig3, width = 7, height = 5, dpi = 300)

# ============================================
# FIGURE 4: Delegation Groups by Treatment
# ============================================
cat("Creating Figure 4: Delegation Groups by Treatment\n")

# Calculate delegation groups
deleg_groups <- choices %>%
  filter(Part == 2) %>%
  group_by(ProlificID, Algorithm) %>%
  summarise(
    total_deleg = sum(Delegated, na.rm = T),
    .groups = "drop"
  ) %>%
  mutate(
    group = case_when(
      total_deleg == 0 ~ "Never",
      total_deleg == 10 ~ "Always",
      TRUE ~ "Sometimes"
    )
  ) %>%
  group_by(Algorithm, group) %>%
  summarise(
    n = n(),
    .groups = "drop"
  ) %>%
  group_by(Algorithm) %>%
  mutate(
    pct = n / sum(n) * 100
  ) %>%
  ungroup() %>%
  mutate(
    group = factor(group, levels = c("Never", "Sometimes", "Always")),
    Algorithm = factor(Algorithm, levels = c("Pref", "EV"))
  )

fig4 <- ggplot(deleg_groups, aes(x = group, y = pct, fill = Algorithm)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.6) +
  geom_text(
    aes(label = paste0(round(pct, 1), "%")),
    position = position_dodge(width = 0.8),
    vjust = -0.5,
    size = 3.5
  ) +
  scale_fill_manual(
    values = c("Pref" = "#4E79A7", "EV" = "#D55E00"),
    labels = c("Pref" = "Preference Algorithm", "EV" = "EV Algorithm")
  ) +
  labs(
    x = "Delegation Group",
    y = "Percentage of Participants",
    fill = "Algorithm",
    title = "Delegation Groups by Treatment"
  ) +
  scale_y_continuous(limits = c(0, max(deleg_groups$pct) * 1.2)) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10)
  )

ggsave("Figure4_DelegationGroups.png", fig4, width = 7, height = 5, dpi = 300)

# ============================================
# FIGURE 5: Win-Stay, Lose-Shift Patterns
# ============================================
cat("Creating Figure 5: Win-Stay, Lose-Shift Patterns\n")

# Prepare data for win-stay/lose-shift
choices_ws <- choices %>%
  group_by(ProlificID) %>%
  arrange(WithinPartDecisionNumber, .by_group = TRUE) %>%
  mutate(
    lagDelegated = lag(Delegated, 1),
    lagRelevantPayoff = lag(RelevantPayoff, 1)
  ) %>%
  ungroup()

choices_ws$stay <- 1*(choices_ws$Delegated == choices_ws$lagDelegated)
choices_ws$lagWin <- 1*(choices_ws$lagRelevantPayoff > 0)

stay_rates <- choices_ws %>%
  filter(Part == 2, WithinPartDecisionNumber > 1, !is.na(lagDelegated)) %>%
  group_by(Algorithm, lagDelegated, lagWin) %>%
  summarise(
    stayRate = mean(stay == 1, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  ) %>%
  filter(lagDelegated == 1) %>%
  mutate(
    lagWin_label = ifelse(lagWin == 1, "Win", "Loss"),
    Algorithm = factor(Algorithm, levels = c("Pref", "EV"))
  )

fig5 <- ggplot(stay_rates, aes(x = lagWin_label, y = stayRate, fill = Algorithm)) +
  geom_col(position = position_dodge(width = 0.8), width = 0.6) +
  geom_text(
    aes(label = paste0(round(stayRate * 100, 1), "%")),
    position = position_dodge(width = 0.8),
    vjust = -0.5,
    size = 3.5
  ) +
  scale_fill_manual(
    values = c("Pref" = "#4E79A7", "EV" = "#D55E00"),
    labels = c("Pref" = "Preference Algorithm", "EV" = "EV Algorithm")
  ) +
  labs(
    x = "Previous Outcome",
    y = "Stay Rate",
    fill = "Algorithm",
    title = "Win-Stay, Lose-Shift Patterns (Previously Delegated)"
  ) +
  scale_y_continuous(
    labels = percent_format(accuracy = 1),
    limits = c(0, max(stay_rates$stayRate) * 1.2)
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10)
  )

ggsave("Figure5_WinStayLoseShift.png", fig5, width = 6, height = 5, dpi = 300)

cat("\n===========================================\n")
cat("ALL FIGURES CREATED SUCCESSFULLY\n")
cat("===========================================\n")
cat("Files saved:\n")
cat("  - Figure1_AverageDelegation.png/pdf\n")
cat("  - Figure2_DistributionDelegation.png/pdf\n")
cat("  - Figure3_ECDF.png/pdf\n")
cat("  - Figure4_DelegationGroups.png/pdf\n")
cat("  - Figure5_WinStayLoseShift.png/pdf\n")
