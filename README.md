# Build with AI

Course website for **EMSE 4197: Build with AI** (Fall 2027, GWU), built with
[Quarto](https://quarto.org/).

## Project documents

- `planned-updates.md` — the **current** plan (a "make things with AI" workshop,
  Fall 2027). It overrides `course-plan.md`.
- `course-plan.md` — the original graduate design document (EMSE 6992, Spring
  2027); kept for reference.
- `class-factory.md` — the original syllabus seed; kept for reference.

## Building the site

```bash
quarto preview   # live preview
quarto render    # build to _site/
```

The weekly schedule is data-driven from `schedule.csv` via `_common.R` (table
generation) and `schedule.lua` (a Pandoc table filter).

## Structure

- `class/` — one landing page per teaching meeting (`N-stub.qmd`) plus a folder per
  week holding the slide deck (`N-stub/index.qmd`). Slide folders are excluded
  from the main render until their decks are built.
- `hw/` — the 13 weekly build assignments.
- `project/` — the individual final project overview, proposal, and final submission.
- `fragments/` — reusable content snippets included across pages.
