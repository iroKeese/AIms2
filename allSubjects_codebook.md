# Codebook for allSubjects.csv

Source files used:
- allSubjects.csv
- export..txt (treatment/screen logic and questionnaire wording)

Notes:
- Rows: 260 participant records (+ header).
- Descriptions combine explicit treatment logic and variable-name inference where no direct label is available.
- Many Time* variables are event timestamps from z-Tree screen flow.

| Variable | Type | Non-missing | Unique values | Quick values summary | Description |
|---|---:|---:|---:|---|---|
| SessionID | character | 260 | 1 | top: 260206_1528 | Session identifier. |
| TreatmentNumber | integer | 260 | 250 | min=3, max=553 | Treatment index from z-Tree session/treatment table. |
| Table | character | 260 | 1 | top: subjects | z-Tree source table name for the row (e.g., subjects). |
| Period | integer | 260 | 1 | min=1, max=1 | z-Tree period index. |
| Subject | integer | 260 | 1 | min=1, max=1 | z-Tree subject identifier within session. |
| ClientNumber | integer | 260 | 250 | min=1, max=276 | z-Tree client number. |
| LastClientNumber | integer | 260 | 1 | min=0, max=0 | Last known client number in session. |
| Group | integer | 260 | 1 | min=1, max=1 | z-Tree group identifier. |
| Profit | integer | 260 | 1 | min=0, max=0 | Current-period payoff (points). |
| TotalProfit | integer | 260 | 1 | min=0, max=0 | Accumulated payoff (points). |
| Participate | integer | 260 | 1 | min=1, max=1 | Participation/continuation flag used by exclusion logic. |
| LeaveStage | integer | 260 | 2 | min=0, max=1 | Flag that ends a stage/flow branch. |
| EVAlgorithm | integer | 260 | 2 | min=0, max=1 | Treatment flag: 1 = EV-maximizing algorithm; 0 = preference-based algorithm. |
| PrefAlgorithm | integer | 260 | 2 | min=0, max=1 | Treatment flag: 1 = preference-based algorithm; 0 = EV-maximizing algorithm. |
| AlgorithmChoice | integer | 260 | 1 | min=0, max=0 | Residual treatment marker (constructed as 1-EVAlgorithm-PrefAlgorithm). |
| ProlificID | character | 260 | 250 | top: 5e31a3142c324c17ab9061d5 \| 5eda19fa68ef200309777c96 \| 5f7aaea6bf94dd717b471063 | Participant identifier from Prolific. |
| Captcha5 | integer | 260 | 3 | min=3, max=7 | Variable exported from z-Tree treatment/subject tables; meaning inferred from name only (no explicit label found). |
| Consent | integer | 260 | 2 | min=-1, max=1 | Variable exported from z-Tree treatment/subject tables; meaning inferred from name only (no explicit label found). |
| BotCheck2 | integer | 260 | 2 | min=-1, max=2 | Variable exported from z-Tree treatment/subject tables; meaning inferred from name only (no explicit label found). |
| BotCheck1 | integer | 260 | 1 | min=-1, max=-1 | Variable exported from z-Tree treatment/subject tables; meaning inferred from name only (no explicit label found). |
| BotCheck1x | numeric | 260 | 224 | min=-1, max=57.5675675675676 | Variable exported from z-Tree treatment/subject tables; meaning inferred from name only (no explicit label found). |
| BotCheck1y | numeric | 260 | 207 | min=-1, max=0.0462184873949579 | Variable exported from z-Tree treatment/subject tables; meaning inferred from name only (no explicit label found). |
| Delegate | integer | 260 | 1 | min=-1, max=-1 | Delegation choice in current decision screen (typically 1 = delegate, 0 = self-select). |
| Option | integer | 260 | 1 | min=-1, max=-1 | Chosen option index in current decision context. |
| StartTimeOfExperiment | integer | 260 | 1 | min=0, max=0 | Timestamp/event time when experiment starts. |
| TimeOKWelcomeOK | integer | 260 | 1 | min=99999, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeOKCaptcha1OK | integer | 260 | 1 | min=99999, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeOKOutOK | integer | 260 | 9 | min=0, max=56 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueOverview1OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeConfirmOverview2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeOKOut2OK | integer | 260 | 1 | min=0, max=0 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| BotCheck1attempt | integer | 260 | 3 | min=0, max=2 | Attempt count for first bot/system check. |
| BotWarning | integer | 260 | 1 | min=0, max=0 | Warning flag in bot/system check stage. |
| TimeOKBotCheck2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeOKOut3OK | integer | 260 | 2 | min=0, max=52 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueInstructionsPart1aOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueInstructionsPart1bOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueInstructionsPart1cOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| CompQ205 | integer | 260 | 5 | min=-99, max=525 | Comprehension-question response variable (raw selected option code). |
| CompQ10 | integer | 260 | 6 | min=-99, max=25 | Comprehension-question response variable (raw selected option code). |
| CompQ3 | integer | 260 | 5 | min=-99, max=4 | Comprehension-question response variable (raw selected option code). |
| auxPage | integer | 260 | 3 | min=1, max=4 | Variable exported from z-Tree treatment/subject tables; meaning inferred from name only (no explicit label found). |
| TimeNextComprehensionQsOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeBackComprehensionQsOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueComprehensionQsOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| Part1CQsPassedOnAttempt | integer | 260 | 4 | min=-99, max=2 | Part-1 comprehension check pass marker/attempt index. |
| CompQ3a | integer | 260 | 5 | min=-99, max=4 | Comprehension-question response variable (raw selected option code). |
| CompQ205a | integer | 260 | 5 | min=-99, max=525 | Comprehension-question response variable (raw selected option code). |
| CompQ10a | integer | 260 | 5 | min=-99, max=25 | Comprehension-question response variable (raw selected option code). |
| TimeOKComprehensionQsReplayOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeNextComprehensionQsReplayOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeBackComprehensionQsReplayOK | integer | 260 | 1 | min=0, max=0 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| Screen | integer | 260 | 2 | min=0, max=1 | Part-1 screen/decision counter. |
| Warning | integer | 260 | 1 | min=-99, max=-99 | Warning/validation flag in decision screens. |
| i | integer | 260 | 1 | min=9, max=9 | Auxiliary loop/index variable used by z-Tree scripts. |
| OptionsetID | integer | 260 | 6 | min=0, max=6 | Lottery option-set identifier shown in current context. |
| OrderNumber | integer | 260 | 3 | min=0, max=2 | Displayed order index of option row. |
| Up | integer | 260 | 2 | min=0, max=1 | Randomized orientation/order helper variable. |
| Confident | integer | 260 | 11 | min=0, max=10 | Confidence rating collected after each Part-1 choice. |
| TimeOKPart1OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeNextPart1OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| ConfidentPart1 | integer | 260 | 1 | min=-99, max=-99 | Aggregated/confidence measure for Part 1. |
| SatisfiedPart1 | integer | 260 | 11 | min=-99, max=10 | Overall satisfaction with Part-1 choices (0-10 scale). |
| TimeOKInstructionsPart2aOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueInstructionsPart2bOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueInstructionsPart2cOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueInstructionsPart2dOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| CompQ1 | integer | 260 | 3 | min=-99, max=1 | Comprehension-question response variable (raw selected option code). |
| CompQ2 | integer | 260 | 4 | min=-99, max=2 | Comprehension-question response variable (raw selected option code). |
| CompQ1b | integer | 260 | 3 | min=-99, max=8 | Comprehension-question response variable (raw selected option code). |
| CompQ0 | integer | 260 | 4 | min=-99, max=10 | Comprehension-question response variable (raw selected option code). |
| TimeNextComprehensionQsP2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeBackComprehensionQsP2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueComprehensionQsP2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| Part2CQsPassedOnAttempt | integer | 260 | 3 | min=0, max=2 | Part-2 comprehension check pass marker/attempt index. |
| CompQ1a | integer | 260 | 3 | min=-99, max=1 | Comprehension-question response variable (raw selected option code). |
| CompQ2a | integer | 260 | 4 | min=-99, max=2 | Comprehension-question response variable (raw selected option code). |
| CompQ1ba | integer | 260 | 3 | min=-99, max=8 | Comprehension-question response variable (raw selected option code). |
| CompQ0a | integer | 260 | 5 | min=-99, max=20 | Comprehension-question response variable (raw selected option code). |
| TimeNextComprehensionQsP2ReplayOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeBackComprehensionQsP2ReplayOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueComprehensionQsP2ReplayOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeContinueIntroPart2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| NthDecision | integer | 260 | 2 | min=1, max=9 | Decision index in Part 2 (1..8/9 depending screen context). |
| TimedOutDelegationChoice | integer | 260 | 1 | min=1, max=1 | Timeout flag for delegation-choice window. |
| TimedOutOptionChoice | integer | 260 | 2 | min=0, max=1 | Timeout flag for option-choice window. |
| SatisfactionRating | integer | 260 | 1 | min=-99, max=-99 | Post-task satisfaction rating in Part 2 (diamond scale). |
| l | integer | 260 | 2 | min=0, max=18 | Internal timer tick variable used for screen timing. |
| aux_switch1 | integer | 260 | 2 | min=-99, max=1 | Auxiliary switching/control variable in part-2 scripts. |
| DelegateA[1] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| DelegateA[2] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| DelegateA[3] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| DelegateA[4] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| DelegateA[5] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| DelegateA[6] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| DelegateA[7] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| DelegateA[8] | integer | 260 | 3 | min=-1, max=1 | Array-style variable for Part-2 decision slot; base variable: Delegate. |
| TimedOutOptionChoiceA[1] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimedOutOptionChoiceA[2] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimedOutOptionChoiceA[3] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimedOutOptionChoiceA[4] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimedOutOptionChoiceA[5] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimedOutOptionChoiceA[6] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimedOutOptionChoiceA[7] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimedOutOptionChoiceA[8] | integer | 260 | 2 | min=0, max=1 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| OptionsetIDA[1] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionsetIDA[2] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionsetIDA[3] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionsetIDA[4] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionsetIDA[5] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionsetIDA[6] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionsetIDA[7] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionsetIDA[8] | integer | 260 | 9 | min=0, max=8 | Array-style variable for Part-2 decision slot; base variable: OptionsetID. |
| OptionA[1] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| OptionA[2] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| OptionA[3] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| OptionA[4] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| OptionA[5] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| OptionA[6] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| OptionA[7] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| OptionA[8] | integer | 260 | 10 | min=-1, max=8 | Array-style variable for Part-2 decision slot; base variable: Option. |
| TimedOutOptionChocie | integer | 260 | 2 | min=0, max=1 | Likely typo variant of TimedOutOptionChoice in exported table. |
| auxSwitch | integer | 260 | 2 | min=-99, max=0 | Auxiliary switching/control variable. |
| TimeContinuePart2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TimeOKPart2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| DelegateHyp10 | integer | 260 | 3 | min=-99, max=1 | Hypothetical delegation choice for 10 additional tasks. |
| TimeNextHypothetic10OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| ProbOfBadComputerChoices | integer | 260 | 11 | min=0, max=10 | Subjective probability that computer makes bad choices. |
| ProbOfAbsurdComputerChoices | integer | 260 | 10 | min=0, max=10 | Subjective probability that computer makes absurd choices. |
| ComputerRiskTaking | integer | 260 | 11 | min=0, max=10 | Perceived risk-taking of computer (0-10). |
| TimeNextReasonsForHypDelegationChoiceOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| DontTrust | integer | 260 | 2 | min=0, max=1 | Reason item selected: did not trust computer. |
| BetterJob | integer | 260 | 2 | min=0, max=1 | Reason item selected: computer would do better. |
| HowExactly | integer | 260 | 2 | min=0, max=1 | Reason item selected: unclear how computer decides exactly. |
| MoreInfo | integer | 260 | 2 | min=0, max=1 | Reason item selected: participant wanted more information. |
| Responsibility4Choice | integer | 260 | 2 | min=0, max=1 | Reason item selected: wants responsibility for the choice. |
| Responsibility4Outcome | integer | 260 | 2 | min=0, max=1 | Reason item selected: wants responsibility for outcome. |
| DislikeRelyingOn | integer | 260 | 2 | min=0, max=1 | Reason item selected: dislikes relying on computer. |
| Reactance2Analysis | integer | 260 | 2 | min=0, max=1 | Reason item selected: reactance to computer analysis/interference. |
| PerformanceCuriosity | integer | 260 | 2 | min=0, max=1 | Reason item selected: curiosity about own/computer performance. |
| Tedious | integer | 260 | 2 | min=0, max=1 | Reason item selected: task is tedious / effort-saving motive. |
| Other | integer | 260 | 2 | min=0, max=1 | Reason item selected: other reason given. |
| OtherText | character | 36 | 37 | top:  \| computer automatically chooses highest total average payoff, so i dont have to calculate it myself. \| Due to the time constraints I thought the computer would be able to choose an answer quicker than me | Open-text "other" reason. |
| TimeNextReasonsForHypDelegationChoice2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| RiskTaking | integer | 260 | 11 | min=0, max=10 | Self-reported willingness to take risks in financial matters. |
| FinMarketExperience | integer | 260 | 11 | min=0, max=10 | Self-reported financial market experience. |
| FinanciallyResponsible | integer | 260 | 11 | min=0, max=10 | Self-reported financial responsibility. |
| AIXperience | integer | 260 | 11 | min=0, max=10 | Self-reported frequency of AI use/interactions. |
| TimeNextQaire1OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| Female | numeric | 260 | 4 | min=-1, max=1 | Gender indicator (typically 1 = female). |
| Age | integer | 260 | 54 | min=0, max=71 | Age in years. |
| Education | integer | 260 | 7 | min=0, max=6 | Highest completed education category. |
| HHIncome | integer | 260 | 13 | min=-1, max=105 | Household income category. |
| TimeNextQaire2OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| Reliable | integer | 260 | 6 | min=-99, max=7 | Self-reported agreement that the participant provided thoughtful answers throughout the study. |
| AIUsageInStudy | integer | 260 | 3 | min=-99, max=1 | Indicator whether participant used AI tools during study. |
| TimeNextQaire3OK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| AIWasUsed4 | character | 3 | 4 | top:  \| I didn't \| I didnt use it, accidental click | Open text: what AI was used for (if applicable). |
| TimeNextQaire3aOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| Manx | logical | 0 | 0 | all NA/empty | Additional open-text feedback field in questionnaire. |
| TimeNextQaire4FALSEOK | integer | 260 | 1 | min=0, max=0 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| RandomPeriod | integer | 260 | 8 | min=1, max=8 | Randomly selected payoff-relevant period/decision. |
| RelevantPayoff | integer | 260 | 23 | min=-99, max=890 | Payoff from selected period used for payment. |
| Feedback | character | 92 | 62 | top:  \| no \| No | Feedback value shown after decision (outcome/points). |
| TimeProceedTHANKYOUOK | integer | 260 | 2 | min=0, max=99999 | Timestamp/event-time variable for pressing continue/next/ok in a specific stage/screen. |
| TotalSecondsInExperiment | integer | 260 | 1 | min=0, max=0 | Total duration of participation in seconds. |
