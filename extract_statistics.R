t# Script to extract key statistics for the paper
# Run this script to generate all statistics needed for the paper

# Load required packages
library(dplyr)
library(Exact)
library(fixest)
library(ggplot2)
library(tidyr)

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
# KEY STATISTICS FOR PAPER
# ============================================

cat("\n===========================================\n")
cat("KEY STATISTICS FOR PAPER\n")
cat("===========================================\n\n")

# 1. SAMPLE CHARACTERISTICS
cat("1. SAMPLE CHARACTERISTICS\n")
cat("-------------------------------------------\n")
cat("Total participants (N):", n_distinct(choices$ProlificID), "\n")
cat("EV Algorithm:", sum(subjects$EVAlgorithm == 1), "\n")
cat("Preference Algorithm:", sum(subjects$EVAlgorithm == 0), "\n\n")

# Demographics
cat("Age:\n")
cat("  Mean:", round(mean(subjects$Age, na.rm = T), 2), "\n")
cat("  SD:", round(sd(subjects$Age, na.rm = T), 2), "\n\n")

cat("Gender:\n")
cat("  Female:", round(mean(subjects$Female, na.rm = T) * 100, 1), "%\n")
cat("  Male:", round(mean(subjects$Female == 0, na.rm = T) * 100, 1), "%\n\n")

# 2. ROUND 1 DELEGATION RATES
cat("\n2. ROUND 1 DELEGATION RATES\n")
cat("-------------------------------------------\n")
tab <- table(
  Delegated = choices$Delegated[choices$Part == 2 & choices$WithinPartDecisionNumber == 1],
  EVAlgorithm = choices$EVAlgorithm[choices$Part == 2 & choices$WithinPartDecisionNumber == 1]
)

prop_table <- prop.table(tab, margin = 2)
cat("EV Algorithm delegation rate:", round(prop_table[2, 2] * 100, 1), "%\n")
cat("Preference Algorithm delegation rate:", round(prop_table[2, 1] * 100, 1), "%\n")
cat("Difference:", round((prop_table[2, 2] - prop_table[2, 1]) * 100, 1), "percentage points\n\n")

# Boschloo test
boschloo_p <- exact.test(tab, method = "Boschloo", alternative = "greater", to.plot = F)$p.value
cat("Boschloo test p-value:", round(boschloo_p, 4), "\n")
if(boschloo_p < 0.05) {
  cat("Result: Significant (supports preregistered hypothesis for period 1) ✓\n\n")
} else {
  cat("Result: Not significant\n\n")
}

# 3. PERIODS 2-10 DELEGATION RATES
cat("\n3. PERIODS 2-10 DELEGATION RATES\n")
cat("-------------------------------------------\n")
choices_2_10 <- choices %>% filter(Part == 2 & WithinPartDecisionNumber > 1)

deleg_by_algo <- choices_2_10 %>%
  group_by(Algorithm) %>%
  summarise(
    mean_deleg = mean(Delegated, na.rm = T),
    sd_deleg = sd(Delegated, na.rm = T),
    n = n()
  )

cat("EV Algorithm:\n")
cat("  Mean:", round(deleg_by_algo$mean_deleg[deleg_by_algo$Algorithm == "EV"], 3), "\n")
cat("  SD:", round(deleg_by_algo$sd_deleg[deleg_by_algo$Algorithm == "EV"], 3), "\n\n")

cat("Preference Algorithm:\n")
cat("  Mean:", round(deleg_by_algo$mean_deleg[deleg_by_algo$Algorithm == "Pref"], 3), "\n")
cat("  SD:", round(deleg_by_algo$sd_deleg[deleg_by_algo$Algorithm == "Pref"], 3), "\n\n")

# Test for periods 2-10
tab_2_10 <- table(
  Delegated = choices_2_10$Delegated,
  EVAlgorithm = choices_2_10$EVAlgorithm
)
prop_table_2_10 <- prop.table(tab_2_10, margin = 2)
cat("Difference:", round((prop_table_2_10[2, 2] - prop_table_2_10[2, 1]) * 100, 1), "percentage points\n")
boschloo_p_2_10 <- exact.test(tab_2_10, method = "Boschloo", alternative = "greater", to.plot = F)$p.value
cat("Boschloo test p-value:", round(boschloo_p_2_10, 4), "\n")
if(boschloo_p_2_10 < 0.05) {
  cat("Result: Significant\n\n")
} else {
  cat("Result: Not significant (does not support preregistered hypothesis for periods 2-10) ✗\n\n")
}

