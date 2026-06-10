# 03 — Build Plan — Sound Mirror

## Status

- Build plan status: **Accepted** (Lucy, 2026-06-10 — ADR-005)
- Last updated: 2026-06-10
- Human acceptance required before further implementation: no — accepted

## Reality Note (adopt mode)

Most of the original plan is already implemented (commits `00797c8`…`7f9325d`, 2026-06-06/07). Remaining work is verification, hygiene cleanup, and release. Checklists below are checked only where evidence exists.

## Phases

| Phase | Goal | Status |
| --- | --- | --- |
| 0 — Project OS | context, gates, board | doing (this init) |
| 1 — DSP methods + playback | MFCC-39, LPC, VUV, sflux, playback | implemented — verification pending |
| 2 — Verdict workflow | verdict strip, History, Method Performance | implemented — verification pending |
| 3 — wav2vec ONNX | lazy cross-language embedding method | implemented — verification pending |
| 4 — Hygiene + Hardening | cleanup candidates, .gitattributes, tests green | todo |
| 5 — Ship + Ops | Vercel preview → prod, tag, rollback | todo |

## Features / Work Items

| ID | Feature | Checklist | Status |
| --- | --- | --- | --- |
| F01 | DSP method expansion + playback (Phase 1) | 2/4 | pending verification |
| F02 | Verdict workflow + Method Performance (Phase 2) | 2/4 | pending verification |
| F03 | wav2vec via ONNX (Phase 3) | 2/4 | pending verification |
| F04 | UI restyle — Stitch Swiss minimal | 2/4 | pending verification |
| F05 | Repo hygiene cleanup (approved candidates only) | 3/4 | applied — npm test evidence pending |
| F06 | Release to Vercel production | 0/5 | unblocked by ADR-005; needs F01–F05 verified |

## Feature Checklists

### F01 — DSP method expansion + playback — 2/4

- [x] Implemented (commits `00797c8`, `2acbc9a`, `537a600`, `a54a639`, `c7a839d`)
- [x] Unit tests exist (`tests/dsp.deltas.test.js`)
- [ ] `npm test` green — evidence needed on Windows (sandbox cannot run rollup native)
- [ ] Manual run: all methods produce Scores on a real Analysis Pair

### F02 — Verdict workflow + Method Performance — 2/4

- [x] Implemented (commits `52cd3fa`, `e0e9465`, `200969a`, `022a6bd`, `732dbc2`)
- [x] Unit tests exist (`tests/methodEvaluator.test.js`, tie-handling fixed)
- [ ] `npm test` green — evidence needed
- [ ] Manual run: ≥5 verdicts → panel shows Spearman ranking

### F03 — wav2vec via ONNX — 2/4

- [x] Implemented (commit `fbf7d1c`, `src/wav2vecMethod.js`, ADR-0002)
- [x] Lazy-load + not defaultOn per ADR-0002
- [ ] Manual run: model downloads, caches, scores a cross-language pair
- [ ] Load time acceptable on Lucy's machine (R&D)

### F04 — UI restyle Swiss minimal — 2/4

- [x] Implemented (`style.css` 2026-06-06, DESIGN.md direction, guide updated `7f9325d`)
- [x] Tokens captured in `context/07-ui-system.md`
- [ ] Visual review/screenshots of analyzer, history, guide, LLM settings
- [ ] DOM IDs preserved (guardrail) — spot-check after any UI change

### F05 — Repo hygiene cleanup — 3/4

- [x] Lucy confirmed 4 candidates 2026-06-10 (rename CAND-004 still open)
- [x] Applied: removed src/.pi/gsd + server logs + DESIGN.md, added .gitattributes, renormalized (commit `b1edbcc`); app serves HTTP 200 after cleanup
- [ ] `npm test` green after cleanup — run on Windows (sandbox cannot run rollup native binding)
- [x] Hygiene audit updated

### F06 — Release to Vercel production — 0/5

- [ ] Working tree clean, line-ending churn resolved, commit + tag
- [ ] Preview deploy validated (analyzer, guide, LLM settings, model test, JSON AI analysis)
- [ ] Promote to production
- [ ] Rollback path tested/documented (previous deployment or git tag)
- [ ] Runbook + operating state updated with evidence

## Verification Commands

```bash
npm test                                  # vitest (run on Windows)
python -m http.server 8000 --bind 127.0.0.1   # local smoke test
```

## Hermes Tasks To Seed

See `scripts/seed-sound-mirror-board.ps1`. One task per feature F01–F06 + gate task "Confirm stack + build plan" + 2 R&D tasks.

## Progress Calculation Rule

`overall = checked / total checklist items` across F01–F06 (evidence required). Current: 11/25 = 44%.

## Build Plan Gate Checklist

- [x] Architecture Accepted (2026-06-10)
- [x] Build plan Accepted (2026-06-10)
- [x] First shippable slice defined (F06 = shippable; F01–F04 prove the product locally)
- [x] Tasks have acceptance criteria
- [x] Verification commands known
- [ ] Hermes Kanban seeded (pending board sync script)
- [x] Release controls included (F06, runbook)
