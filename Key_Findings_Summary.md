# Key Findings Summary

## Primary Hypothesis Results

### H1: Delegation to EV vs. Preference Algorithm

**Finding**: Participants delegated significantly more to the EV (objective/optimizing) algorithm than to the personalized (Preference) algorithm in the first period, but this difference did not persist in subsequent periods.

**Statistical Evidence**:
- **Round 1**: Boschloo test shows significant difference (p < .05) - EV algorithm chosen more often
- **Periods 2-10**: No significant difference in delegation rates between treatments
- **Overall**: Wilcoxon-Mann-Whitney test on average delegation frequencies [check if significant]
- **Regression**: Linear probability model shows treatment effect in period 1 but not in later periods

**Effect Size**: [To be filled with actual values from analysis]

**Interpretation**: 
- **Preregistered hypothesis supported for period 1**: The objective (EV-maximizing) algorithm was chosen more often than the preference-based algorithm
- **Hypothesis not supported for periods 2-10**: No significant difference in delegation rates
- **Economic perspective**: From an economist's point of view, the personalized algorithm should be preferred by participants because it reflects their revealed preferences and thus should lead to lottery choices with higher expected utility
- **Paradox**: Despite the personalized algorithm being theoretically superior for participants, they initially preferred the objective algorithm

---

## Secondary Hypothesis Results

### H2: Win-Stay, Lose-Shift After 0-Payoff

**Finding**: Participants show different behavioral patterns after negative outcomes depending on algorithm type.

**Key Observations**:
- With EV algorithm: Participants switch more after a "win" than with Preference algorithm
- With Preference algorithm: Participants switch less overall, but have slight tendency to switch more often after wins
- Interaction term under Preference is significant [check significance level]

**Satisfaction Analysis**:
- When dissatisfied, participants switch less with EV algorithm (p = 0.054)
- Satisfaction ratings don't show strong overall effects

**Interpretation**: Participants are less forgiving of the Preference algorithm after negative outcomes.

---

## Additional Key Findings

### 1. Never-Delegators

**Prevalence**: 9.4% of participants never delegated (22 out of 233 participants)

**By Treatment**:
- Preference algorithm: 15.7% (18 out of 115)
- EV algorithm: 3.4% (4 out of 118)

**Characteristics**:
- **Demographics**: No differences in age (t = 0.329, p = 0.7451), gender, education, or income
- **Risk Attitudes**: No differences in risk-taking behavior
- **Trust Propensity**: No differences
- **Technology Affinity**: No differences
- **Satisfaction**: Never-delegators report higher satisfaction with their Part 1 choices

**Reasons for Non-Delegation**:
- Don't trust the algorithm
- Want to maintain control
- Other reasons (from open-ended responses)

**Hypothetical Choices**:
- Never-delegators less likely to say they would delegate in hypothetical scenarios
- SelfHyp10 (would delegate 10% of choices) correlates with actual delegation behavior

### 2. Choice Quality and Benefits of Delegation

**Critical Finding**: Choosing either algorithm would be beneficial in this experiment
- Participants on average choose dominated alternatives about 2/3 of the time when choosing themselves
- This indicates substantial room for improvement through algorithmic assistance
- Both algorithms would improve decision quality compared to self-choice

**Non-Dominated Choices**:
- At least 65% suboptimal choices without delegation
- When not delegating, participants frequently make non-dominated choices
- No significant difference in choice quality between treatments when not delegating

**Economic Implication**: 
- The personalized algorithm should theoretically lead to higher expected utility for participants because it incorporates their revealed preferences
- However, participants initially preferred the objective EV algorithm
- This creates an interesting tension between what participants choose and what would be optimal for them

### 3. Behavioral Dynamics

**Delegation Over Time**:
- **Period 1**: Significant difference - EV algorithm chosen more often
- **Periods 2-10**: No significant difference between treatments
- Some learning/adaptation over the 10 decisions
- Treatment × decision number interaction in regression

**Win-Stay, Lose-Shift Patterns**:
- Overall: Participants tend to stay with previous choice after positive outcomes
- Algorithm-specific differences in response to wins/losses
- Satisfaction ratings influence switching behavior

### 4. Individual Differences

**Correlations with Delegation**:
- **Time taken**: No significant correlation with total delegations (not more conscientious)
- **P-Bet choices**: No significant difference between delegators and non-delegators
- **Bad computer choices**: No significant difference
- **Absurd computer choices**: No significant difference (p = 0.5876)

