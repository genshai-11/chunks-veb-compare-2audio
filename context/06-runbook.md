# 06 — Runbook — Sound Mirror

## Status

- Runbook status: Draft (deploy flow documented, never yet executed with evidence)
- Last updated: 2026-06-10

## Local Setup

```bash
npm install          # only for tests (vitest)
python -m http.server 8000 --bind 127.0.0.1
# open http://127.0.0.1:8000/
```

No build step. App is plain static files.

## Development Commands

```bash
npm test             # vitest (run on Windows; Linux sandbox needs fresh `npm ci` due to rollup native binding)
```

## Environment / Secrets

None server-side. LLM endpoint + API key are entered in the app's LLM Settings page and stored in browser `localStorage` only — never commit them.

## Deployment — Vercel (static)

`vercel.json`: cleanUrls, security headers, no-cache on `/src/*`.

Release flow (from README, now canonical here):

1. Commit changes; working tree clean.
2. Tag release: `git tag v<X.Y.Z>`.
3. Deploy preview on Vercel first.
4. Validate on preview: analyzer run, guide page, LLM settings, model test, JSON AI analysis.
5. Promote to production.
6. Record evidence (URLs, screenshots) in Hermes task + `context/04-operating-state.md`.

## Release Controls

- [ ] Commit exists
- [ ] Tag exists
- [ ] Preview validated (5 checks above)
- [ ] Rollback instructions checked
- [ ] Hermes task includes deploy evidence

## Rollback

- Redeploy the previous Vercel deployment (dashboard → Deployments → Promote), or
- `git checkout <previous-tag>` and redeploy.
- Last known good version: none yet (no production deploy recorded).

## Common Failures

| Symptom | Likely cause | Fix |
| --- | --- | --- |
| wav2vec method hangs on first use | ~90MB model downloading | wait; loading state should show (ADR-0002); check network tab |
| Methods fail only on `file://` | ES modules need HTTP | serve with `python -m http.server` |
| `npm test` fails on Linux with rollup native error | node_modules installed on Windows | `rm -rf node_modules && npm ci` on that OS |
| Mic record fails | permissions / non-secure context | use localhost or HTTPS |
| Domain note | `*.web.app` is Firebase, not Vercel | Vercel domains are `*.vercel.app` |

## Ops Update Rule

Any change to setup, deploy, rollback, or storage updates this file before the task is done.
