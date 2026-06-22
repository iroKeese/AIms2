# Check never-delegator statistics
library(tidyverse)

# Load data
subjects <- read.csv("allSubjects.csv")
choices <- read.delim("260206_1528_537_lotteryChoices.xls")
prolificData <- read.csv("~/work/zz_nextcloud/y_AImsAndAixperience/Experiments/ProlificData/files_Fri_02-06-2026_15-28-25-48/prolific_demographic_export_approved.csv")

# Apply exclusion criteria (excluding tooFast check as column doesn't exist)
choices_filtered <- choices %>%
  filter(BotCheck1attempt == 1 & 
         Part1CQsPassedOnAttempt <= 2 & 
         Part2CQsPassedOnAttempt <= 2 & 
         Reliable >= 6 & 
         AIUsageInStudy == 0 & 
         Delegated >= 0)

# Calculate sum of delegations per person (only Part 2, only valid delegation values)
sum_delegations <- choices_filtered %>%
  filter(Part == 2) %>%
  group_by(ProlificID) %>%
  summarise(sumDelegations = sum(Delegated, na.rm = TRUE), .groups = "drop")

# Get unique subjects with their treatment
subjects_unique <- subjects %>%
  filter(ProlificID %in% choices_filtered$ProlificID) %>%
  select(ProlificID, EVAlgorithm) %>%
  distinct()

# Merge with sum of delegations
subjects2 <- subjects_unique %>%
  left_join(sum_delegations, by = "ProlificID")

# Calculate never-delegators by treatment
never_delegators <- subjects2 %>%
  mutate(NeverDelegate = (sumDelegations == 0)) %>%
  group_by(EVAlgorithm, NeverDelegate) %>%
  summarise(n = n(), .groups = "drop") %>%
  pivot_wider(names_from = NeverDelegate, values_from = n, names_prefix = "NeverDelegate_")

# Calculate percentages
never_delegators_pct <- subjects2 %>%
  mutate(NeverDelegate = (sumDelegations == 0)) %>%
  group_by(EVAlgorithm) %>%
  summarise(
    total = n(),
    never_delegators = sum(NeverDelegate),
    pct = never_delegators / total * 100,
    .groups = "drop"
  )

# Overall statistics
overall <- subjects2 %>%
  summarise(
    total = n(),
    never_delegators = sum(sumDelegations == 0),
    pct = never_delegators / total * 100
  )

print("Never-delegators by treatment:")
print(never_delegators)

print("\nNever-delegator percentages by treatment:")
print(never_delegators_pct)

print("\nOverall never-delegator statistics:")
print(overall)