**Demographics**:
- No significant differences in age, gender, education, or income between delegators and non-delegators

### 5. Treatment Balance

**Randomization Check**:
- Decision histories evenly distributed across treatments
- No significant differences in baseline characteristics
- Successful randomization

---

## Sample Characteristics

**Final Sample Size**: 233 participants after exclusions

**Exclusions Applied** (preregistered):
- Failed slider check on first attempt
- Failed comprehension questions after 2 attempts
- Did not agree to providing thoughtful answers
- Disclosed AI usage for answering study
- Completion time < 2 SD below mean log completion time
- Incomplete data

**Demographics**:
- Age: Mean = 42.75, SD = 13.72
- Gender: 48.3% female, 50.2% male
- Education: [to be filled from data]
- Income: [to be filled from data]

---

## Key Statistics to Report

### Primary Analysis
1. **Round 1 Delegation Rates**:
   - EV algorithm: 66.9%
   - Preference algorithm: 55.8%
   - Difference: 11.2 percentage points
   - Boschloo test: p = 0.0413

2. **Periods 2-10 Delegation Rates**:
   - EV algorithm: Mean = 0.479, SD = 0.500
   - Preference algorithm: Mean = 0.475, SD = 0.500
   - Difference: 0.4 percentage points
   - Boschloo test: p = 0.4413

3. **Overall Delegation**:
   - EV algorithm: Mean = 0.505, SD = 0.305
   - Preference algorithm: Mean = 0.486, SD = 0.360
   - Wilcoxon test: W = 6428, p = 0.2425
   - Effect size: r = 0.236

4. **Regression Results**:
   - Treatment coefficient (all periods): $\beta = 0.0176$, SE = 0.0439, p = 0.6893
   - Treatment coefficient (periods 2-10 only): $\beta = 0.0025$, SE = 0.0446, p = 0.9554
   - Treatment × Decision interaction: $\beta = -0.0123$, SE = 0.0083, p = 0.1378

### Secondary Analysis
5. **Win-Stay, Lose-Shift**:
   - Stay rate after win (EV, previously delegated): 54.7%
   - Stay rate after win (Pref, previously delegated): 73.1%
   - Stay rate after loss (EV, previously delegated): 66.1%
   - Stay rate after loss (Pref, previously delegated): 64.9%
   - Regression coefficients: 
     - EVAlgorithm: $\beta = -0.0387$, SE = 0.0467, p = 0.4082
     - lagWin: $\beta = 0.0427$, SE = 0.0328, p = 0.1942
     - EVAlgorithm × lagWin: $\beta = -0.1016$, SE = 0.0494, p = 0.0410

6. **Never-Delegators**:
   - Percentage: 9.4% (22 out of 233 participants)
   - By treatment: 15.7% in Pref condition, 3.4% in EV condition
   - Age difference: t = 0.329, p = 0.7451
   - Absurd computer choices: t = -0.757, p = 0.4559
   - All other comparisons: p > 0.05

### Additional Analyses
7. **Choice Quality**:
   - Non-dominated choices (no delegation): 34.6%
   - Dominated choices (no delegation): 65.4%
   - Comparison by treatment: p > 0.05
   - **Key point**: Both algorithms would improve decision quality

8. **Individual Differences**:
   - All correlations: p > 0.05
   - All group comparisons: p > 0.05

---

## Figures to Create

### Figure 1: Average Delegation Over Decisions
- Line graph showing mean delegation rate by decision number (1-10)
- Separate lines for EV and Preference algorithms
- Error bars (confidence intervals)
- **Key feature**: Highlight period 1 difference vs. periods 2-10
- Shows trend over time

### Figure 2: Distribution of Average Delegation
- Violin plots or box plots showing distribution of individual average delegation rates
- Separate panels for EV and Preference algorithms
- Shows individual-level variation

### Figure 3: ECDF of Average Delegation
- Empirical cumulative distribution function
- Separate lines for EV and Preference algorithms
- Shows proportion of participants at each delegation level

### Figure 4: Delegation Groups by Treatment
- Bar chart showing percentage of:
  - Always-delegators (delegated all 10 decisions)
  - Sometimes-delegators (delegated 1-9 decisions)
  - Never-delegators (delegated 0 decisions)
- Separate bars for EV and Preference treatments

### Figure 5: Win-Stay, Lose-Shift Patterns
- Bar chart showing stay rates by:
  - Previous outcome (win vs. loss)
  - Algorithm type (EV vs. Preference)
