+++
title = "AI Isn’t the End of Craft – It’s the Next Drum Machine"
date = 2025-05-19T16:00:00
template = "post.html"
[taxonomies]
tags = ["llm-workflows", "software-practices", "ai-ethics", "vibe-coding"]
[extra]
hero_image = "/images/robots-creation.png"
summary = "Seven well-trodden objections to AI-assisted development, answered in plain English (with a splash of British sarcasm)."
+++

## ☕️ A Quick Word Before the Fight Starts

Scepticism is healthy. Electric guitars were once “noise,” spreadsheets “killed accounting,” and copy-and-paste was surely going to fry every brain cell we owned. Yet here we are: brains intact, music thriving, ledgers balanced. Let’s run through today’s greatest hits against AI and see how they stack up.

## 1. “It’s Non-Deterministic – I Can’t Trust It”

Random-ish output **is the feature**. Variation lets you explore solutions you’d never type unaided. Determinism snaps straight back the moment you do the sensible thing and review the diff before it lands in `master`.

You still own the merge button. Until ChatGPT learns hypnosis, anything that gets into your repo is there because you put it there.

## 2. “It Isn’t Art – Machines Can’t Create”

Tell that to the drummer hitting *Start* on his 808 machine, or the photographer making best use of her DSLR's features.

**Art = intention + curation.**

AI supplies rough marble; you sculpt. Refusing a tool because it’s 'too helpful' is like banning power drills to save carpentry.

## 3. “It Bakes In Bias”

Bias lives in data, humans included. The difference? **Algorithmic bias is measurable and observable**. Open-source toolkits (*Fairlearn*, *Bias-Benchmark*, etc.) surface skew so you can account for them.

Try running `pip install fairlearn` on Gary from Accounts and see how that remediation goes.

## 4. “It’s a Black Box”

Interpretability research (SHAP, Integrated Gradients) is sprinting, meaning that we're closer than ever to understanding why certain inputs &amp; samplers map to certain outputs. Meanwhile, I can't explain why I picked the third queue at Sainsbury's.

Pro tip: in production, add a side-prompt – “justify this prediction in 30 words.” Instant explainability baseline.

## 5. “The Planet Can’t Afford the Compute”

Training frontier models is pricey, agreed. But **inference is cheap and falling**. Chips now push more tokens per joule than 2020 hardware by an order of magnitude; hyperscalers lean >60 % renewables.

Compare that to a single sales team’s annual short-haul flights and breathe easy.

## 6. “People Will Stop Thinking; Craft Is Dead”

Spell-check didn’t end writing; IntelliSense didn’t end programming. **Automation moves cognition up the stack.** Your IDE nails imports so you can fret about domain logic; AI writes boilerplate so you can architect systems.

If thinking dies, it won’t be AI’s fault – it’ll be ours.

## 7. “It’s a Security & Privacy Nightmare”

Any new interface widens the blast radius. Same age-old rules apply:

1. **Red-team your prompts.**
2. **Scrub PII on ingestion & output.**
3. **Log everything** (see last week’s observability post).

Job done, now tell the team to stop emailing CSVs of customer data.

## In Summary

Everyone should use AI as little or as much as they want to. I'd suggest at least playing with the available tools and understanding what they are and how they work before writing them off. 

It's not all or nothing: I write more code by hand now than I did before I had AI because it unblocks me and stops me from losing interest when I hit the boring &amp; tedious parts.

Keep building, with whatever toolchain you enjoy and feel productive building in.
