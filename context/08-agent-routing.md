# 08 — Agent Routing — Sound Mirror

## Status

- Routing status: Ready
- Last updated: 2026-06-10

## Agent Architecture

Pattern: **Producer-Reviewer** (single-builder project; one agent implements, verification gate reviews). Escalate to Supervisor only if parallel work appears.

## Agent Registry

No project-specific `.claude/agents/` yet (none needed at this scale; dedup rule: check here before creating any).

| Agent | Role | Reads first | Outputs |
| --- | --- | --- | --- |
| builder (default Claude session) | implement accepted Hermes tasks | AGENTS.md, CONTEXT.md, task, relevant context files | code + evidence + Kanban comment |
| reviewer | verify acceptance criteria, DOM-ID guardrail, domain language | task diff, 01-prd, 07-ui-system | review result |

## Skill Routing

| Task type | Use | Notes |
| --- | --- | --- |
| Numbered project refs ("project 10") | `/kanban-orchestrator` | resolve via PROJECT-REGISTRY.md |
| Complex feature design | `/architect` | before touching `src/main.js` (1081 ln) or method pipeline |
| New UI | read `context/07-ui-system.md` first, then `/imprint` after | preserve DOM IDs |
| Drift/health check | `/review` | before release |
| Repeated failure | `/recover` | after one failed correction |
| Multi-session feature | `/remember save|restore` | |
| Architecture change | `/system-diagram` | sync mermaid in 02 + board System Map |
| DSP/audio APIs, @xenova/transformers | fetch current docs | API moves fast; don't trust memory |

## Inherited Legacy Tooling

- `src/.pi/gsd/**` — foreign GSD framework, **not wired into this Project OS**; do not invoke; pending cleanup decision (CAND-003).
- `docs/superpowers/plans/` — historical plan; canonical plan is `context/03-build-plan.md`.

## Prompt Snippets

### Start a Hermes task

```txt
Read AGENTS.md, CONTEXT.md, and relevant context/ files. State the Hermes task ID, acceptance criteria, files likely touched, and verification plan before editing. Preserve DOM IDs. Follow Change Protocol and Done Gate.
```

### Verify a feature (F01–F04 pattern)

```txt
Run npm test (Windows) and a manual analyzer run for the target feature. Record command output / screenshots as evidence, check the matching items in context/03-build-plan.md, recalculate progress, update Hermes + 04-operating-state + progress-board BOARD object.
```

## Error / Block Protocol

Stop risky work → block Hermes task with exact reason → update `04-operating-state.md` → Candidate/Deferred entry in `05-decisions.md` if a decision is needed → ask Lucy only for direction-changing calls.

## Routing Update Rule

New agent/skill/prompt/handoff ⇒ update this file before marking the task done.
