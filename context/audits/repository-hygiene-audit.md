# Repository Hygiene Audit — Sound Mirror (project 10)

Mode: adopt
Date: 2026-06-10

## Summary

- Repository root: `C:\Users\gensh\OneDrive\Máy tính\LUCY\PROJECT-WORKPLACE\CHUNKS\CHUNKS-VEB-COMAPRE`
- Hygiene status: Draft — pending Lucy review
- Main risks: foreign agent framework inside `src/`, line-ending churn in working tree, root folder name mismatch
- Cleanup implementation status: not started

## Canonical Folder Map

| Folder/file | Purpose | Classification |
| --- | --- | --- |
| `index.html`, `style.css`, `logo.png` | static app shell + UI | canonical |
| `src/*.js` (10 files) | analysis logic (dsp, dtw, methods, ui, main, …) | canonical |
| `tests/` | vitest unit tests | canonical |
| `docs/adr/` | ADRs 0001–0002 | canonical (mirrored in `context/05-decisions.md`) |
| `docs/superpowers/plans/2026-06-06-sound-mirror-methods.md` | original implementation plan | legacy — superseded by `context/03-build-plan.md`, keep as reference |
| `CONTEXT.md` | domain language | canonical |
| `README.md`, `package.json`, `vercel.json`, `.gitignore`, `.claude/` | toolchain/config | canonical |
| `DESIGN.md` | UI direction notes | merge candidate → `context/07-ui-system.md` |
| `node_modules/`, `package-lock.json` | npm | generated (lock committed: yes, correct) |

## Findings / Candidates

| Path | Classification | Evidence | Recommendation | Needs confirmation? |
| --- | --- | --- | --- | --- |
| `src/.pi/gsd/**` (agents, hooks, prompts, workflows) | orphan/misplaced | GSD agent framework, not app code; nothing in `index.html`/`src/*.js` imports it | move to repo root `.pi/` or delete if GSD unused | **yes** |
| `server.log`, `server.err.log`, `server.pid` | temp/debug | dev-server artifacts, already gitignored but on disk | delete after confirmation | **yes** |
| `DESIGN.md` | duplicate | content now lives in `context/07-ui-system.md` | merge then delete | **yes** |
| `docs/superpowers/plans/…` | legacy | plan items implemented per git log (commits 00797c8…7f9325d) | keep as historical reference, do not extend | no |
| Working tree: 8 files modified, 3698+/3698− | line-ending churn | `git diff` shows whole-file CRLF↔LF rewrites, no content change | add `.gitattributes` (`* text=auto eol=lf`), renormalize, commit | **yes** |
| Folder name `CHUNKS-VEB-COMAPRE` | unclear | registry slug is `sound-mirror`; "VEB" is project 7, "COMAPRE" is a typo | optional rename to `CHUNKS-SOUND-MIRROR` (breaks paths in registry/board if done later — decide now) | **yes** |

## Root File Policy

Allowed: `AGENTS.md`, `CONTEXT.md`, `README.md`, `index.html`, `style.css`, `logo.png`, `package.json`, `package-lock.json`, `vercel.json`, `.gitignore`, `.gitattributes`.
Discouraged: scratch logs, ad-hoc notes, one-off scripts → use `scripts/` or `context/`.

## File Placement Rules added to AGENTS.md

- App logic only in `src/`; no agent/tooling frameworks inside `src/`.
- Project OS docs in `context/`; ADRs may stay in `docs/adr/` but every decision must be indexed in `context/05-decisions.md`.
- Repeatable automation in `scripts/`.

## Hermes Cleanup Tasks To Seed

| Task title | Destructive? |
| --- | --- |
| Decision: confirm cleanup candidates (src/.pi, server logs, DESIGN.md, .gitattributes, folder rename) | no |
| Apply approved cleanup; verify `npm test` + app loads | yes |

## Safety Checklist

- [x] No files deleted during project-init
- [x] Delete candidates include evidence
- [x] Human confirmation required for destructive cleanup
- [x] Generated files (node_modules, lock) not misclassified as junk
- [x] File placement rules added to `AGENTS.md`
- [ ] Cleanup tasks seeded in Hermes Kanban (pending board sync — CLI not available in sandbox)
