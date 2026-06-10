# AGENTS.md

## Project

Sound Mirror (CHUNKS project **10**) — static browser app measuring acoustic/phonetic similarity ("sound mirror") between two audio clips, cross-language, fully client-side.

## Read Before Anything Else

1. `CONTEXT.md` — canonical domain language (sound mirror, Method, Score, Verdict, Method Performance…)
2. `context/01-prd.md` — scope and acceptance criteria
3. `context/02-architecture.md` — detected stack + module map
4. `context/03-build-plan.md` — features F01–F06, evidence-based checklists
5. `context/04-operating-state.md` — Hermes board, progress, blockers
6. `context/05-decisions.md` — ADR index (full ADRs in `docs/adr/`)
7. `context/06-runbook.md` — local run, Vercel deploy, rollback
8. `context/07-ui-system.md` — Swiss minimal tokens/components, DOM-ID guardrail
9. `context/08-agent-routing.md` — agents, skills, prompts

## Rules That Never Change

- Do not code before reading the files above.
- Do not implement before stack and build plan are Accepted by Lucy (currently **Candidate** — see CAND-001/002).
- Do not invent domain terms; `CONTEXT.md` is canonical ("sound mirror", not "audio similarity").
- **Preserve all existing DOM IDs used by JavaScript** when touching `index.html`/UI.
- No agent/tooling frameworks inside `src/` — app logic only.
- Do not change architecture without recording it in `context/05-decisions.md`.
- Do not mark work done without Hermes update + `04-operating-state.md` + `progress-board.html`.
- Progress comes only from checked checklist items with evidence — never estimates.
- Progress board keeps the locked Swiss Project OS style; product UI rules live in `07-ui-system.md`.
- Do not delete files without Lucy's confirmation + hygiene-audit evidence.
- LLM API keys live only in browser localStorage — never in the repo.
- `@xenova/transformers` / Web Audio APIs: check current docs before coding.
- If the same problem persists after one corrective prompt — stop and run `/recover`.

## Available Skills

`/kanban-orchestrator` (numbered registry; this is project 10) · `/architect` · `/imprint` · `/review` · `/recover` · `/remember` · `/system-diagram`

## Source of Truth Map

| Fact | Canonical source |
| --- | --- |
| Domain language | `CONTEXT.md` |
| Scope | `context/01-prd.md` |
| Architecture/stack | `context/02-architecture.md` + `context/05-decisions.md` |
| Build order/progress | `context/03-build-plan.md` |
| Task state | Hermes Kanban board `sound-mirror` (pending creation — see operating state) |
| Operating snapshot | `context/04-operating-state.md` |
| UI system | `context/07-ui-system.md` (supersedes root `DESIGN.md`) |
| Routing | `context/08-agent-routing.md` |
| Dashboard | `context/progress-board.html` (mirror, not canonical) |

## File Placement Rules

| Type | Location |
| --- | --- |
| App logic | `src/` (ES modules only) |
| App shell/UI | `index.html`, `style.css` root |
| Tests | `tests/` (vitest) |
| Project OS docs | `context/` · audits in `context/audits/` |
| ADRs | `docs/adr/` + index in `context/05-decisions.md` |
| Automation | `scripts/` |

Before creating a file: which source of truth owns it, which canonical folder, does an existing file cover it, which registry must be updated.

## Change Protocol / Done Gate / Release Gate

Follow `context/08-agent-routing.md` prompts and:

1. Identify callers/data deps/user flows → 2. check tests/behavior → 3. update domain/PRD/decisions if changed → 4. update acceptance + verification → 5. UI change ⇒ `07-ui-system.md` → 6. progress change ⇒ Hermes + `04` + board → 7. verify with `npm test` or manual evidence.

Done = work + evidence + Hermes comment + `04` + board (+ decisions/runbook/UI/routing if touched).
Release = commit + tag + Vercel preview validated + rollback path checked (see `context/06-runbook.md`).

## Progress Board

```bash
python -m http.server 8765
# open http://localhost:8765/context/progress-board.html
```

Update checklist evidence in context files first, recalc, then edit the `BOARD` object. Never hand-edit percentages.

## Goal

A trusted, maintainable Sound Mirror that Lucy and agents can extend — one source of truth, evidence-based progress, no invisible work.
