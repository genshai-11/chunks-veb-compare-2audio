# Seed Hermes Kanban for project 10 — SOUND-MIRROR
# Run in PowerShell on Lucy's machine (hermes CLI is not available in agent sandboxes).
# After running: paste created task IDs into context/04-operating-state.md (Current Tasks table).

$ws = "C:\Users\gensh\OneDrive\Máy tính\LUCY\PROJECT-WORKPLACE\CHUNKS\CHUNKS-VEB-COMAPRE"

# 1. Project board
hermes kanban boards create sound-mirror --name "10 — SOUND-MIRROR" `
  --description "Static browser app measuring cross-language acoustic similarity (sound mirror)" `
  --default-workdir $ws --switch

# 2. Anchor task on master board
hermes kanban --board lucy-personal create "Project 10 — SOUND-MIRROR" `
  --tenant projects `
  --body "number: 10`nslug: sound-mirror`nworkspace: $ws`nboard: sound-mirror"

# 3. Gate + decision tasks
hermes kanban --board sound-mirror create "Gate: confirm stack + build plan + cleanup candidates (CAND-001..004)" `
  --tenant context --workspace "dir:$ws" `
  --body "Purpose: Lucy accepts Candidate decisions in context/05-decisions.md`nContext: read AGENTS.md + context/ read order first`nAcceptance: decisions marked Accepted; build plan unblocked`nDone checklist: 05-decisions updated + operating-state + board"

# 4. Verification tasks (work implemented, evidence pending)
hermes kanban --board sound-mirror create "F01 — verify DSP methods (npm test + manual run)" `
  --tenant review --workspace "dir:$ws" `
  --body "Purpose: evidence for F01`nVerify: npm test; manual analyzer run, all methods score`nAcceptance: checklist in context/03-build-plan.md F01 4/4`nDone checklist: evidence + Kanban comment + operating-state + progress-board"

hermes kanban --board sound-mirror create "F02 — verify verdict workflow + Method Performance" `
  --tenant review --workspace "dir:$ws" `
  --body "Purpose: evidence for F02`nVerify: npm test; >=5 Verdicts -> Spearman panel`nAcceptance: F02 checklist 4/4`nDone checklist: evidence + Kanban + operating-state + board"

hermes kanban --board sound-mirror create "F03 — verify wav2vec ONNX (download/cache/score)" `
  --tenant review --workspace "dir:$ws" `
  --body "Purpose: evidence for F03 + R&D load time`nVerify: first-use download with loading state; cached reload; EN/VI pair scores`nAcceptance: F03 checklist 4/4`nDone checklist: evidence + Kanban + operating-state + board"

hermes kanban --board sound-mirror create "F04 — visual review Swiss UI (4 pages, DOM-ID guardrail)" `
  --tenant design --workspace "dir:$ws" `
  --body "Purpose: evidence for F04`nSkills: /imprint after review`nVerify: screenshots analyzer/history/guide/llm-settings vs context/07-ui-system.md`nAcceptance: F04 checklist 4/4`nDone checklist: evidence + Kanban + operating-state + board"

# 5. Blocked implementation tasks
hermes kanban --board sound-mirror create "F05 — apply approved repo cleanup" `
  --tenant tooling --workspace "dir:$ws" `
  --body "Purpose: execute ONLY approved candidates from context/audits/repository-hygiene-audit.md`nBlocked by: gate task`nVerify: npm test + app loads after cleanup`nDone checklist: audit updated + Kanban + operating-state + board"

hermes kanban --board sound-mirror create "F06 — release to Vercel production (preview-first, tag, rollback)" `
  --tenant release --workspace "dir:$ws" `
  --body "Purpose: first production release`nBlocked by: gate + F01..F05`nVerify: release flow in context/06-runbook.md (commit, tag, preview 5 checks, promote, rollback path)`nDone checklist: deploy evidence + runbook + Kanban + operating-state + board"

# 6. R&D tasks
hermes kanban --board sound-mirror create "R&D: wav2vec ~90MB load time on real hardware" `
  --tenant context --workspace "dir:$ws" `
  --body "Risk: first-load UX`nNeeded answer: seconds to interactive on Lucy's machine/network`nOutput: note in context/02-architecture.md R&D table"

hermes kanban --board sound-mirror create "R&D: vitest fails in Linux sandbox (rollup native binding)" `
  --tenant tooling --workspace "dir:$ws" `
  --body "Risk: agents cannot verify tests in sandbox`nNeeded answer: does npm ci in sandbox fix it, or Windows-only testing?`nOutput: note in 02-architecture.md + runbook Common Failures"

Write-Host ""
Write-Host "Done. Now: hermes kanban --board sound-mirror list  -> copy task IDs into context/04-operating-state.md"
