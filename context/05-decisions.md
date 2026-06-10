# 05 — Decisions — Sound Mirror

ADRs also live in `docs/adr/`; this file is the index. New decisions go here (full ADR text optional in `docs/adr/`).

## Accepted Decisions

| ID | Date | Decision | Reason | Source |
| --- | --- | --- | --- | --- |
| ADR-0001 | 2026-06-06 | Sound mirror (cross-language phonetic shape) is the comparison goal, not speaker identity or semantics | explicit requirement: "I'll go there" ≈ "úm um ùm"; rejected speaker-ID and semantic options | `docs/adr/0001-sound-mirror-over-speaker-identity.md` |
| ADR-0002 | 2026-06-06 | wav2vec/HuBERT via ONNX in browser (`@xenova/transformers`), accept ~90MB lazy download | best phonetic embeddings while staying fully static; lazy init, not defaultOn | `docs/adr/0002-wav2vec-onnx-in-browser.md` |
| ADR-0004 | 2026-06-10 | Stack accepted: vanilla static ES modules, no build step, vitest, Vercel (was CAND-001) | Lucy confirmed 2026-06-10 | project-init gate |
| ADR-0005 | 2026-06-10 | Build plan accepted: verify F01–F04 → cleanup F05 → release F06 (was CAND-002) | Lucy confirmed 2026-06-10 | project-init gate |
| ADR-0006 | 2026-06-10 | Cleanup applied: removed `src/.pi/gsd`, server logs, `DESIGN.md`; added `.gitattributes`, normalized line endings (was CAND-003) | Lucy approved all 4 candidates | commit `b1edbcc` |
| ADR-0003 | 2026-06-10 | Hermes Kanban (`sound-mirror` board) is canonical task state; this repo is project **10** in the CHUNKS registry | kanban-orchestrator convention | registry + project-init |

## Candidate Decisions (need Lucy's confirmation)

| ID | Candidate decision | Evidence | Risk |
| --- | --- | --- | --- |
| CAND-004 | Rename folder `CHUNKS-VEB-COMAPRE` → `CHUNKS-SOUND-MIRROR` | name says VEB (project 7) + typo "COMAPRE"; registry slug is sound-mirror | medium — breaks registry/board workdir paths, do before board seeding or update both |

## Deferred Decisions

| ID | Decision | Reopen trigger |
| --- | --- | --- |
| DEF-001 | Ensemble/weighted score across Methods using Method Performance | after ≥20 labeled History Entries |
| DEF-002 | Sharing preset Analysis Pairs with CHUNKS learners | after v1 production release |

## Update Rule

Architecture, scope, data model, UI direction, deploy/rollback, or agent workflow changes must be recorded here before a task is marked done.
