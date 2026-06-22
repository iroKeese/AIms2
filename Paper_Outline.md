# Paper Outline: "When personalization deters delegation to algorithms: Evidence from a preregistered experiment"

## Title
When personalization deters delegation to algorithms: Evidence from a preregistered experiment

## Authors
Irenaeus Wolff (University of Konstanz)
Lara Suraci (DG Cities)

---

## 1. Abstract (~200 words)

**Background**: As artificial intelligence increasingly assists in financial decision-making, understanding when and why people delegate to algorithms becomes crucial.

**Objective**: This preregistered experiment investigates how algorithm type affects delegation behavior, comparing an expected value (EV)-maximizing algorithm with a personalized algorithm that incorporates individual preferences.

**Method**: 240 participants (120 per treatment) made 10 lottery choices with the option to delegate to either an EV algorithm or a preference-based algorithm. The study employed a two-part design: preference elicitation followed by delegation decisions.

**Results**: Participants delegated significantly more to the EV algorithm than to the personalized algorithm (Boschloo test, p < .05; Wilcoxon test, p < .05). Analysis revealed distinct behavioral patterns: approximately X% of participants never delegated, while others showed win-stay/lose-shift dynamics. Never-delegators were not significantly different in demographics or risk attitudes but reported higher satisfaction with their own choices.

**Conclusion**: Counterintuitively, personalization deters rather than encourages delegation to algorithms. This finding challenges assumptions about the benefits of personalization in AI systems and has important implications for the design of algorithmic advisors.

**Keywords**: AI delegation, personalization, algorithm appreciation, trust in AI, financial decision-making, preregistered experiment

---

## 2. Introduction (~800 words)

### 2.1 Opening Context
- Rise of AI in financial decision-making (robo-advisors, investment platforms)
- Growing importance of understanding human-AI collaboration
- The delegation decision: when do humans trust algorithms with important choices?

### 2.2 Problem Statement
- Despite advances in AI, adoption varies widely
- Key question: What factors influence whether people delegate to algorithms?
- Specific focus: How does the type of algorithm affect delegation behavior?

### 2.3 Research Gap
- Literature on algorithm aversion vs. appreciation
- Limited research on how algorithm characteristics (e.g., personalization) affect delegation
- Need for experimental evidence comparing different algorithm types

### 2.4 Your Contribution
- Preregistered experiment comparing EV vs. personalized algorithms
- Novel finding: personalization reduces delegation
- Comprehensive analysis including never-delegators and behavioral dynamics
- Theoretical and practical implications for AI system design

### 2.5 Hypotheses
**H1 (Primary)**: People are more likely to delegate financial decisions to an EV-maximizing algorithm compared to a personalized algorithm that incorporates their (revealed) preferences.

**H2 (Secondary)**: After delegating to the algorithm with a 0-payoff, participants in the personalized condition are more likely to switch to non-delegation in the following round than under any other circumstances, particularly than under the same circumstances in the EV condition.

### 2.6 Roadmap
- Section 3: Literature review
- Section 4: Method
- Section 5: Results
- Section 6: Discussion
- Section 7: Conclusion

---

## 3. Literature Review (~1200 words)

### 3.1 Algorithm Aversion vs. Appreciation
- **Algorithm aversion** (Dietvorst et al., 2015): People avoid algorithms after observing errors
- **Algorithm appreciation** (Logg et al., 2019): People prefer algorithmic judgment over human judgment
- Reconciling the two: Context-dependent factors (Castelo et al., 2019; Schaap et al., 2023)
- Domain-specific considerations (Morewedge, 2022)

### 3.2 Trust and Reliance in AI
- Definition of trust (Mayer et al., 1995; Lee & See, 2004)
- Trust as attitude vs. reliance as behavior
- Factors influencing trust in automation (Hoff & Bashir, 2015; Schaefer et al., 2016)
- Measurement of trust in AI (Kohn et al., 2021)

