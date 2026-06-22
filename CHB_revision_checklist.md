# CHB Revision Checklist (Execution Plan)

Source report: [CHB_reviewer_report.md](CHB_reviewer_report.md)

## A. Quick Wins (No New Statistics Needed)

1. Update manuscript version/date for citation consistency  
- Priority: High  
- File: [AIms2.tex](AIms2.tex)  
- Action: Replace outdated version date with current draft date.

2. Add explicit preregistration citation block  
- Priority: High  
- File: [AIms2.tex](AIms2.tex)  
- Action: Add a short sentence in Method with AsPredicted link/ID and registration date.
- Dependency: You provide final URL/ID.

3. Add ethics/IRB statement  
- Priority: High  
- File: [AIms2.tex](AIms2.tex)  
- Action: Add committee name, approval/exemption number, informed-consent language.
- Dependency: You provide approval/exemption details.

4. Clearly label exploratory analyses  
- Priority: Medium  
- File: [AIms2.tex](AIms2.tex)  
- Action: Mark non-delegator and dynamic switching analyses as exploratory/supplementary, and add multiplicity caution sentence.

5. Tighten mechanism language  
- Priority: Medium  
- File: [AIms2.tex](AIms2.tex)  
- Action: Replace causal phrasing with interpretation framing where constructs are not directly measured.

6. Add data/code/materials availability statement  
- Priority: Medium  
- File: [AIms2.tex](AIms2.tex)  
- Action: Add reproducibility statement near end of paper.
- Dependency: Repository choice (public OSF/GitHub vs blinded link).

7. Improve keyword indexing for discoverability  
- Priority: Low-Medium  
- File: [AIms2.tex](AIms2.tex)  
- Action: Add terms like “algorithm aversion” and “human-AI delegation” to keywords.

8. Add concise contributions paragraph at end of Discussion  
- Priority: Low  
- File: [AIms2.tex](AIms2.tex)  
- Action: 3–4 sentence contribution summary tailored to CHB audience.

## B. Requires Additional Statistical Output (From AnalysisAIms2)

9. Add two-sided robustness for preregistered tests  
- Priority: High  
- Files: [AnalysisAIms2.rmd](AnalysisAIms2.rmd), [AIms2.tex](AIms2.tex)  
- Action: Report two-sided sensitivity results alongside preregistered one-sided tests.

10. Add effect sizes and uncertainty intervals  
- Priority: High  
- Files: [AnalysisAIms2.rmd](AnalysisAIms2.rmd), [AIms2.tex](AIms2.tex)  
- Action: Include percentage-point differences with 95% CIs for key contrasts.

11. Add transparent exclusion flow table  
- Priority: High  
- Files: [AnalysisAIms2.rmd](AnalysisAIms2.rmd), [AIms2.tex](AIms2.tex)  
- Action: Provide counts per exclusion rule and final sample by condition.

12. Add compact primary-results table  
- Priority: Medium  
- Files: [AIms2.tex](AIms2.tex)  
- Action: Table with endpoint, estimate, SE/CI, p-value, test type, N.
- Dependency: Items 9–10 finalized.

## C. Recommended Work Sequence

Phase 1 (Fast text-only edits): items 1, 4, 5, 7, 8  
Phase 2 (Needs your metadata): items 2, 3, 6  
Phase 3 (Recompute + integrate): items 9, 10, 11, 12

## D. Inputs Needed From You

1. AsPredicted registration URL/ID (exact string for manuscript).  
2. Ethics/IRB committee name and approval/exemption ID.  
3. Reproducibility preference: public repository now, blinded repository, or “available on request.”

## E. Definition of Done (Submission-Ready)

- Preregistration is fully auditable in-text.  
- Ethics and consent statement is complete.  
- Main inferences include effect sizes + uncertainty.  
- One-sided preregistered tests are paired with two-sided robustness.  
- Exclusion flow and primary-results table are present.  
- Mechanism claims are appropriately cautious.  
- Reproducibility statement is included.
