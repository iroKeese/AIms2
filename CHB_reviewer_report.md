# CHB Reviewer Report: Pre-submission Improvements

## Prioritized Findings

1. High: Temporal and citation-consistency risk.  
The manuscript date says January 2025, but the text cites multiple 2026 works. Reviewers will treat this as a credibility issue unless clarified as working-paper versions or updated manuscript date.  
Reference: [AIms2.tex](AIms2.tex#L55), [AIms2.tex](AIms2.tex#L145), [AIms2.tex](AIms2.tex#L146), [AIms2.tex](AIms2.tex#L148)

2. High: Primary inference is vulnerable because it relies on one-sided testing and a borderline first-contact result.  
Even with preregistration, CHB reviewers often expect two-sided robustness and interval estimates. Add two-sided sensitivity tests for the same endpoints and report confidence intervals for treatment differences.  
Reference: [AIms2.tex](AIms2.tex#L90), [AIms2.tex](AIms2.tex#L178), [AIms2.tex](AIms2.tex#L193)

3. High: Preregistration is referenced but not fully auditable in the manuscript.  
Include the AsPredicted URL/ID in the main text (and appendix if needed), plus a compact “registered vs exploratory” map.  
Reference: [AIms2.tex](AIms2.tex#L177)

4. High: Missing ethics/IRB reporting details for CHB standards.  
You describe consent and online recruitment, but there is no explicit ethics approval/exemption statement. Add committee name, protocol ID, and consent confirmation language.  
Reference: [AIms2.tex](AIms2.tex#L171)

5. Medium-High: Attrition and exclusion reporting is not transparent enough.  
You provide initial and final N, but not counts per exclusion criterion. Add a flow table/figure with stepwise exclusions and final cell sizes.  
Reference: [AIms2.tex](AIms2.tex#L159)

6. Medium-High: Effect sizes and uncertainty are underreported relative to p-values.  
For primary outcomes, report absolute percentage-point differences, confidence intervals, and preferably odds/risk ratios where interpretable.  
Reference: [AIms2.tex](AIms2.tex#L193), [AIms2.tex](AIms2.tex#L197), [AIms2.tex](AIms2.tex#L199), [AIms2.tex](AIms2.tex#L204)

7. Medium: Exploratory analyses need stronger labeling and multiplicity caution.  
Non-delegator and dynamic switching analyses are useful, but should be marked clearly as supplementary/exploratory and interpreted with multiplicity caution.  
Reference: [AIms2.tex](AIms2.tex#L182), [AIms2.tex](AIms2.tex#L204), [AIms2.tex](AIms2.tex#L209)

8. Medium: Mechanism language still slightly overreaches measured constructs.  
You infer agency/responsibility and self-referential discomfort, but those constructs were not directly measured in the main tests. Keep mechanism framing explicitly as interpretation and tighten causal language.  
Reference: [AIms2.tex](AIms2.tex#L62), [AIms2.tex](AIms2.tex#L254), [AIms2.tex](AIms2.tex#L262)

9. Medium: Results section now has figures but no compact primary-results table.  
Add one concise table with all preregistered tests, estimates, SE/CI, p-values, and sample sizes. This materially improves reviewer readability.  
Reference: [AIms2.tex](AIms2.tex#L184), [AIms2.tex](AIms2.tex#L213)

10. Medium: Data and code availability statement is missing.  
CHB reviewers increasingly expect reproducibility statements. Add data/code/materials availability, repository link, and what is restricted (if any).  
Reference: [AIms2.tex](AIms2.tex#L155), [AIms2.tex](AIms2.tex#L274)

11. Low-Medium: Keywords and JEL are improved, but journal-facing indexing can be sharpened.  
Consider adding “algorithm aversion” and “human-AI delegation” explicitly in keywords for discoverability.  
Reference: [AIms2.tex](AIms2.tex#L65)

12. Low: Versioning and structure signals.  
Given major revisions, update the version date and consider a short contributions paragraph at the end of Discussion to highlight novelty in one place.  
Reference: [AIms2.tex](AIms2.tex#L55), [AIms2.tex](AIms2.tex#L248)

## Open Questions Before Submission

1. Will you keep one-sided tests as primary and add two-sided robustness, or switch to two-sided in main text with preregistered one-sided in appendix?
2. Can you provide per-criterion exclusion counts from your pipeline for a transparent attrition table?
3. Do you have an ethics approval or exemption ID you can cite explicitly?
4. Are you comfortable adding a public repository link now, or do you prefer blinded OSF during review?

## Overall Judgment

The paper is now close to a credible submission draft, with a clear contribution and a much stronger narrative than before. The main blockers are transparency/compliance items (preregistration auditability, ethics, attrition, reproducibility) and statistical reporting completeness (effect sizes, intervals, two-sided robustness). Addressing these would materially improve acceptance odds.