### 3.3 Personalization in AI Systems
- Benefits of personalization (Castelo et al., 2019; Jussupow et al., 2020)
- When personalization increases trust (medical domain, Longoni et al., 2019)
- Potential downsides of personalization
- MABA-HABA framework (Glikson & Woolley, 2020)

### 3.4 Delegation in Decision-Making
- Delegation to algorithms in finance (Holzmeister et al., 2023; Germann & Merkle, 2022)
- Motives for delegating financial decisions (Freer et al., 2023)
- Human-AI collaboration in decision-making
- Responsibility sharing with machines (Kirchkamp & Strobel, 2019)

### 3.5 Individual Differences in AI Acceptance
- Risk attitudes and delegation (Dohmen et al., 2011)
- Trust propensity (Höddinghaus et al., 2021)
- Technology affinity (Franke et al., 2019)
- Demographic factors

### 3.6 Positioning Your Study
- How your study fills the gap
- Novel contribution: comparing algorithm types in delegation context
- Preregistered design as strength
- Connection to broader literature

---

## 4. Method (~1000 words)

### 4.1 Participants
- Recruitment: Prolific platform
- Sample: 240 participants (120 per treatment)
- Inclusion criteria: UK residents, English as primary language
- Exclusion criteria (preregistered):
  - Failed slider check on first attempt
  - Failed comprehension questions after 2 attempts
  - Did not agree to providing thoughtful answers
  - Disclosed AI usage for answering study
  - Completion time < 2 SD below mean log completion time
  - Incomplete data
- Final sample characteristics (age, gender, education, income)

### 4.2 Experimental Design
- **Design**: Between-subjects, 2 conditions (EV vs. Preference algorithm)
- **Structure**: Two-part experiment
  - Part 1: Preference elicitation (lottery choices to reveal risk preferences)
  - Part 2: Delegation decisions (10 lottery choices with option to delegate)
- **Treatments**:
  - EV condition: Algorithm maximizes expected value
  - Preference condition: Algorithm incorporates individual's revealed preferences from Part 1
- **Incentives**: Real monetary payments based on one randomly selected decision

### 4.3 Procedure
1. **Introduction**: Consent, instructions
2. **Attention checks**: Slider check, comprehension questions
3. **Part 1**: 12 lottery choices to elicit risk preferences
4. **Part 2**: 10 lottery choices with delegation option
   - Each decision: choose self or delegate to algorithm
   - Feedback provided after each decision
5. **Post-experiment questionnaire**:
   - Demographics (age, gender, education, income)
   - Risk attitudes
   - Trust propensity
   - Technology affinity
   - Satisfaction with choices
   - Reasons for (non-)delegation
6. **Debriefing**: Explanation of study purpose

### 4.4 Measures
- **Primary dependent variable**: Delegation frequency
  - Round 1 delegation (binary)
  - Overall delegation rate (0-1)
- **Secondary measures**:
  - Non-dominated choices (when not delegating)
  - Win-stay/lose-shift behavior
  - Satisfaction ratings
  - Individual characteristics (risk attitudes, trust propensity, etc.)

### 4.5 Statistical Analysis (Preregistered)
- **Primary analysis**:
  - Round 1: Boschloo test comparing delegation rates between treatments
  - Overall: Wilcoxon-Mann-Whitney test on average delegation frequencies
- **Secondary analysis**:
  - Multivariate regression with treatment dummies
  - Treatment × period interaction
  - Clustered standard errors at participant level
  - Decision-ID fixed effects
- **Additional analyses** (exploratory):
  - Never-delegator characteristics
  - Win-stay/lose-shift patterns
  - Individual difference analyses

---

## 5. Results (~1500 words)

### 5.1 Descriptive Statistics
- Sample characteristics by treatment
- Overall delegation rates
- Distribution of delegation frequencies

### 5.2 Primary Hypothesis Test
- **5.2.1 Round 1 Delegation**
  - Delegation rates: EV vs. Preference
  - Boschloo test results
  - Effect size