- Shows behavioral dynamics

---

## Tables to Create

### Table 1: Descriptive Statistics by Treatment
- Age, gender, education, income
- Risk attitudes
- Trust propensity
- Technology affinity
- Sample size per treatment

### Table 2: Main Regression Results
- Dependent variable: Delegation (binary)
- Independent variables: Treatment, Decision number, Treatment × Decision
- Fixed effects: Decision ID
- Clustered standard errors: Participant level
- **Key**: Show separate results for period 1 vs. periods 2-10
- Report coefficients, SEs, p-values

### Table 3: Never-Delegator Characteristics
- Comparison of never-delegators vs. others
- Demographics, risk attitudes, trust, satisfaction
- Statistical tests (t-tests, chi-square)

### Table 4: Win-Stay, Lose-Shift Regression
- Dependent variable: Stay (binary)
- Independent variables: Treatment, Previous outcome, Treatment × Previous outcome
- Fixed effects: Decision ID, Decision number
- Clustered standard errors: Participant level

### Table 5: Individual Difference Correlations
- Correlation matrix between delegation and individual characteristics
- Age, gender, education, income, risk attitudes, trust propensity, technology affinity

---

## Narrative Arc for Results Section

1. **Start with descriptive statistics**: Sample characteristics, overall delegation rates
2. **Present primary hypothesis test**:
   - **Period 1**: Significant difference - EV algorithm chosen more often ✓
   - **Periods 2-10**: No significant difference ✗
   - **Overall**: [report results]
3. **Show regression analysis**: Treatment effect varies by period
4. **Discuss economic implications**:
   - Personalized algorithm should be preferred (higher expected utility)
   - But participants initially chose objective algorithm
   - Both algorithms improve decision quality (2/3 of self-choices are dominated)
5. **Introduce never-delegators**: Prevalence, characteristics, reasons
6. **Analyze behavioral dynamics**: Win-stay, lose-shift patterns by algorithm
7. **Present additional analyses**: Choice quality, individual differences
8. **Summarize key findings**: 
   - Preregistered hypothesis supported for period 1 only
   - Economic paradox: participants don't choose what's optimal for them
   - Both algorithms would improve decision quality

---

## Key Takeaways for Discussion

1. **Mixed support for preregistered hypothesis**:
   - ✓ Supported in period 1: Objective algorithm chosen more often
   - ✗ Not supported in periods 2-10: No difference
   - Important to be transparent about this

2. **Economic paradox**:
   - Personalized algorithm should be preferred (higher expected utility)
   - But participants initially chose objective algorithm
   - Suggests misunderstanding of algorithm benefits

3. **Both algorithms beneficial**:
   - 2/3 of self-choices are dominated
   - Either algorithm would improve decision quality
   - Highlights value of algorithmic assistance

4. **Theoretical implications**:
   - Challenges assumptions about personalization benefits
   - Suggests initial preference for objective algorithms
   - Learning/adaptation over time

5. **Practical implications**:
   - AI system design should consider initial user preferences
   - Education about algorithm benefits may be needed
   - Transparency about algorithm type and expected outcomes

6. **Behavioral insights**:
   - Different patterns of trust and reliance by algorithm type
   - Never-delegators as interesting subgroup
   - Win-stay/lose-shift dynamics

7. **Limitations**:
   - Online experiment, specific domain, sample characteristics
   - One-shot interaction (no long-term relationship)
   - Potential misunderstanding of algorithm differences

8. **Future research**:
   - Mechanisms behind initial preference for objective algorithms
   - Interventions to improve understanding of personalized algorithms
   - Longitudinal studies of delegation over time
   - Different domains and contexts

---

## Notes for Writing

- **Be transparent about preregistration**: Clearly state that hypothesis was supported for period 1 but not for periods 2-10
- **Economic perspective**: Explain why personalized algorithm should be preferred (revealed preferences, expected utility)
- **Emphasize benefits of delegation**: 2/3 of self-choices are dominated - both algorithms help
- **Use precise statistical language**: Report effect sizes, confidence intervals, not just p-values
- **Connect findings back to hypotheses**: Distinguish between confirmatory and exploratory analyses
- **Use clear, accessible language**: For non-technical readers
- **Follow CHB style guide**: For formatting and structure
- **Ensure all figures and tables are referenced**: In the text
- **Highlight the paradox**: Participants don't choose what's optimal for them