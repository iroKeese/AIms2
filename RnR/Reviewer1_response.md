# Response to Reviewer 1

Edits referenced below are in `AIms2_CHBR_R1.tex` (marked with `\inew{...}`). We thank
the reviewer for an exceptionally thorough and constructive report; we address every
point below, organized by the reviewer's eight numbered questions.

## 1. Are the objectives and rationale clearly stated?

**Separate primary vs. exploratory objectives up front.** Done — we added a paragraph
at the end of the "Preregistered hypothesis and analysis plan" subsection stating the
exploratory objectives (categorical non-delegation; dissociating authority-based from
accuracy-based accounts) explicitly, before the results are presented.

**State boundary conditions earlier.** We believe the abstract already does this
adequately: it states that personalization "did not increase delegation at any point of
the task" and then explains that the effect is concentrated at first contact while
subsequent-decision rates are statistically indistinguishable, so the scope condition is
visible from the first paragraph a reader encounters.

**Justify the lottery-choice paradigm as the test domain.** Done — we added a new
paragraph immediately after the theoretical-framework paragraph explaining why lotteries
provide a clean test: payoffs/probabilities are unambiguous (ruling out competence
confounds), preferences are directly elicitable and verifiable by the experimenter, and
EV is objectively computable, letting the two algorithms be equated on accuracy and
legitimacy while differing only in personalization — a contrast real financial or
medical decisions could not deliver cleanly.

**Pre-empt the wording-confound issue.** We now acknowledge this explicitly in the
Limitations section (see point 7 below) rather than letting readers discover it
unflagged. We also state that the asymmetry is partly deliberate: in the earlier pilot the
preference-based description lacked any optimization claim, so we added "selects the best
option for you" in the present study to rule out that the missing optimization claim
explained the EV advantage. The first-contact gap remained (11.1 points vs. about 20 in the
pilot), so it cannot be attributed to that omission. We note that the two studies differ in
other respects, so we do not attribute the smaller gap to the wording change, and that a
difference in register remains.

**Motivate categorical non-delegation theoretically before the results.** We have
intentionally not reframed this as something anticipated ex ante in the Introduction,
to avoid blurring the line between confirmatory and exploratory analyses. The
theoretical link (heterogeneous valuation of decision rights predicting a subgroup
structure) is made in the Theoretical Framework section, and the analysis itself is
explicitly and repeatedly labeled non-preregistered/exploratory in the Results and in
the abstract (see point 5 below). We think this strikes the right balance: the
theoretical rationale is given, without implying the test was planned in advance.

**Strengthen the rationale for why the effect should reverse after feedback.** Similarly,
we have kept the "construal dominates early, outcomes dominate later" logic primarily in
the Discussion rather than building it into the a priori theoretical framework, for the
same reason — the round-by-round decomposition was not the preregistered test, and
presenting its rationale as derived from the theory ex ante would overstate how much of
it was anticipated before seeing the data.

**Tighten the applied rationale with a concrete statistic.** We did not find a
citable, meaningful robo-advisor "adoption rate" statistic — as the reviewer's own
question implicitly recognizes, non-adoption is rarely observable at the population
level in field data, which is precisely the kind of comparison our controlled design is
suited to make instead. We have left the applied motivation at its current, intentionally
general level rather than citing a number we could not verify.

## 2. Reproducibility

**Data/code availability.** A full replication package (participant- and decision-level
data, the complete analysis script reproducing every statistic and figure in the paper,
and the full task matrices) now exists and has been made available to the editor and
reviewers for this round of review; we note in the manuscript that we have deliberately
not made it publicly accessible before acceptance, given a specific prior concern about
unauthorized reuse of the materials.

**Full Part-1/Part-2 payoff matrices.** Added as a new Appendix, built from the
previously-prepared `FullTaskTableWithExemplaryOrdering.ods` file: Table A.1 lists all 12
Part-1 binary-choice tasks, and Table A.2 lists all 8 Part-2 option sets (8 options
each) actually used in the experiment, including the mapping back to their Part-1 anchor
task and the randomized Part-1/Part-2 presentation order.

**Full verbatim instructions and response options.** The complete participant
instructions now exist in `AIms2_Participant_Instructions.md`/`fullInstructions.pdf` and
will be included in the replication package. For the specific closed-item reason labels
in Figure 4 (`DontTrust`, `BetterJob`, etc.), we added the full verbatim wording of each
item directly to the figure caption, so a reader no longer has to infer meaning from
variable-name shorthand.

