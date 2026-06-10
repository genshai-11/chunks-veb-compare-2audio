# 07 — UI System — Sound Mirror

## Status

- UI system status: Detected (implemented in `style.css` + `index.html`, direction from `DESIGN.md` / Stitch project 8689072309239478105)
- Last updated: 2026-06-10
- Source files: `style.css`, `index.html` (this doc supersedes root `DESIGN.md` — merge candidate)

## Visual Direction

Swiss/editorial minimal for an audio analysis tool. White page, precise 1px borders, square corners, no gradients/shadows, compact uppercase labels, strong typographic hierarchy. CHUNKS red used sparingly (active tabs, primary CTA, selected states, score accents).

## Design Tokens

### Colors

| Token | Value | Usage |
| --- | --- | --- |
| color-primary | `#bf080b` | CHUNKS red — accents, CTA, active states |
| color-primary-hover | `#960005` | hover on primary |
| color-text | `#18181b` | main text |
| color-muted | `#71717a` | secondary text |
| color-border | `#e5e5e5` | 1px panel borders |
| color-surface-subtle | `#f8f8f8` | subtle surfaces |
| color-background | `#ffffff` | page |

### Typography

| Token | Value | Usage |
| --- | --- | --- |
| font-heading | `Oswald`, uppercase, wide tracking | headlines, labels, nav |
| font-body | `Be Vietnam Pro`, light | body text |
| hero | oversized uppercase, red accent word | landing headline |

### Shape

Square / near-zero radius; shadow none or minimal; spacious editorial grid.

## Component Registry

| Component | Notes | Status |
| --- | --- | --- |
| Header | sticky white translucent, `logo.png`, nav tabs, guarantee pills | Detected |
| Hero | editorial headline above analyzer | Detected |
| Audio slots | bordered panels, Source A/B, upload/record split, playback | Detected |
| Preprocessing strip | two-column compact toggles | Detected |
| Method cards | bordered grid cells; active = subtle red wash | Detected |
| Verdict strip | inline 4-button after results (very-similar…very-different) | Detected |
| Results | table-like cards + charts | Detected |
| Method Performance panel | History page, visible at ≥5 verdicts | Detected |

## Page Registry

| Page | Purpose | Status |
| --- | --- | --- |
| Analyzer (main) | run Analysis Pair, results, verdict | Detected |
| History | entries, verdicts, Method Performance panel | Detected |
| Guide (how it works) | method explanations | Detected |
| LLM Settings | endpoint/key/model config + test | Detected |

## Guardrails (hard rules)

- Frontend only — do not modify analysis logic in `src/` for UI work.
- **Preserve all existing DOM IDs used by JavaScript.**
- No new colors/fonts/components without updating this file.
- Progress board style lock does NOT apply here — this section is product UI; the board keeps its own Swiss Project OS style.

## Visual Review Checklist (pending — F04)

- [ ] Screenshots: analyzer, history, guide, LLM settings
- [ ] Responsive spot-check
- [ ] Verdict strip + performance panel states