# 4. OVERALL DELEGATION (individual averages)
cat("\n4. OVERALL DELEGATION (Individual Averages)\n")
cat("-------------------------------------------\n")
delegAv <- choices %>%
  filter(Part == 2) %>%
  group_by(Algorithm, ProlificID) %>%
  summarise(
    avDeleg = mean(Delegated, na.rm = T),
  ) %>% 
  mutate(Algorithm = factor(Algorithm, levels = c("Pref", "EV")))

overall_by_algo <- delegAv %>%
  group_by(Algorithm) %>%
  summarise(
    mean_deleg = mean(avDeleg, na.rm = T),
    sd_deleg = sd(avDeleg, na.rm = T),
    n = n()
  )

cat("EV Algorithm:\n")
cat("  Mean:", round(overall_by_algo$mean_deleg[overall_by_algo$Algorithm == "EV"], 3), "\n")
cat("  SD:", round(overall_by_algo$sd_deleg[overall_by_algo$Algorithm == "EV"], 3), "\n\n")

cat("Preference Algorithm:\n")
cat("  Mean:", round(overall_by_algo$mean_deleg[overall_by_algo$Algorithm == "Pref"], 3), "\n")
cat("  SD:", round(overall_by_algo$sd_deleg[overall_by_algo$Algorithm == "Pref"], 3), "\n\n")

# Wilcoxon test
wilcox_result <- wilcox.test(avDeleg ~ Algorithm, data = delegAv, alternative = "less")
cat("Wilcoxon-Mann-Whitney test:\n")
cat("  W =", wilcox_result$statistic, "\n")
cat("  p-value =", round(wilcox_result$p.value, 4), "\n")
cat("  Effect size r =", round(wilcox_result$statistic / (nrow(delegAv) * (nrow(delegAv) + 1) / 2), 3), "\n\n")

# 5. REGRESSION RESULTS
cat("\n5. REGRESSION RESULTS\n")
cat("-------------------------------------------\n")

# Main regression with interaction
delReg <- feols(
  Delegated ~ EVAlgorithm*WithinPartDecisionNumber | OptionsetID,
  cluster = ~ProlificID,
  data = subset(choices, Part == 2)
)
cat("Main regression (with interaction):\n")
print(summary(delReg))

# Plain treatment effect (all periods)
delRegPlainTrmt <- feols(
  Delegated ~ EVAlgorithm | OptionsetID,
  cluster = ~ProlificID,
  data = subset(choices, Part == 2)
)
cat("\nPlain treatment effect (all periods):\n")
print(summary(delRegPlainTrmt))

# Plain treatment effect (periods 2-10 only)
delRegPlainTrmtNoP1 <- feols(
  Delegated ~ EVAlgorithm | OptionsetID,
  cluster = ~ProlificID,
  data = subset(choices, Part == 2 & WithinPartDecisionNumber > 1)
)
cat("\nPlain treatment effect (periods 2-10 only):\n")
print(summary(delRegPlainTrmtNoP1))

# 6. NEVER-DELEGATORS
cat("\n6. NEVER-DELEGATORS\n")
cat("-------------------------------------------\n")
choices <- choices %>%
  group_by(ProlificID) %>%
  mutate(
    sumDelegations = sum(Delegated)
  ) %>%
  ungroup()

never_deleg_count <- sum(choices$sumDelegations == 0, na.rm = T)
total_participants <- n_distinct(choices$ProlificID)
never_deleg_pct <- round(never_deleg_count / total_participants * 100, 1)

cat("Never-delegators:", never_deleg_count, "\n")
cat("Total participants:", total_participants, "\n")
cat("Percentage:", never_deleg_pct, "%\n\n")

# Never-delegators by treatment
never_by_treatment <- choices %>%
  distinct(ProlificID, .keep_all = TRUE) %>%
  group_by(EVAlgorithm) %>%
  summarise(
    never_deleg = sum(sumDelegations == 0, na.rm = T),
    total = n(),
    pct = round(never_deleg / total * 100, 1)
  )