**Decoy/ordering algorithm.** The exact fixed display-order rule is now fully
specified via the new appendix tables (Table A.2 gives the actual option sets and their
construction; the full column-by-column display order used on screen is further
detailed in the replication package).

**Formal regression equation.** Added. Section 3.4 ("Preregistered outcomes and
analyses") now states the exact LPM specification as a numbered equation, with every
term defined (treatment indicator, within-part decision number, prior-zero-outcome
share, task fixed effects, clustering).

## 3. Statistical analyses, controls, and reporting

**No confidence intervals / effect sizes anywhere.** Addressed comprehensively. We
computed exact effect sizes and 95% CIs for all three primary/secondary results directly
from the raw session data and added them to the text, plus a new summary table
(Table 1) collecting all three in one place:
- **Round-1 delegation (Boschloo, prereg.):** risk difference 11.1pp (Wald 95% CI
  [−1.3, 23.7]); OR = 1.60 (Fisher's exact two-sided 95% CI [0.91, 2.84]). We flag
  explicitly that a two-sided 95% CI spanning zero is not in tension with a significant
  one-sided test at the same nominal level — different coverage conventions.
- **Average delegation (WMW, prereg.):** rank-biserial $r \approx 0.05$ (bootstrap 95%
  CI [−0.10, 0.20]), consistent with the null result.
- **Categorical non-delegation (new, see next point; exploratory):** risk difference 12.3pp (Wald
  95% CI [4.9, 19.7]); OR = 5.25 (Fisher's exact 95% CI [1.65, 22.07]).

On the question of one-sided vs. two-sided CIs for the primary tests: we decided against
switching to (or adding) one-sided CIs, precisely because of the "would look suspicious"
concern raised internally — one-sided CIs are unconventional in this literature, and
pairing a one-sided hypothesis test with a one-sided CI invites the appearance of
tailoring inference to get a desired answer. The two-sided CIs we report are the
standard, conservative choice, and we explain the (unsurprising) zero-crossing
explicitly in the text so it is not misread as contradicting the significant
preregistered result.

**No standardized effect sizes.** See above — risk differences and odds ratios are now
reported for all three key contrasts.

**Multiple comparisons in Section 4.4 (never-delegator characterization) not
flagged.** We have not added an additional, separate multiple-comparisons caveat here,
because the existing power caveat (new limitations text, see point 4 below) already does
the necessary work: it tells the reader that this entire family of comparisons is
underpowered and that null results should not be over-interpreted, which is the more
binding constraint in a sample of 22 never-delegators (18 vs. 4 by condition) — inflated
Type-I error from eight tests is a second-order concern relative to a family of tests
that mostly cannot detect anything but very large effects regardless. We are happy to add
an explicit multiple-comparisons sentence as well if it still seems necessary.

**Sample-size/power justification.** Addressed with a full retrospective power
analysis, now reported in a new appendix (Appendix C), with a two-sentence summary in
the Limitations section. Using only information available *before*
the present study was run (the pilot's effect sizes: ~21.6pp at first contact, ~19.1pp
in average delegation), the minimum detectable effect at 80% power for $n=100$–120/arm
is ~16–17pp (first contact) and ~10–11pp (average delegation) — both comfortably below
the pilot's observed gaps, so the design looked adequately powered ex ante. The
first-contact effect that materialized (11.1pp) fell below the ex-ante detection
threshold, which we offer as a plausible, purely descriptive explanation for why that
result is only marginally significant; critically, we do **not** compute a "power" figure
for the realized 11.1pp effect itself, since retrospective power computed from a study's
own observed effect is a well-documented statistical fallacy (Hoenig & Heisey, 2001) —
it is a deterministic function of the p-value and adds no information. For the null
average-delegation result, ex-ante power was very high (99.7–99.9% for an effect of the
pilot's size), so we explicitly do *not* invoke power to explain that null; instead we
point to the regression evidence and the round-by-round pattern showing genuine
convergence to zero after round 1.

**Interpretation of borderline p-values.** We have not added a dedicated discussion
of "sensitivity to the 0.05 threshold" for the round-1 result: we do not treat $\alpha =
0.05$ as a privileged cutoff whose proximity requires special comment, and we would not
have wanted a symmetric demand for comment had the one-sided p-value instead been 0.059.
We think the effect-size/CI reporting added above already gives readers everything they
need to judge the evidential strength of the result directly, which we see as the more
informative response to this concern than hedging around the significance threshold
itself.

**Small-cell caution for the EV never-delegator subgroup (n=4).** On inspection, we
confirmed this caution is in fact already applied consistently: the one place the
EV-condition never-delegator subgroup's pattern is visually present (Figure 4) is
explicitly flagged in the surrounding text ("we do not interpret [this contrast],
because the EV never-delegator subgroup comprises only four participants"), and no
interpretive claim anywhere in the paper relies on that subgroup specifically — all
interpreted contrasts in that subsection compare delegators to never-delegators pooled
across treatments. We believe the existing text already satisfies this request, but are
glad to add a further explicit reminder if a specific remaining sentence still reads as
relying on the n=4 cell.

**Assumption checks for t-tests.** Added. The relevant subsection now includes a
footnote confirming that (a) all reported t-tests already use the Welch correction for
unequal variances, and (b) every null conclusion in that subsection is also confirmed by
the non-parametric Wilcoxon rank-sum equivalent (age: $p=0.649$; time in experiment:
$p=0.105$; risk-taking: $p=0.854$; reliability: $p=0.956$; AI experience: $p=0.445$) —
verified directly from the raw data rather than assuming large-$n$ robustness.

## 4. Additional tables/figures

**Summary table of primary tests.** Added as Table 1 (new, in the Results "Overview"
subsection): test name, outcome, comparison, statistic, p-value, and effect size/CI for
both preregistered primary tests plus the categorical non-delegation contrast, so a
reader can see at a glance which hypotheses were confirmed and which were null.

**CONSORT-style exclusion breakdown.** Already addressed in an earlier round (for other
reviewers) and retained here: the exact breakdown of the 7 excluded participants by
criterion (1 bot/slider failure, 4 careful-participation failures, 3 disclosed-AI-usage
cases, with noted overlaps) is in the Method section. We have not added a separate visual
flow diagram, since with only 7 exclusions split across two conditions we do not think a
diagram adds clarity beyond the prose breakdown; we would also gently push back on
reading anything into whether such small exclusion counts are "balanced" across
conditions — with numbers this low, noisy imbalances in percentage terms (e.g., a 2-vs-5
split) are expected under pure chance and are not informative about differential
exclusion bias.

**Full task-matrix table.** Added as the new Appendix (Tables A.1–A.2; see point 2
above).

**Confidence intervals/error bars on all figures.** We have added CIs to the text
wherever a precise estimate is discussed (see point 3), but have not added error bars to
Figure 3 (the ECDF) or Figure 4 (the reasons bar chart), for two reasons specific to
each: an ECDF already displays the full empirical distribution of every participant's
average delegation rate, so there is no separate "uncertainty" to overlay without
changing what the figure shows; and the between-subgroup percentages discussed in the
text around Figure 4 (e.g., 70.1% vs. 36.4%) are comparisons of *all* delegators vs. *all*
never-delegators pooled across treatments, whereas the figure itself is split by
treatment — we added a clarifying sentence to the text noting this distinction
explicitly, since this discrepancy (rather than the absence of error bars) was the more
likely source of confusion. We agree Wilson score intervals would be the right choice if
CIs were added to that figure in a future revision (e.g., as a pooled-data panel), but
given the very small never-delegator cells involved (as low as $n=4$), we are not
convinced such intervals would add information beyond what the displayed percentages and
participant counts already convey.

**Figure 4 item labels.** Addressed — the full verbatim wording of each closed-item
reason is now given in the figure caption (see point 2 above).

## 5. Are interpretation and conclusions supported by the data?

**Recalibrate the abstract/title framing.** We have kept the abstract's core sentence
("Personalization did not increase delegation at any point of the task...") as is: we
believe it is accurate rather than overclaiming, since our theoretical prior (based on
the personalized algorithm's higher expected utility) was that personalization *should*
have increased delegation, and the finding that it did not — combined with it actively
*decreasing* delegation at two distinct margins — is precisely what the sentence
reports. We have, however, made the targeted change below.

**Flag categorical non-delegation as exploratory in the abstract.** Done — the
abstract now reads "...in an exploratory analysis, categorical non-delegation...was
substantially more prevalent under personalization," giving this status equal billing
with the confirmatory first-contact result at the point readers first encounter it.

**Soften "isolates" language.** Done, exactly as suggested: "our evidence isolates a
second, conceptually distinct channel" now reads "our evidence is most consistent with a
second, conceptually distinct channel," aligning the Discussion's confidence level with
the hedging already present in the Limitations section.

**Reconcile "not accuracy-based" with the self-reported distrust data.** Done — we
expanded the parenthetical into a full paragraph distinguishing *distrust of the
algorithm's accuracy* (which our quantitative expectation data speak to directly and
rule out) from a more diffuse *distrust of ceding the choice to any external party*
(which the single closed-item wording plausibly also picks up without distinguishing
the two). We note this as a conflation in the item's wording rather than a contradiction
in the evidence, and flag a cleaner closed-item design as a direction for future work.

**Temper real-world generalization claims (Section 5.5/"Implications and future
research").** Done, using language close to your suggested wording: we added a sentence
stating explicitly that the robo-advisor/healthcare/hiring extensions "are speculative
given the abstract, single-domain, and time-constrained nature of our lottery task" and
are offered as hypotheses for domain-specific replication rather than established
implications.

**Apply small-cell caution consistently.** As noted under point 3 above, we checked
and confirmed the EV never-delegator subgroup (n=4) is not relied upon for any
interpretive claim beyond the one place it is already explicitly flagged.

## 6. Strengths

Thank you very much for this detailed and encouraging assessment — it is genuinely
useful to know which specific design choices (the first-contact isolation, the
accuracy/authority dissociation, the categorical-non-delegator subgroup) came through as
intended.

## 7. Limitations

We have substantially expanded the Limitations section with seven distinct points (up
from three; the numbering in the manuscript is First to Seventh), incorporating essentially every substantive gap you identified:

1. *(Existing, expanded)* Stylized task domain — clarified that Part-2 choices were
   real and incentivized, with the stylization limited to the task domain rather than
   to the incentive structure.
2. *(Existing, expanded)* Mechanism not causally identified — plus **two new additions**
   directly responding to this review: (a) an explicit acknowledgment that the two
   algorithm descriptions differ in linguistic register as well as decision rule, with
   the deliberate addition of an optimization claim to the preference-based description
   (relative to the pilot) offered as evidence against a purely wording-driven account; and (b) an explicit discussion of whether low self-chosen
   choice quality (~35% non-dominated) could confound the choice-authority
   interpretation — we show never-delegators' own choice quality is statistically
   indistinguishable from that of delegators (Welch $p=0.806$; Wilcoxon $p=0.669$),
   arguing against a task-difficulty account of categorical non-delegation specifically.
3. *(New, "Third")* The EV and preference-based treatments differ along several
   dimensions at once, so the design identifies a difference between two decision rules,
   not a pure personalization effect (added in response to Reviewer 2).
4. *(Existing, renumbered "Fifth")* Short-run repeated interaction only.
5. *(New, "Sixth")* The ex-ante power analysis described under point 3 above, summarized
   in two sentences in the Limitations and reported in full in Appendix C.
6. *(New, "Seventh")* UK/Prolific sample — we note explicitly that cultural background,
   algorithm familiarity, and panel composition could affect the magnitude (though we
   have no principled reason to expect the *direction*) of the effect.

## 8. Structure, flow, and writing

**Subheadings in Section 4.6 ("Exploratory mechanisms").** Done — added the missing
third `\subsubsection*` header ("Which expectations are most tightly linked to
delegation?") so all three questions posed at the start of the subsection now have a
matching, explicit header.

**Move detailed task-construction description to an appendix.** We have left the
narrative description in the main Method text for now and instead added the full
numeric matrices as a new appendix (Tables A.1–A.2); we think this addresses the
underlying replicability concern (a replicator now has the exact matrices) while
avoiding a larger restructuring of Section 3.2 at this stage. We are open to relocating
the prose description itself in a further revision if the main text is still felt to be
too dense.

**Consolidate repeated contribution statements.** We agree and have consolidated. The
Introduction now holds the single explicit contribution list, reduced from four to three
points (the preregistered comparison and its concentration at first contact are merged;
the authority- versus accuracy-based separation is stated with the hedged wording used
elsewhere). Section 2.7 is retitled "Synthesis and research gap" and no longer lists what
the study examines. The opening restatement in the "Interpretation and relation to prior
work" subsection was deleted. The separate "Contributions" subsection of the Discussion was
removed; its one non-duplicative point (adoption-stage resistance versus error-driven
withdrawal during use, observed in exploratory analyses) now closes the "Theoretical
implications" subsection. "Core finding" is kept as the normal opening of the Discussion.

**Language editing.** As with the other reviewers, we will run an additional
proofreading pass (including a native-speaker read-through) before resubmission, beyond
the AI-assisted language support already disclosed in the "Declaration of generative AI"
subsection.

## Weaknesses noted at the end of the report

**Theoretical omission of psychological ownership / the "AI Ghostwriter Effect."** We
appreciate this pointer to a related literature. We have not built a new theoretical
subsection around it, but the Discussion ("Interpretation and relation to prior work")
now states that a psychological-ownership account is compatible with ours and cites
Draxler et al. (2024, the AI Ghostwriter Effect). We note the limits of that evidence:
it concerns text generation, and personalization did not alter ownership there, so it
does not directly predict our result. We list ownership measures as future work.

**"Responsibility trap" / responsibility-offloading as a driver.** We added a paragraph to
the Discussion that addresses this account explicitly and cites Maasland & Weißmüller
(2022), who find that blame avoidance is a weak motive for delegation relative to
algorithm aversion, and Gogoll & Uhl (2018), who find that reluctance to delegate to a machine is not explained by perceived utility,
trust, or a lower ability to pass on responsibility (again with the caveat that everyone
had to delegate to someone, so the design compares agents rather than delegating vs.
deciding oneself). We acknowledge that we did not measure anticipated blame directly.
The account is also already represented in our design and results: the closed-item
reasons include two responsibility-related items ("I didn't want to be responsible for
choosing the option" and "I didn't want to be responsible if a low payment results").
In revising this point we noticed that the choice-responsibility item is worded according
to the hypothetical choice (participants who decide themselves can say they wanted to be
responsible, participants who delegate can say they did not want to be), so the pooled
comparison of never-delegators with the rest (63.6% vs. 38.9%) largely contrasts reasons
for deciding oneself with reasons for delegating. The hypothetical choice closely mirrors
actual behavior (91% of never-delegators decide themselves, 95% of always-delegators
delegate; Spearman correlation with the Part-2 delegation share 0.68). The text now
reports the within-choice figures: 66.4% of those who decide themselves say they wanted to
be responsible, and 16.2% of those who delegate say they did not want to be (about one in
four endorse either responsibility item). We read this as responsibility for the choice
being the dominant stated reason for deciding oneself, with a minority of delegators citing
responsibility avoidance, so some responsibility shifting among delegators is not
excluded. We added a note to the Figure 4 caption and to Section 4.6 explaining how the
item reads, and we no longer present the pooled contrast as evidence for a
never-delegator-specific motive.

**Structural/presentational artifacts (incomplete abstract sentences, header typos like
"Reoretical," fragmented references).** We carefully checked the current manuscript
(`AIms2_CHBR_R1.tex`) for each of these specific issues and did not find them: the
abstract contains no incomplete sentences, no section or subsection header reads
"Reoretical" (or similar), and we did not identify fragmented formatting in the
references. We suspect these artifacts may be specific to the originally submitted PDF
rendering (e.g., a font-substitution or line-break artifact during PDF export) rather
than present in the underlying LaTeX source. If you can point us to the specific
page/location where these appear in the PDF you reviewed, we will fix them immediately;
in the meantime, we have re-verified a clean compile of the current source with no such
artifacts.

**Insufficient statistical reporting for categorical non-delegation.** Fully addressed
— we added an explicit significance test (a one-sided Boschloo exact test, $p < 0.001$; two-sided
$p = 0.001$) directly to the sentence introducing the categorical non-delegation contrast,
alongside the risk-difference/OR effect sizes described under point 3 above. We use the same
test as for our preregistered first-contact comparison; since this outcome was not
preregistered, we flag the test as exploratory in the text and in Table 1.

**Zero-outcome-frequency mechanism "insufficiently supported."** We agree, and we
have removed the claim. The submitted version stated that the EV algorithm mechanically
produces more zero-payoff outcomes for most participants (89.7%, computed from the
payoff structure), and used this to explain the post-round-1 convergence. That figure
only says that the EV pick has more expected zeros for most participants; it does not
say how much more, and the realized data show a small difference (40.3% vs. 36.2% of
delegated decisions, participant-clustered p = 0.18; expected 41.7% vs. 34.8%). The text
now reports this comparison, drops the 89.7% figure and the "EV loses it more"
inference, and replaces them with an explicitly exploratory decomposition (see our reply
to Reviewer 3, point 3). The expected-zero calculation relies on the ten states of each
lottery being equally likely, which is a feature of the task design; the Method section
now states this where the lotteries are first introduced.
