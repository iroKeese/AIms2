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

## Power calculation: an ex-ante reconstruction (pilot-based, not post-hoc)

We deliberately anchor this calculation only to information that was available
*before* the present study was run — the pilot's effect sizes — rather than to the
present study's own realized effect. Using a study's own observed effect size to
compute "retrospective power" is a well-documented statistical fallacy: because
observed power is a deterministic, monotonic function of the p-value, it adds no
information beyond the p-value itself, and using it to argue that a marginal result
"really" reflects low power (or that a null result "really" reflects an undetected
effect) is circular (Hoenig & Heisey, 2001, *The American Statistician*, "The Abuse of
Power"). So everything below uses only the pilot's numbers as the effect-size input;
the present study's own results are reported afterward, purely descriptively, without
computing a "power" figure from them.

Using both an exact-test Monte Carlo simulation (Fisher's exact, one-sided — a
conservative lower bound on the preregistered Boschloo test, which uniformly dominates
Fisher) and the standard normal approximation (`power.prop.test`) as a cross-check:

**Minimum detectable effect (MDE) at 80% power, one-sided α = .05, n = 100–120/arm**
(a pure design-stage quantity — depends only on n, α, and an assumed baseline rate/
variance, not on anything observed in this study):

| Measure | MDE (80% power) | Pilot's observed gap | Power to re-detect pilot's effect |
|---|---|---|---|
| First-contact (proportion) | ~16.0–17.3 pp | 21.6 pp | 91–95% (exact sim); 93–96% (normal approx.) |
| Average delegation (continuous) | ~9.9–10.9 pp | 19.1 pp | 99.7–99.9% |

Both MDEs sit comfortably below the pilot's observed gaps, so — reasoning only with
what was known before data collection — 100–120 participants per condition looked more
than adequately powered at the design stage.

## What we found, reported descriptively (not as "power")

The first-contact gap we actually observed in the present study was smaller than the
pilot's: **11.1 percentage points** (66.9% vs. 55.8%, p = .041 one-sided) — below the
design's 16.0–17.3 pp detection threshold. We note this as a plausible, natural
explanation for why the confirmed first-contact effect is only marginally significant,
without computing a "power for 11.1pp" figure, for the circularity reason given above.

For the average-delegation comparison (p = .24, null), we do **not** invoke power at
all, retrospective or otherwise. The design's ex-ante power for this measure was very
high (99.7–99.9% for an effect of the pilot's size), so a persistent gap of that
magnitude would very likely have been detected had one existed. Combined with the
regression evidence and the round-level pattern (Figure 1) showing that the
EV-vs-preference-based difference genuinely converges to approximately zero after
round 1 (driven by a decline specific to the EV condition), the null result is best
read as a substantive finding — a real convergence — rather than anything related to
power.

## The punchline

Two separate points, kept deliberately distinct:

1. **First-contact test (Boschloo, p = .041):** reasoning only from the pilot (the
   only information available ex ante), 100–120/arm looked more than adequately
   powered (MDE 16.0–17.3 pp vs. the pilot's 21.6 pp gap). The effect that actually
   materialized (11.1 pp) happened to fall below that threshold — a plausible,
   purely descriptive explanation for why the confirmed effect is only marginally
   significant. We do not compute a "power" number for the 11.1 pp effect itself,
   since that would be retrospective/observed power computed from our own result,
   a well-known fallacy (Hoenig & Heisey, 2001): it is a deterministic function of
   the p-value we already report and adds no independent information.
2. **Average-delegation test (WMW, p = .24):** here the ex-ante design was very
   strongly powered (99.7–99.9% for an effect of the pilot's size), so we do not
   invoke power at all to explain this null. Instead, the regression evidence and
   the round-by-round pattern (Figure 1) show that the EV-vs-preference-based gap
   genuinely converges to approximately zero after round 1, driven by a decline
   specific to the EV condition — a substantive, not statistical-power, explanation.

## Added to the manuscript

We added this analysis as a new Limitations paragraph (in both `AIms2_CHBR_R1.tex` and
`AIms2_CHBR_R1_Reviewer2.tex`, kept word-for-word identical in both), framed entirely
around what an ex-ante power analysis using the pilot's effect sizes would have shown,
reporting the present study's own results afterward purely descriptively (not as
computed "power"), and recommending that any direct replication pre-specify power
targeting the first-contact effect specifically.
