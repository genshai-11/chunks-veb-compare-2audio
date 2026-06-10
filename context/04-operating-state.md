# 04 — Operating State — Sound Mirror

## Snapshot

- Project: Sound Mirror (CHUNKS program, project **10**)
- Mode: adopt
- Current phase: 0 — Project OS (init) / product itself at Phase 4 (hygiene + hardening)
- Current focus: confirm Candidate decisions, sync Hermes board, verify F01–F04
- Updated: 2026-06-10
- Updated by: Claude (project-init)

## Source of Truth

- Canonical task state: Hermes Kanban (board `sound-mirror`, **pending creation**)
- Readable mirror: this file · Dashboard: `context/progress-board.html`
- Scope: `context/01-prd.md` · Domain: `CONTEXT.md` · Architecture: `context/02-architecture.md` · Plan: `context/03-build-plan.md`
- Registry: project 10 in `kanban-orchestrator/PROJECT-REGISTRY.md`

## Hermes Kanban

- Board slug: `sound-mirror` · Name: `10 — SOUND-MIRROR`
- Workspace: `C:\Users\gensh\OneDrive\Máy tính\LUCY\PROJECT-WORKPLACE\CHUNKS\CHUNKS-VEB-COMAPRE`
- Setup status: **blocked — pending board sync**
- Setup blocker: `hermes` CLI runs on Lucy's Windows machine, not in agent sandbox. Run `scripts/seed-sound-mirror-board.ps1` in PowerShell, then record task IDs here.

## Current Tasks (to mirror after board sync)

| ID | Title | State | Checklist | Notes |
| --- | --- | --- | --- | --- |
| TBD | Gate: confirm stack + build plan + cleanup candidates | todo | 0/1 | Lucy decision |
| TBD | F01 verify DSP methods (`npm test` + manual run) | pending | 2/4 | implemented, evidence needed |
| TBD | F02 verify verdict workflow | pending | 2/4 | implemented, evidence needed |
| TBD | F03 verify wav2vec (download/cache/score) | pending | 2/4 | implemented, evidence needed |
| TBD | F04 visual review Swiss UI | pending | 2/4 | implemented, evidence needed |
| TBD | F05 apply approved repo cleanup | blocked | 0/4 | needs confirmation |
| TBD | F06 release to Vercel production | blocked | 0/5 | needs accepted plan |
| TBD | R&D: wav2vec load time on real hardware | todo | — | |
| TBD | R&D: vitest in sandbox (rollup native) | todo | — | run `npm ci` in Linux or test on Windows only |

## Progress

10/25 checklist items checked = **40%** (evidence-based; see `context/03-build-plan.md`).

## Blockers

| Blocker | Impact | Needed action |
| --- | --- | --- |
| Hermes CLI unavailable in sandbox | board not created/seeded | Lucy runs `scripts/seed-sound-mirror-board.ps1` |
| Candidate decisions unconfirmed | implementation gated | Lucy confirms stack/plan/cleanup (see decisions file) |
| Registry mirror in lucy-echo-os not mounted | registry copies out of sync | mirror row 10 update to `SECOND-BRAIN/lucy-echo-os/_os/skills/kanban-orchestrator/PROJECT-REGISTRY.md` |

## Done Log

| Date | Task | Result |
| --- | --- | --- |
| 2026-06-10 | project-init (adopt) | Project OS created: AGENTS.md, context/01–08, hygiene audit, progress board, seed script; registry row 10 updated |

## Sync Rules

1. Hermes first → 2. this file → 3. check items only with evidence → 4. recalc progress → 5. update `progress-board.html` BOARD object → 6. decisions/runbook/UI/routing if touched.