- **5.2.2 Overall Delegation**
  - Average delegation by treatment
  - Wilcoxon-Mann-Whitney test results
  - Effect size
  - Visualization: Figure 1 (average delegation over decisions)

- **5.2.3 Regression Analysis**
  - Main treatment effect
  - Treatment × period interaction
  - Table 1: Regression results

### 5.3 Never-Delegators Analysis
- **5.3.1 Prevalence**
  - Percentage of never-delegators by treatment
  - Figure 2: Delegation groups (always/sometimes/never) by treatment

- **5.3.2 Characteristics**
  - Demographics: age, gender, education, income
  - Risk attitudes
  - Trust propensity
  - Technology affinity
  - Statistical tests comparing never-delegators vs. others
  - Table 2: Never-delegator characteristics

- **5.3.3 Reasons and Satisfaction**
  - Satisfaction with Part 1 choices
  - Reasons for non-delegation (trust, control, etc.)
  - Hypothetical delegation scenarios

### 5.4 Win-Stay, Lose-Shift Patterns
- **5.4.1 Overall Patterns**
  - Stay rates by previous outcome
  - Differences between algorithms

- **5.4.2 Algorithm-Specific Patterns**
  - EV algorithm: response to wins/losses
  - Preference algorithm: response to wins/losses
  - Regression results
  - Table 3: Win-stay/lose-shift regression

### 5.5 Additional Analyses
- **5.5.1 Choice Quality**
  - Non-dominated choices when not delegating
  - Comparison between treatments

- **5.5.2 Individual Differences**
  - Correlation between delegation and individual characteristics
  - Subgroup analyses

- **5.5.3 Robustness Checks**
  - Alternative specifications
  - Exclusion sensitivity

---

## 6. Discussion (~1200 words)

### 6.1 Main Findings
- **Primary finding**: Personalization deters delegation
  - Participants delegated more to EV algorithm than personalized algorithm
  - Effect consistent across multiple analyses
- **Secondary finding**: Behavioral dynamics
  - Distinct patterns in win-stay/lose-shift
  - Never-delegators as interesting subgroup
- **Overall**: Counterintuitive result challenges assumptions about personalization benefits

### 6.2 Theoretical Implications
- **6.2.1 Algorithm Appreciation vs. Aversion**
  - Your findings in context of Logg et al. (2019) and Dietvorst et al. (2015)
  - When do people appreciate algorithms? (objective vs. subjective tasks)
  - Personalization as a double-edged sword

- **6.2.2 Role of Personalization in Trust**
  - Why might personalization reduce trust?
  - Perceived competence vs. perceived understanding
  - Connection to Castelo et al. (2019) and Jussupow et al. (2020)

- **6.2.3 MABA-HABA Framework**
  - Machines Are Better At (MABA) vs. Humans Are Better At (HABA)
  - EV algorithm aligns with MABA (objective calculation)
  - Personalized algorithm may blur boundaries
  - Implications for human-AI collaboration

- **6.2.4 Trust and Reliance**
  - Distinguishing trust attitude from reliance behavior
  - Your findings in context of Kohn et al. (2021) and Lee & See (2004)
  - Behavioral consequences of trust calibration

### 6.3 Practical Implications
- **6.3.1 AI System Design**
  - When to personalize vs. when to use objective algorithms
  - Transparency about algorithm type
  - User expectations and communication

- **6.3.2 Financial Advising**
  - Implications for robo-advisors
  - Balancing personalization with trust
  - User education about algorithm capabilities

- **6.3.3 Policy and Regulation**
  - Guidelines for AI-assisted decision-making
  - Consumer protection considerations
  - Disclosure requirements

### 6.4 Limitations
- **6.4.1 Experimental Design**
  - Online experiment with limited stakes
  - Specific domain (lottery choices)
  - Sample characteristics (Prolific, UK residents)
  - One-shot interaction (no long-term relationship)

