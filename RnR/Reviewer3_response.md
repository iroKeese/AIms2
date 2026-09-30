# Response to Reviewer 3

Edits referenced below are in `AIms2_CHBR_R1.tex` (marked with `\inew{...}`).

## 1. Virtual lottery task, not real investment decisions — does this affect the results?

We have expanded the "Limitations" subsection to clarify that the Part-2 choices were
**real and incentivized**, not hypothetical vignettes — one round was paid out for real
money, contingent on the participant's own choice or, if delegated, on the algorithm's
choice. We distinguish this from the task *domain*, which remains stylized: real
investment or medical decisions add ambiguous/delayed payoffs, product complexity, and
institutional framing (a named bank or physician) that could independently affect how
the loss of choice authority is experienced. We note explicitly that this abstraction is
what let us isolate the construal mechanism cleanly, while flagging generalization to
richer real-world domains as an open question, cross-referenced to "Future research."

## 2. Limited interaction time — can results generalize to long-term human–algorithm interaction?

We extended the "Limitations" subsection to acknowledge the within-session narrowing of
the treatment gap as suggestive of short-run adaptation, while explicitly refusing to
extrapolate to long-term use (months/years vs. minutes). We lay out two competing forces
that longer-run field exposure could trigger — (a) accumulating track record and
familiarity eroding authority-based resistance in favor of accuracy-based trust, vs.
(b) deepening profiling, higher stakes, and switching costs sustaining or amplifying the
choice-authority effect — and state plainly that our design cannot adjudicate between
them, calling for longitudinal field studies as the necessary next step. We also
corrected the round count to "eight incentivized rounds" for internal consistency.

## 3. Figure 2: does performance feedback override the authority effect after first contact?

We do not read the round-1-to-round-2 decline (concentrated in the EV condition) as
evidence that the authority effect is overridden by feedback. Our preferred reading,
now made explicit in the text: the authority effect on differential adoption persists
throughout (more participants remain willing in principle to cede authority under EV
than under personalization), but negative outcomes act as an independent, and initially
stronger, "negative attractor" on EV delegation specifically, because the EV rule
mechanically produces more zero-outcome rounds for most participants. The apparent
convergence is therefore the net result of two forces moving in the same direction on EV
delegation, not evidence that the authority-based mechanism itself weakens.

## 4. Never-delegator heterogeneity not fully validated — multiple non-significant indicators

Point taken. We are running into power issues here: there are only 22 never-delegators
in total (18 preference-based, 4 EV). We have added an explicit caveat in the text
noting that these subgroup comparisons are underpowered to detect anything but large
characteristic differences, so the absence of significant contrasts should not be read
as evidence that never-delegators are indistinguishable from delegators on these
dimensions. We deliberately did not report alternative tests with marginally different
p-values (e.g., a KS test on time-in-experiment) to avoid the appearance of test-shopping;
the honest characterization is "underpowered," not "null."

## 5. Section 3.5: which analyses are confirmatory vs. exploratory?

We have added an explicit sentence flagging that the base win-stay/lose-shift model
(rounds 2–8, prior win only) is the preregistered secondary analysis, while the further
decomposition distinguishing delegated from self-chosen prior outcomes (the
loss × prior-delegation interaction, estimated separately by treatment) is exploratory
and was not specified in advance.

## 6. "Figure?" broken reference on page 21

Good catch, thank you. This was a genuine bug: `\ref{fig:expected_bad_absurd}` had no
matching `\label` anywhere in the file (we had cut that figure at the last moment before
submission and overlooked the dangling pointer). We removed the dangling reference. The
underlying figure (`ExpectedBadAndAbsurdChoicesByTrmt.pdf`) still exists in the
repository if a reviewer would prefer we reinstate it as an actual figure instead of
describing the result in prose only — happy to do either.

## 7. Section 3.1: sample distribution per exclusion criterion (240 → 233)

We reconstructed the exact breakdown from the raw session data. Of the 7 excluded
participants: 1 failed the bot/slider check, 4 failed the careful-participation check
(`Reliable < 6`; one of these also disclosed AI usage), and 3 disclosed AI usage during
the study (one overlapping with the careful-participation failure). No participant was
excluded solely for a comprehension-check failure, for incomplete data, or under the
log-completion-time rule. This breakdown has been added to the Method section.

## 8. Suggested references

We checked both suggested papers directly.
- Kou et al. (2026, *Financial Innovation*, "Human–AI hybrid finance: from AI tools to
  decision systems") is genuinely relevant — it frames human–AI interaction in finance
  around decision architecture and the allocation of authority, which connects naturally
  to our choice-authority account. We added it as a citation in "Synthesis and
  contribution" and in the implications discussion.
- Yüksel et al. (2025, fuzzy decision-making for carbon-capture investment financing) is
  not relevant to our topic (no connection to delegation, algorithms, or choice
  authority). We did not cite it, consistent with the Associate Editor's note that
  suggested references need not all be incorporated.

## 9. Could the manuscript benefit from language editing?

Yes. Beyond the AI-assisted language support already disclosed in the "Declaration of
generative AI" subsection, we will run an additional proofreading pass before
resubmission (e.g., a native-speaker read-through) to catch any remaining issues.
