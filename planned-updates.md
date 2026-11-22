# Build with AI — Current Plan (Fall 2027)

> **Status:** Current plan as of Nov 21, 2026. It replaces the earlier
> "undergraduate re-scope" version of this file (still in git history), which
> framed the course as an introduction to agentic engineering with team projects.
> `course-plan.md` (the original graduate design) is background only. Where it
> conflicts with this file, this file wins.

## Identity and framing

- **EMSE 4197: Build with AI**, Fall 2027, GWU, undergraduate. Wednesdays, Aug 25 –
  Dec 1. There is no subtitle: the old "An Introduction to Agentic Engineering"
  was dropped.
- This is **not** an AI-engineering course. It is a fun, workshop-style
  playground where students learn to make all kinds of things with AI, with
  agents at the center.
- **Core workflow: agent → code → artifact.** The agent writes (and tests) code,
  and running the code builds the artifact. We don't ask the LLM to produce the
  artifact directly. Going through code makes artifacts reproducible, uses fewer
  tokens, and gives the student more control. The idea is introduced in Week 5
  and used from then on.
- We lean on existing **Python packages** and web tools (HTML/CSS/JS, Quarto).
  The agent manages the codebase that produces each kind of output.
- **Each week pairs a concept with a build.** The *Concept* is the idea or skill
  we learn. The *Building* is the kind of artifact we're making, which can span
  several weeks (e.g., websites in Weeks 3–5). The *Build* is the take-home
  assignment. Early weeks are more conceptual (what LLMs are, Git, agents).
  Later weeks add one new capability at a time.

## Git policy

- **Week 1 is Git and GitHub by hand, with no agent**, taught through **GitHub
  Desktop** the same way as in EDA. No terminal Git.
- Students **always** control Git themselves. They never let the agent make
  commits. They review the agent's changes (diffs in GitHub Desktop) and commit
  by hand. Git is how you know what the agent changed.

## Schedule

The source of truth is `schedule.csv`. Week numbers are calendar weeks, so
Thanksgiving is week 14.

