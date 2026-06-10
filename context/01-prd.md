# 01 — PRD — Sound Mirror

## Status

- Mode: adopt
- PRD status: Candidate — reconstructed from README, ADRs, CONTEXT.md, git history; pending Lucy confirmation
- Last updated: 2026-06-10
- Owner: Lucy

## Product One-liner

Sound Mirror helps a language learner/voice trainer (Lucy) measure how acoustically similar two audio clips are — regardless of language, speaker, or meaning — by running signal-based and neural phonetic analysis fully in the browser.

## Target Users

| User/Actor | Need | Current pain | Success signal |
| --- | --- | --- | --- |
| Lucy (primary, CHUNKS program) | Verify whether a Vietnamese chunk "mirrors" an English phrase acoustically | Ear-only judgment, no objective measure, no record | Scores that correlate with her ear (Method Performance ≥ usable) |
| Future CHUNKS learners | Same comparison without installing anything | Tooling requires backends/CLIs | Static URL works on any modern browser |

## Problem

Cross-language phonetic matching ("I'll go there" ≈ "úm um ùm") has no accessible tool: speech-to-text destroys the signal, speaker-ID measures the wrong thing. Sound Mirror compares the acoustic *shape* of sounds directly.

## Goals

- Compare an Analysis Pair (A/B) with multiple Methods, each producing a Score 0–100.
- Let the user label results (Verdict, 4-point) and learn which Method matches her ear (Method Performance, Spearman).
- Stay 100% static/browser-local: no backend, audio never leaves the machine.
- Optional LLM explanation of results via user-configured 9Router/OpenAI-compatible endpoint.

## Non-goals

- Speaker identification / voice biometrics (ADR-0001).
- Semantic/meaning similarity, speech-to-text.
- Accounts, server-side storage, mobile-native apps.

## V1 Scope

### Must have (largely implemented — see build plan)

- Upload/record Audio A/B, playback, preprocessing (normalize, trim silence)
- Methods: MFCC-39+DTW, formants, Mel spectrogram, pitch contour, raw cross-correlation, LPC, VUV rhythm, spectral flux, wav2vec (ONNX, lazy)
- History (IndexedDB) with Verdict + Method Labels; Method Performance panel (≥5 verdicts)
- JSON export; LLM Settings page; guide page

### Should have

- Verified Vercel production deployment with release controls

### Later

- Method weighting/ensemble score informed by Method Performance
- Sharing/preset analysis pairs for CHUNKS learners

## Acceptance Criteria

- [ ] An Analysis Pair runs through all enabled Methods and renders Scores without console errors
- [ ] wav2vec downloads lazily, shows loading state, caches across reloads
- [ ] Verdict strip saves to History; Method Performance panel appears at ≥5 verdicts and ranks methods by Spearman correlation
- [ ] `npm test` (vitest) passes
- [ ] App works served as plain static files (`python -m http.server`) and on Vercel preview

## Shippable Definition

- [ ] All acceptance criteria above verified with evidence
- [ ] Production Vercel deploy validated via preview-first flow with tag + rollback path (see runbook)

## Constraints

- Platform: static browser app, vanilla ES modules, no build step
- Data: all audio/history local (IndexedDB); LLM API key in localStorage only
- AI: wav2vec via `@xenova/transformers` CDN (~90MB model, cached); optional LLM endpoint user-supplied
- Budget/deadline: personal project, no hard deadline
- Deployment: Vercel static (`vercel.json` present)

## Open Questions

| Question | Why it matters | Status |
| --- | --- | --- |
| Is v1 "shippable" = production Vercel URL, or is local use enough? | defines release gate | Open |
| Rename folder `CHUNKS-VEB-COMAPRE` → sound-mirror? | registry/board path stability | Open |

## PRD Gate Checklist

- [x] Target user is clear
- [x] Painful job is clear
- [x] V1 scope is clear
- [x] Non-goals are clear
- [ ] Shippable definition confirmed by Lucy
- [x] Domain terms are reflected in `CONTEXT.md`
