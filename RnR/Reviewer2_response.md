# Response to Reviewer 2

Edits referenced below are in `AIms2_CHBR_R1_Reviewer2.tex` (a working copy branched
from `AIms2_CHBR_R1.tex`; marked with `\inew{...}`). The original `AIms2_CHBR_R1.tex`
is left untouched pending your review of these proposed changes.

## 1. Choice-authority salience is inferred, not manipulated or measured pre-decision

This is a fair methodological point, and we did not want to paper over it. We expanded
the "Limitations" subsection to state explicitly that choice-authority salience was
neither experimentally manipulated nor measured before participants' first delegation
decision. Our case for the authority-based account rests on post-task expectation and
reason measures together with the behavioral pattern they accompany (lower delegation
despite higher expected accuracy) — consistent with, but not on its own establishing,
loss of choice authority as the operative mechanism. We now frame this throughout as the
best-supported interpretation among those we can test, not a causally identified
mechanism, and softened one overly strong sentence in "Theoretical implications"
accordingly ("isolates" → "is most consistent with").

## 2. EV and preference-based conditions differ on several dimensions — which is most plausible?

We added a new limitations paragraph that lays out the confound explicitly (perceived
objectivity, profiling, criterion, possibly expected performance) and then triangulates
using evidence already in the paper:
- **Expected-performance account ruled out**: participants in the preference-based
  condition expected the algorithm to match their preferences *better*, not worse, than
  the EV rule — so lower delegation runs against, not with, differential performance
  expectations.
- **Profiling-aversion account unlikely to dominate**: the profiling-related closed-item
  reason ("I don't like to be analysed by an algorithm") was selected far less often
  than responsibility- and authority-related items.
- **What remains**: perceived objectivity and the preference-based rule's explicit
  reference to the user's own prior judgment — precisely the dimension our
  choice-authority account targets. We note that these two cannot be fully separated
  with the present design and propose a concrete future manipulation (an objective rule
  that nonetheless explicitly uses the user's own data) to isolate them.

## 3. Effect sizes, CIs, preregistered-vs-exploratory labeling, and robustness checks

We computed exact effect sizes and confidence intervals from the raw session data for
all three primary/secondary results and added them to the text:
- **Round-1 delegation**: risk difference 11.1 pp (Wald 95% CI [−1.3, 23.7]); OR = 1.60
  (Fisher's exact two-sided 95% CI [0.91, 2.84]). We note explicitly that a two-sided CI
  spanning zero is not in tension with the significant one-sided preregistered test —
  different coverage conventions.
- **Average delegation (WMW)**: rank-biserial r ≈ 0.05 (bootstrap 95% CI [−0.09, 0.21]),
  i.e., a small effect whose CI comfortably spans zero, consistent with the null result.
- **Categorical non-delegation**: risk difference 12.3 pp (Wald 95% CI [4.9, 19.7]);
  OR = 5.25 (Fisher's exact 95% CI [1.65, 22.07]).

We also added an explicit flag distinguishing the preregistered win-stay/lose-shift base
model from the exploratory decomposition that splits by who produced the prior outcome
(delegated vs. self-chosen), which was not specified in advance.

As a **robustness check for repeated binary outcomes**, we re-estimated the preregistered
LPM as a logistic regression with the same fixed effects and cluster-robust standard
errors. The pattern is unchanged: the treatment coefficient and both interactions remain
small and insignificant, while the zero-outcome history effect remains large, negative,
and highly significant (OR = 0.19, p < 0.001). We added this to the text, confirming the
LPM conclusions are not an artifact of the linear functional form.

## 4. Figure 2 convergence pattern: the causal interpretation is currently only descriptive

Yes, there is something we could do about it, and we did it: we exploited realized-outcome
variation *within* treatment, which is not confounded by the between-treatment difference
in decision rule. Conditional on having delegated in round 1, whether the realized payoff
happened to be zero or positive is plausibly as-good-as-random (it depends on which
lottery state was drawn). Within the EV condition, round-1 delegators who received a zero
payoff delegated again in round 2 only 36.0% of the time, vs. 64.8% among those who
received a positive payoff (Fisher's exact p = 0.027, OR = 0.31, 95% CI [0.10, 0.91]). The
same contrast in the preference-based condition points the same way but is weaker and only
marginally significant (50.0% vs. 72.5%, p = 0.099), consistent with fewer round-1
preference-based delegators having experienced a zero outcome to begin with. We added this
as new evidence, explicitly describing it as a within-treatment comparison that is
considerably more direct than the pooled regression, while stopping short of calling it
fully causal (realized payoffs are a property of the random lottery draw, not an
experimenter-assigned manipulation).

## 5. "No" — interpretation/conclusions not supported by the data (no further comment)

We take this as referring to the concerns raised in points 1–4 above, which we have
addressed with (a) explicit, honest limitations language on what the mechanism evidence
can and cannot establish, (b) a transparent account of the confounded dimensions and
which can be ruled out, (c) effect sizes/CIs throughout, and (d) new within-treatment
evidence that makes the feedback-driven interpretation of the convergence pattern
considerably less purely descriptive. We hope these changes address the concern; happy
to iterate further if specific remaining points can be identified.

## 6. Strengths of the study

Thank you very much for this positive assessment.

## 7. Limitations should be expanded

Done — see points 2 and 4 above. We also added one clarification you may find useful:
the "subsequent feedback is partly treatment-generated" concern (point 2/7) applies to
the feedback-driven convergence pattern in average delegation, but **not** to our two
central results. The first-contact difference is measured before any outcome feedback
exists, and categorical non-delegation describes participants who, by definition, never
received algorithm-generated feedback at all — so neither of our primary findings
depends on comparing treatment-generated feedback content across conditions.

## 8. Manuscript could be shortened (Related Work, Discussion)

We agree and made a first conservative pass: trimmed a redundant duplicate citation and
overlapping sentence in "Heterogeneity and contextual moderators," tightened the
"Financial advice and robo-advisors" paragraph (merged redundant sentences), and
softened/tightened one sentence in "Theoretical implications." These are deliberately
conservative cuts preserving all substantive content and citations; a deeper shortening
pass (e.g., merging some Related Work subsections, trimming the four-part "Theoretical
implications" list to three points) is possible but involves more subjective judgment
calls about what to cut, so we left that decision to you rather than cutting
unilaterally. Happy to do a second, more aggressive pass if you point to specific
sections/paragraphs you'd like condensed or merged.

## 9. Language editing

Reviewer indicated "No" — no action needed.