| Wk | Date | Concept | Building | Build |
|---|---|---|---|---|
| 1 | Aug 25 | What is generative AI? Chat tools: good for / bad for. Version control by hand (GitHub Desktop) | Repos (by hand) | B1 Git warm-up |
| 2 | Sep 1 | How LLMs work: tokens, next-token prediction, sampling, context windows, hallucination, cost | Chat experiments | B2 Probe the model |
| 3 | Sep 8 | Agents: LLM + tools + a loop; permissions; reviewing diffs; you commit | Websites (HTML/CSS/JS) | B3 Personal site |
| 4 | Sep 15 | How the web works: static sites, hosting, GitHub Pages; JS interactivity | Websites | B4 Deploy your site |
| 5 | Sep 22 | Context and token efficiency; **agent → code → artifact**; Quarto as a lightweight, token-efficient publishing platform (it's all Markdown) | Websites (Quarto) | B5 Quarto site (+ token report from here on) |
| 6 | Sep 29 | Skills: what they are, installing them, writing your own | Writing | B6 Voice skill → blog post |
| 7 | Oct 6 | APIs and keys: calling other models from the agent (Nano Banana / Gemini API); secrets, `.env`, cost | Images | B7 Image generation |
| 8 | Oct 13 | Verification loops: random vs. repeatable steps; agents checking their own output; scripts for the fixed parts. **Final project introduced** | Images (Python post-processing) | B8 Consistent image set |
| 9 | Oct 20 | Animation with code: frames, timing, easing, rendering to video | Animation | B9 Animated explainer |
| 10 | Oct 27 | Sound and music with code: waveforms, MIDI, synthesis. **Proposal due** | Music & sound | B10 Song or sound pack |
| 11 | Nov 3 | Data injection: keep data separate from presentation; never let the LLM retype data; templates + rendering | Documents (Quarto + CSV) | B11 Restaurant menu site |
| 12 | Nov 10 | Designing for print: HTML → PDF (print CSS, page size, fonts, headless browser) | Documents (PDF) | B12 Restaurant menu PDF |
| 13 | Nov 17 | Data visualization as analysis: chart choices; verify the numbers, not just the plot | Data visualization | B13 Data story (due Dec 1) |
| 14 | Nov 24 | *Thanksgiving, no class* | | |
| 15 | Dec 1 | Presentations: slides as code; summarizing your whole project. No separate build: the deck goes into the final project video | Slides | — |
| 16 | Dec 8 | *No class.* **Final project due** | | |
| Exam | Dec 10–16 (slot TBD) | Showcase of a few projects, then the handwritten final exam | | |

Notes:

- Animation and sound come before the document and data weeks so students can
  use them in their final projects.
- Presentations are last because that's when students present their own work.
- The restaurant menu (Weeks 11–12) builds on the image weeks. All menu data
  (items, prices, ingredients) lives in a CSV that Quarto renders, first into a
  website and then into a PDF by going web page → PDF. Quarto's LaTeX PDF route
  is not the focus.
- **Images:** we don't use Claude for image generation. We teach calling other
  APIs (Nano Banana via the Gemini API) from the agent, plus Python
  post-processing (e.g., Pillow) for the parts that must be reproducible.
  Reference: Pingfan Hu, ["Agentic Skills"](https://pingfanhu.com/blog/2026-06-24-agentic-skills/)
  (June 2026). Its key ideas:
  - an agent rewrites the prompt for the image model, then reviews the result
    and regenerates if needed;
  - text is added by code, never by the image model;
  - reference images plus image-to-image passes keep a set consistent;
  - what should vary is kept separate from what must stay fixed.

  More on [his blog](https://pingfanhu.com/blog).
- Candidate Python packages, to confirm when each deck is written:
  - animation: manim, matplotlib.animation;
  - sound: music21, pretty_midi, pydub, numpy/scipy;
  - HTML → PDF: Playwright or WeasyPrint;
  - data viz: polars + plotnine.

## Assessment

**Proposed weights** (in `syllabus.qmd`, awaiting John's review): participation
5%, builds 25% (lowest dropped), quizzes 25% (lowest two dropped), project
proposal 2%, final project 13%, final exam 30%. The syllabus also has draft
0 / 0.5 / 1 rubrics for builds and the final project.

- **Builds (13):** one per week, graded **0 / 0.5 / 1**, mostly auto-graded by
  Claude against a rubric. Be transparent with students about this. Students
  submit their **transcripts**. From Build 5 on, they also submit a **token usage
  report**.
- **Quizzes (13):** weekly, **handwritten**, conceptual, at the start of class,
  run like P4A (`~/gh/teaching/P4A/2026-Spring`). They cover the prior week. A
  large share of the grade.
- **Final exam:** handwritten and conceptual, in the final-exam slot. A large
  share of the grade.
- **Final project:** **individual** (no teams).
  - Introduced in Week 8.
  - **Proposal** due Oct 27. It's high level and graded for completion (1 / 0).
    Its purpose is early feedback on whether the idea is good and well scoped.
  - **Final submission** due Dec 8, graded **0 / 0.5 / 1** on effort, with a
    rubric. It includes:
    - a GitHub repo link with the project and all source files;
    - a **5-minute YouTube video**;
    - transcripts;
    - a token usage report.
  - Grading happens before the exam. A few projects are showcased at the start
    of the exam.

## Submissions and grades

The setup copies EDA (`eda-f26/eda-netID`). There's one GitHub organization
per semester, `bwai-f27` (the `gitorg` variable). It's separate from
`bwai-gwu`, which hosts the site. Each student gets one private repo there,
`bwai-netID`:

- builds go in `build1` … `build13`;
- the proposal and final project go in `project`;
- graded feedback (PDFs plus grade CSVs) comes back in `feedback`.

Builds that deploy to GitHub Pages (the personal site in Builds 3–5, and likely
the final project) need their own public repo. Their build folder in the course
repo holds the link plus the transcript and token report. Spell this out on
those build pages, and add EDA-style "clone your course repo" steps to Build 1.

## Dropped from earlier plans

Team projects and team studio, the interim report, final presentations,
oral code walkthroughs, MCP, chatlas/LLM APIs as a topic, CI/GitHub Actions,
multi-agent orchestration, the "trust gradient" framing, and per-build reading
reflections.

## Open items

- John to review the proposed weights, rubrics, and late policy in
  `syllabus.qmd`.
- How Claude auto-grades, and how transcripts and token usage are collected
  (e.g., Claude Code / Codex session logs, `ccusage`).
- Confirm Gemini API image pricing and whether a free tier covers it (the
  syllabus says "a few dollars over the semester").
- Meeting time, room, and exam slot (still placeholders in `_variables.yml`).
- `faq.qmd` is still a placeholder.