cat("By treatment:\n")
print(never_by_treatment)

# 7. CHOICE QUALITY
cat("\n7. CHOICE QUALITY\n")
cat("-------------------------------------------\n")
non_dom_pct <- choices %>%
  filter(Part == 2, Delegated == 0, Option > 0) %>%
  summarise(
    non_dom = mean(Nondominated, na.rm = T)
  )
cat("Non-dominated choices (when not delegating):", round(non_dom_pct$non_dom * 100, 1), "%\n")
cat("Dominated choices (when not delegating):", round((1 - non_dom_pct$non_dom) * 100, 1), "%\n\n")

# 8. WIN-STAY, LOSE-SHIFT
cat("\n8. WIN-STAY, LOSE-SHIFT PATTERNS\n")
cat("-------------------------------------------\n")
choices <- choices %>%
  group_by(ProlificID) %>%
  arrange(WithinPartDecisionNumber, .by_group = TRUE) %>%
  mutate(
    lagDelegated = lag(Delegated, 1),
    lagRelevantPayoff = lag(RelevantPayoff, 1),
    lagSatisfactionRating = lag(SatisfactionRating, 1)
  ) %>%
  ungroup()

choices$stay <- 1*(choices$Delegated == choices$lagDelegated)
choices$lagWin <- 1*(choices$RelevantPayoff > 0)

winStayReg <- feols(
  stay ~ EVAlgorithm*lagWin | OptionsetID + WithinPartDecisionNumber,
  cluster = ~ProlificID,
  data = subset(choices, Part == 2 & WithinPartDecisionNumber > 1)
)
cat("Win-stay, lose-shift regression:\n")
print(summary(winStayReg))

# Stay rates by condition
stay_rates <- choices %>%
  filter(Part == 2, WithinPartDecisionNumber > 1) %>%
  group_by(EVAlgorithm, lagDelegated, lagWin) %>%
  summarise(
    stayRate = mean(stay == 1, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )
cat("\nStay rates by condition:\n")
print(stay_rates)

# 9. INDIVIDUAL DIFFERENCES
cat("\n9. INDIVIDUAL DIFFERENCES\n")
cat("-------------------------------------------\n")
# Join with subject data
choices <- choices %>%
  left_join(
    subjects %>%
      select(ProlificID, Female, Age, Education, HHIncome, ProbOfBadComputerChoices, ProbOfAbsurdComputerChoices, ComputerRiskTaking),
    by = c("ProlificID" = "ProlificID")
  )

analysis_data <- choices %>%
  group_by(ProlificID) %>%
  summarise(
    sumDelegations = first(sumDelegations),
    Female = first(Female),
    Age = first(Age),
    HHIncome = first(HHIncome),
    Education = first(Education),
    ProbOfBadComputerChoices = first(ProbOfBadComputerChoices), 
    ProbOfAbsurdComputerChoices = first(ProbOfAbsurdComputerChoices), 
    ComputerRiskTaking = first(ComputerRiskTaking)
  ) %>%
  ungroup() %>%
  mutate(
    DelegationGroup = ifelse(sumDelegations == 0, "Never-delegator", "Delegator")
  )

# Age
age_test <- t.test(Age ~ DelegationGroup, data = analysis_data)
cat("Age difference:\n")
cat("  t =", round(age_test$statistic, 3), "\n")
cat("  p-value =", round(age_test$p.value, 4), "\n\n")

# Absurd computer choices
absurd_test <- t.test(ProbOfAbsurdComputerChoices ~ DelegationGroup, data = analysis_data)
cat("Absurd computer choices difference:\n")
cat("  Never-delegators mean:", round(mean(analysis_data$ProbOfAbsurdComputerChoices[analysis_data$DelegationGroup == "Never-delegator"], na.rm = T), 3), "\n")
cat("  Delegators mean:", round(mean(analysis_data$ProbOfAbsurdComputerChoices[analysis_data$DelegationGroup == "Delegator"], na.rm = T), 3), "\n")
cat("  t =", round(absurd_test$statistic, 3), "\n")
cat("  p-value =", round(absurd_test$p.value, 4), "\n\n")

cat("\n===========================================\n")
cat("STATISTICS EXTRACTION COMPLETE\n")
cat("===========================================\n")