# Simple script to create all 5 tables for the paper
# This script creates CSV files that can be manually converted to LaTeX

library(dplyr)
library(fixest)

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
# TABLE 1: Descriptive Statistics by Treatment
# ============================================
cat("Creating Table 1: Descriptive Statistics by Treatment\n")

# Calculate descriptive statistics by treatment
table1_data <- subjects %>%
  group_by(EVAlgorithm) %>%
  summarise(
    N = n(),
    Age_Mean = round(mean(Age, na.rm = T), 2),
    Age_SD = round(sd(Age, na.rm = T), 2),
    Female_Pct = round(mean(Female, na.rm = T) * 100, 1),
    Education_University_Pct = round(mean(Education >= 5, na.rm = T) * 100, 1),
    .groups = "drop"
  ) %>%
  mutate(
    Algorithm = ifelse(EVAlgorithm == 1, "EV Algorithm", "Preference Algorithm")
  ) %>%
  select(Algorithm, N, Age_Mean, Age_SD, Female_Pct, Education_University_Pct)

# Save as CSV
write.csv(table1_data, "Table1_DescriptiveStats.csv", row.names = FALSE)

cat("Table 1 saved as: Table1_DescriptiveStats.csv\n\n")

# ============================================
# TABLE 2: Main Regression Results
# ============================================
cat("Creating Table 2: Main Regression Results\n")

# Run regressions
delReg <- feols(
  Delegated ~ EVAlgorithm*WithinPartDecisionNumber | OptionsetID,
  cluster = ~ProlificID,
  data = subset(choices, Part == 2)
)

delRegPlainTrmt <- feols(
  Delegated ~ EVAlgorithm | OptionsetID,
  cluster = ~ProlificID,
  data = subset(choices, Part == 2)
)

delRegPlainTrmtNoP1 <- feols(
  Delegated ~ EVAlgorithm | OptionsetID,
  cluster = ~ProlificID,
  data = subset(choices, Part == 2 & WithinPartDecisionNumber > 1)
)

# Extract coefficients
table2_data <- data.frame(
  Variable = c("EV Algorithm", "Decision Number", "EV Algorithm x Decision Number"),
  All_Periods_Estimate = c(
    coef(delRegPlainTrmt)["EVAlgorithm"],
    NA,
    coef(delReg)["EVAlgorithm:WithinPartDecisionNumber"]
  ),
  All_Periods_SE = c(
    se(delRegPlainTrmt)["EVAlgorithm"],
    NA,
    se(delReg)["EVAlgorithm:WithinPartDecisionNumber"]
  ),
  All_Periods_p = c(
    pvalue(delRegPlainTrmt)["EVAlgorithm"],
    NA,
    pvalue(delReg)["EVAlgorithm:WithinPartDecisionNumber"]
  ),
  Periods_2_10_Estimate = c(
    coef(delRegPlainTrmtNoP1)["EVAlgorithm"],
    NA,
    NA
  ),
  Periods_2_10_SE = c(
    se(delRegPlainTrmtNoP1)["EVAlgorithm"],
    NA,
    NA
  ),
  Periods_2_10_p = c(
    pvalue(delRegPlainTrmtNoP1)["EVAlgorithm"],
    NA,
    NA
  )
)

# Save as CSV
write.csv(table2_data, "Table2_RegressionResults.csv", row.names = FALSE)

cat("Table 2 saved as: Table2_RegressionResults.csv\n\n")

# ============================================
# TABLE 3: Never-Delegator Characteristics
# ============================================
cat("Creating Table 3: Never-Delegator Characteristics\n")

# Calculate never-delegator statistics
choices <- choices %>%
  group_by(ProlificID) %>%
  mutate(
    sumDelegations = sum(Delegated)
  ) %>%
  ungroup()

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

# Calculate statistics by group
table3_data <- analysis_data %>%
  group_by(DelegationGroup) %>%
  summarise(
    N = n(),
    Age_Mean = round(mean(Age, na.rm = T), 2),
    Age_SD = round(sd(Age, na.rm = T), 2),
    Female_Pct = round(mean(Female, na.rm = T) * 100, 1),
    AbsurdComputer_Mean = round(mean(ProbOfAbsurdComputerChoices, na.rm = T), 3),
    AbsurdComputer_SD = round(sd(ProbOfAbsurdComputerChoices, na.rm = T), 3),
    .groups = "drop"
  )

# Save as CSV
write.csv(table3_data, "Table3_NeverDelegators.csv", row.names = FALSE)

cat("Table 3 saved as: Table3_NeverDelegators.csv\n\n")

# ============================================
# TABLE 4: Win-Stay, Lose-Shift Regression
# ============================================
cat("Creating Table 4: Win-Stay, Lose-Shift Regression\n")

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

# Run regression
winStayReg <- feols(
  stay ~ EVAlgorithm*lagWin | OptionsetID + WithinPartDecisionNumber,
  cluster = ~ProlificID,
  data = subset(choices_ws, Part == 2 & WithinPartDecisionNumber > 1)
)

# Extract coefficients
table4_data <- data.frame(
  Variable = c("EV Algorithm", "Previous Win", "EV Algorithm x Previous Win"),
  Estimate = c(
    coef(winStayReg)["EVAlgorithm"],
    coef(winStayReg)["lagWin"],
    coef(winStayReg)["EVAlgorithm:lagWin"]
  ),
  SE = c(
    se(winStayReg)["EVAlgorithm"],
    se(winStayReg)["lagWin"],
    se(winStayReg)["EVAlgorithm:lagWin"]
  ),
  p_value = c(
    pvalue(winStayReg)["EVAlgorithm"],
    pvalue(winStayReg)["lagWin"],
    pvalue(winStayReg)["EVAlgorithm:lagWin"]
  )
)

# Save as CSV
write.csv(table4_data, "Table4_WinStayLoseShift.csv", row.names = FALSE)

cat("Table 4 saved as: Table4_WinStayLoseShift.csv\n\n")

# ============================================
# TABLE 5: Individual Difference Correlations
# ============================================
cat("Creating Table 5: Individual Difference Correlations\n")

# Calculate correlations
table5_data <- analysis_data %>%
  select(
    sumDelegations,
    Age,
    Female,
    Education,
    ProbOfBadComputerChoices,
    ProbOfAbsurdComputerChoices,
    ComputerRiskTaking
  ) %>%
  cor(use = "pairwise.complete.obs")

# Save as CSV
write.csv(table5_data, "Table5_Correlations.csv")

cat("Table 5 saved as: Table5_Correlations.csv\n\n")

cat("\n===========================================\n")
cat("ALL TABLES CREATED SUCCESSFULLY\n")
cat("===========================================\n")
cat("Files saved:\n")
cat("  - Table1_DescriptiveStats.csv\n")
cat("  - Table2_RegressionResults.csv\n")
cat("  - Table3_NeverDelegators.csv\n")
cat("  - Table4_WinStayLoseShift.csv\n")
cat("  - Table5_Correlations.csv\n")
cat("\nYou can manually convert these CSV files to LaTeX tables\n")