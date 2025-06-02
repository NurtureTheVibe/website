+++
title = "Will LLMs Kill The Next Rust?"
date = 2025-06-02T15:00:00
weight = 2
template = "post.html"
[taxonomies]
tags = [
  "llms",
  "vibe-coding",
  "prompt-engineering",
  "programming-languages",
  "open-source",
  "ai-assisted-dev"
]
[extra]
hero_image = "/images/language-landscape.png"
summary = "With AI being entrusted with more and more implementation details, how can new programming languages and tooling stay relevant?"
+++
Creating and *growing* a new programming language has never been a weekend project. LLVM may have turned compiler engineering into IKEA flat‑pack, but you still have to persuade the rest of us to assemble the thing. If your language doesn’t neutralise a pain developers actually feel, it stays an academic curiosity for compiler tragics like me.

Take **Rust**. For decades **C and C++** owned systems programming. Rust’s pitch was simple: the same low‑level power, minus the foot‑guns, at the cost of a steeper syntax and a borrow‑checker learning curve. I'm still happiest in C, yet I don't find it hard to understand why people are willing to trade a bit of compiler-wrestling for being able to skip debugging a difficult to reproduce use-after-free at 3am.

Even with that killer value‑prop, Rust's climb has been slow. It only *recently* wormed its way into the Linux kernel, and not without Shakespearean drama [involving maintainers stepping down on both the C and Rust sides](https://www.theregister.com/2024/09/02/rust_for_linux_maintainer_steps_down/). That’s the **normal** difficulty setting.

## Enter the Large Language Model

LLMs like ChatGPT, DeepSeek, Claude and Grok grew up binge‑reading GitHub. They’re *fluent* in the languages with the most public code: Python, JavaScript, C/C++. Ask for a quick script and they’ll default there. Ask for Common Lisp or Odin and you'll get syntax errors, hallucinated libraries, and a polite shrug.