- **6.4.2 Generalizability**
  - Domain-specific findings
  - Cultural factors
  - Real-world complexity

- **6.4.3 Measurement**
  - Self-reported measures
  - Limited behavioral data
  - Potential demand effects

### 6.5 Future Research
- **6.5.1 Extensions**
  - Longitudinal studies of delegation over time
  - Different domains (medical, legal, hiring)
  - Cross-cultural comparisons
  - Field experiments with real financial decisions

- **6.5.2 Mechanisms**
  - Deeper investigation of why personalization deters delegation
  - Role of transparency and explainability
  - Individual difference moderators

- **6.5.3 Design Interventions**
  - Testing ways to increase trust in personalized algorithms
  - Optimal balance between personalization and objectivity
  - User interface and communication strategies

---

## 7. Conclusion (~200 words)

This preregistered experiment provides novel evidence that personalization can deter rather than encourage delegation to algorithms. Participants were significantly more likely to delegate financial decisions to an EV-maximizing algorithm than to a personalized algorithm that incorporated their individual preferences. This counterintuitive finding challenges common assumptions about the benefits of personalization in AI systems and has important implications for the design of algorithmic advisors.

The results contribute to the literature on algorithm appreciation, trust in AI, and human-AI collaboration. They suggest that in certain contexts, particularly those involving objective calculations, people may prefer algorithms that are perceived as competent and objective rather than those that attempt to personalize recommendations. This has practical implications for the design of AI systems in finance and other domains where delegation decisions are important.

Future research should explore the mechanisms underlying this effect and test interventions to optimize the balance between personalization and trust. As AI continues to play an increasing role in decision-making, understanding when and why people delegate to algorithms will be crucial for designing systems that are both effective and trusted.

---

## 8. References

[To be compiled from Lit folder - approximately 30-40 references]

Key references to include:
- Dietvorst et al. (2015) - Algorithm aversion
- Logg et al. (2019) - Algorithm appreciation
- Kohn et al. (2021) - Trust in automation
- Lee & See (2004) - Trust in automation
- Castelo et al. (2019) - Task-dependent algorithm aversion
- Jussupow et al. (2020) - Algorithm aversion review
- Glikson & Woolley (2020) - Trust in AI
- Holzmeister et al. (2023) - Delegation in finance
- Freer et al. (2023) - Motives for delegation
- Klingbeil et al. (2024) - Trust and reliance on AI
- And others from your Lit folder

---

## 9. Appendices

### Appendix A: Additional Regression Tables
- Full regression results with all controls
- Robustness checks
- Alternative specifications

### Appendix B: Experimental Materials
- Instructions (Part 1 and Part 2)
- Example lottery choices
- Questionnaire items

### Appendix C: Additional Analyses
- Detailed never-delegator analysis
- Win-stay/lose-shift by individual
- Correlation matrices

### Appendix D: Preregistration Document
- Link to AsPredicted registration
- Deviations from preregistration (if any)

---

## Figures and Tables

### Figures
1. **Figure 1**: Average delegation over decisions (Part 2) by algorithm type
2. **Figure 2**: Distribution of average delegation by algorithm (violin/box plots)
3. **Figure 3**: ECDF of average delegation
4. **Figure 4**: Delegation groups (always/sometimes/never) by treatment
5. **Figure 5**: Win-stay/lose-shift patterns by algorithm

### Tables
1. **Table 1**: Descriptive statistics by treatment
2. **Table 2**: Main regression results (delegation on treatment)
3. **Table 3**: Never-delegator characteristics
4. **Table 4**: Win-stay/lose-shift regression results
5. **Table 5**: Individual difference correlations

---

## Word Count Targets
- Abstract: 200 words
- Introduction: 800 words
- Literature Review: 1200 words
- Method: 1000 words
- Results: 1500 words
- Discussion: 1200 words
- Conclusion: 200 words
- **Total**: ~6100 words (excluding references, tables, figures)

This aligns well with the Klingbeil et al. paper length and CHB standards.