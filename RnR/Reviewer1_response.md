# Response to Reviewer 1 — Statistical power / sample-size justification

(Covers the point: *"Absence of a stated power analysis / justification for the
preregistered sample size (120/cell)... was the design powered to detect the ~20-point
gap seen in the unregistered pilot study?"* The rest of Reviewer 1's extensive report
has not yet been worked through — this file currently covers only the power question,
per request. The underlying paragraph is applied to both `AIms2_CHBR_R1.tex` and
`AIms2_CHBR_R1_Reviewer2.tex` — see "Added to the manuscript" below.)

## The honest answer: no pre-specified power analysis was run

The preregistration (question 7, "How many observations will be collected...") states
only: *"We will collect 120 participants per treatment. If our exclusions lead to less
than 100 observations in a given treatment, we will collect additional participants
until the threshold of 100 observations per treatment is met."* No effect-size
assumption or power target is given. We did not want to paper over this, so we ran a
retrospective power analysis using the pilot data (`RnR/oldData/`) and added it as a new
limitations paragraph.

## What the pilot actually showed

Reconstructed directly from `data_complete_iw.csv` (N = 377, `returned == 1`, EV =
treatments 1–2, preference-based/RDU = treatments 3–4, pooling across the pilot's
additional feedback-timing factor that the present study no longer has):

| Measure | EV | Pref (RDU) | Gap |
|---|---|---|---|
| First contact (`decision1st`) | 67.4% (n=187) | 45.8% (n=190) | **21.6 pp** |
| Average delegation (all 8 decisions) | 54.5% | 35.3% | **19.1 pp** |

This confirms the "about 20 percentage points" figure already cited in the Discussion
("These findings are consistent with an earlier study...").

## Power calculation at n = 100–120/arm (the realized design)

Using both an exact-test Monte Carlo simulation (Fisher's exact, one-sided — a
conservative lower bound on the preregistered Boschloo test, which uniformly dominates
Fisher) and the standard normal approximation (`power.prop.test`) as a cross-check:

**For the full pilot effect (~22 pp gap), one-sided α = .05:**

| n/arm | Power (exact sim) | Power (normal approx.) |
|---|---|---|
| 100 | 90.6% | 93.0% |
| 118 | 94.6% | 95.9% |
| 120 | 95.1% | 96.2% |

**For the effect size we actually observed in the present study (11.1 pp gap,
66.9% vs. 55.8%):**

| n/arm | Power (exact sim) | Power (normal approx.) |
|---|---|---|
| 100 | 39.8% | 45.8% |
| 118 | 46.2% | 51.2% |
| 120 | 48.5% | 51.7% |

**Minimum detectable effect at 80% power (one-sided α = .05):** approximately
**16.0–17.3 percentage points** across n = 100–120/arm — well above the 11.1 pp gap we
actually observed.

**For the average-delegation (Wilcoxon–Mann–Whitney) comparison**, using a t-test
power proxy with the pilot's within-condition SD (≈0.295 EV, ≈0.321 Pref, pooled
≈0.308): power for a persistent gap of about 10 percentage points — comparable in
magnitude to the first-contact effect we actually observed — was **71–77%** across
n = 100–120/arm, with an 80%-power MDE of about 9.9–10.9 pp.

## The punchline

Two separate points, kept deliberately distinct:

1. **First-contact test (Boschloo, p = .041):** the design had high power (≈91–96%)
   to re-detect an effect the size of the pilot's (~22 pp), but only moderate power
   (≈40–52%) for an effect the size we actually found (11.1 pp). The only-marginal
   significance of this confirmatory result is therefore well explained by the design
   being adequately, but not generously, powered for the effect that turned out to be
   true — no appeal to any prior expectation about effect-size shrinkage is needed
   here; we simply report what the realized effect implies about the power we had.
2. **Average-delegation test (WMW, p = .24):** we do **not** attribute this null to
   insufficient power. The regression evidence and the round-by-round pattern
   (Figure 1) show that the EV-vs-preference-based gap genuinely converges to
   approximately zero after round 1, driven by a decline specific to the EV condition,
   not by a small persistent gap we failed to detect. In fact, power to detect a
   persistent ~10 pp gap on this measure was a respectable 71–77% — so if a gap of
   that size had been there throughout Part 2, we would have had a decent chance of
   seeing it. That we didn't supports "genuine convergence to zero" over "underpowered
   test" as the correct reading of the null result.

## Added to the manuscript

We added this analysis as a new Limitations paragraph (in both `AIms2_CHBR_R1.tex` and
`AIms2_CHBR_R1_Reviewer2.tex`, now reconciled into one combined version), explicitly
naming the absence of a pre-specified power analysis, reporting the retrospective
calculation above for the realized effect sizes (not a hypothetical "halved" one), and
recommending that any direct replication pre-specify power targeting the first-contact
effect specifically.