Sure, you can debug alongside the model, but that friction is exactly what time‑starved teams will avoid. [A quarter of the latest YC cohort is already shipping codebases written almost entirely by AI](https://techcrunch.com/2025/03/06/a-quarter-of-startups-in-ycs-current-cohort-have-codebases-that-are-almost-entirely-ai-generated/), and [blue‑chip CEOs are pledging 'AI‑first' development with alacrity](https://www.vccafe.com/2025/05/07/the-ai-first-company-ceos-signal-a-paradigm-shift/). They will follow the path of least resistance straight to *first‑class* languages.

The result is a feedback loop:

1. LLMs write more Python, which gets reviewed by blue chip staff engineers.
2. That code increases the size and the quality of the public corpus.
3. Bigger corpus means better model performance on Python.
4. Repeat.

Every niche language is pushed deeper into *second‑class citizen* territory. Tomorrow’s language designer isn’t just pitching to engineers and CTOs; she also has to convince OpenAI, Anthropic, DeepSeek and xAI that her tooling deserves a seat in their annotation, review and training budgets.

## And This Goes Doubly For Tooling

> "Hey ChatGPT, what framework or library should I use for XYZ?"

Unless you twist its arm the answer will be React, FastAPI, or Folly. Solid choices — battle‑tested and safe — yet each started life as a plucky challenger.

React clawed past Backbone and Ember.

FastAPI elbowed aside Django’s comfy ORM.

Folly had to outshine Boost's Swiss‑Army‑Knife headers.

Now imagine 2010 with ChatGPT on every dev desktop. Would React have broken out of Facebook? Would FastAPI's quirky async def tutorials ever outrank Django docs? Probably not.

Tooling produces less raw code than full languages, so the statistical gulf opens even faster. One missing 'how‑to' blog post and your fresh framework drops off the token cliff.

## How to Keep New Ideas Alive

I've done a lot of thinking about this over the past few days, and I think that there is hope for the future. We're used to having to evangelise the tech stacks we love to *people*, we just need to learn to evangelise to LLMs.

The good news is that this doesn't have to involve a huge amount of additional work. Often, it's taking things that you're already doing and making them available in a format that LLMs understand.

Let's talk about the general formula for fine-tuning, and how a language or tool designer can make information available for training:

### Pre-training (PT) or Continued pre-training (CPT)

At this stage, the goal is to feed as much raw data into the LLM as possible, because we're primarily establishing broad conceptual thinking. This is where binge-eating GitHub comes in.

You may think that because you have a lot less repositories than JavaScript, there's no way you can possibly train the LLM enough, and at this stage you'd be broadly right, but there are some things you can do to give the LLM the best possible chance of picking up a broad base of knowledge.

First of all, ensure that your documentation contains usage examples for every struct and function, not just a high level API reference. Putting these two types of data in close proximity means that the LLM will associate the usage examples with the documented API. The more edge cases your usage examples cover, the easier it will be for the LLM to learn. 

Take [the PHP docs](https://www.php.net/manual/en/function.explode.php) for example; not only are there plenty of 'Examples' for even trivial functions, but user-contributed examples expand upon them.

Similarly, make sure that the `examples/` on the compiler's GitHub repository are well-commented all the way through. Treat it like you're writing hand-rolled Assembly. The more that the LLM can infer from the comments, the less examples it will need to get a concrete understanding of your syntax, idioms and practices.

### Instruct training (SFT)

Unlike pre-training, instruct training takes conversational data and teaches the LLM the correct outputs for those conversations. For example, we might have an exchange like this:

```json
[
    {
        "role": "user",
        "message": "What is the `explode` function in PHP?"
    },
    {
        "role": "assistant",
        "message": "The `explode` function in PHP..."
    }
]
```

The beauty of this conversation is that you already have hundreds of existing public examples for your project:

1. Your GitHub issues
2. Your Discord or Slack `#help` channels
3. All those IRC chats you've had with other compiler developers
4. The discussions you had with Grok when designing your framework
5. Those how-to blogs you were already writing

It's not a huge amount of work to convert these to an instruct dataset, and make it available to LLM trainers. Just make sure that your users are aware that their questions could be used in this way and why it's important for the project, and ensure that you strip PII from the data. You don't want an ethics headache (or GDPR violation) on your hands.

### Preference finetuning (DPO, ORPO, GRPO etc)

Preference finetuning is a lot like SFT, except that instead of giving the LLM one potential output, we give them two or more, either as a `chosen`/`rejected` pair or in a ranked order.

Again, thankfully, you have many examples for this dataset because you already use this language or framework. The next time you write code that fails to compile or doesn't work, or refactor a function, build a spreadsheet like this:

| Prompt | Chosen | Rejected |
| ------ | ------ | -------- |
| Write a function/module that does ... | The piece of code you were happy with, lightly annotated | The piece of code you weren't happy with, lightly annotated |

Encourage others in your language/framework ecosystem to do the same. Rejected pull requests are also useful for this purpose.

Once you have a few hundred examples, you have the foundation for a dataset and it probably cost you less than 10 minutes each time on top of a task you were already doing.

### An Aside

Quality of data is often more important than quantity of data for improving an LLMs understanding of a problem domain. You may think that a few hundred or a few thousand examples isn't enough, but if they're good examples, they will materially improve the way the LLM handles your technology.

Almost everything above will also improve the usability of your project for humans as well. Better code usage examples, better help exchanges, and illustrated examples of what to do and what not to do will give people the same wealth of knowledge that you're curating for LLMs. The training step is just a data transformation.

## Dogfooding your Datasets

It's all well and good to collect and publish this data, but how do you know how well it works? You train your own LLM and dogfood your work by pair-programming with it and seeing where it works and where it struggles.

In a future blog post, we'll cover how to do this three-step process (CPT, SFT and DPO) on an open weights model like Mistral Small 24B, and we'll test it side by side against the base model for the language we're going to train it to understand.
