# Use Black Code Formatter for Automated Code Formatting

## Status
Accepted

## Date
2026-01-10

## Deciders
Project Lead (single developer project)

## Context and Problem Statement
Code formatting has always been a source of friction in software development. While there was no chaos in the codebase, every developer seems to have their own idea of "the one true coding format." This leads to:

- Time wasted arguing over formatting preferences during code reviews
- Cognitive load when reading code with inconsistent formatting styles
- Mental energy spent on formatting decisions instead of problem-solving
- Inefficient onboarding for new developers who need to learn "the team's style"

The discovery of code auto-formatters presented an opportunity to eliminate these issues entirely through automation.

## Decision Drivers

* **Eliminate bike shedding**: Remove formatting discussions from code reviews entirely
* **Reduce cognitive load**: Consistent formatting makes code easier to read and understand
* **Developer productivity**: Stop wasting time on manual formatting decisions
* **AI code generation**: Ensure AI-generated code conforms to project standards
* **Zero configuration**: Minimize setup and maintenance overhead
* **Enforce consistency**: Automated tool ensures everyone follows the same format without effort

## Considered Options

### Black
* **Description**: Python code formatter with minimal configuration options, PEP8 compliant
* **Pros**: Zero configuration, PEP8 compliant, handles complex formatting (multi-line to single line and vice versa), reformats comments, strong community adoption
* **Cons**: No stylistic flexibility, requires adaptation period

### YAPF (Yet Another Python Formatter)
* **Description**: Google's Python formatter with extensive configuration options
* **Pros**: Highly configurable, can match existing styles
* **Cons**: Requires configuration decisions, doesn't solve the bike shedding problem

### autopep8
* **Description**: Automatic formatter that makes code PEP8 compliant
* **Pros**: PEP8 focused, some configuration options
* **Cons**: Less comprehensive than Black, still requires some configuration decisions

### Manual Formatting
* **Description**: Developers format code manually or follow PEP8 guidelines
* **Pros**: Complete flexibility, no tool dependency
* **Cons**: Inconsistent results, time consuming, requires ongoing effort and review

### EditorConfig-based Approach
* **Description**: Use EditorConfig for basic formatting rules (line length, EOL)
* **Pros**: Simple, editor-integrated
* **Cons**: Limited Python-specific formatting capabilities, doesn't handle complex formatting scenarios

## Decision Outcome

**Chosen option: Black**, because it provides zero-configuration automated formatting that eliminates all formatting decisions and arguments. The tool's opinionated nature is precisely what solves the bike shedding problem - there's simply nothing to argue about when the tool makes all formatting decisions automatically.

Black's ability to handle complex formatting scenarios (converting between single-line and multi-line formats automatically) and its PEP8 compliance make it the ideal choice for Python projects seeking to eliminate formatting friction entirely.

## Consequences

### Positive
* **Good, because** zero configuration means no setup or maintenance overhead
* **Good, because** eliminates all formatting discussions and code review bike shedding
* **Good, because** developers can type "anything" and it gets formatted automatically
* **Good, because** handles complex formatting scenarios (function calls, multi-line conversions) effortlessly
* **Good, because** reduces cognitive load when reading consistently formatted code
* **Good, because** new developer onboarding is simplified - "We use Black, done"
* **Good, because** AI-generated code automatically conforms to project standards
* **Good, because** saves time previously spent on manual formatting
* **Good, because** developers discover what's possible with automated formatting

### Negative
* **Bad, because** requires adaptation period (1-2 weeks) where developers adjust to not controlling formatting
* **Bad, because** can be slightly annoying when Black reformats carefully hand-formatted code
* **Bad, because** no flexibility for edge cases where different formatting might be preferred
* **Bad, because** team members must accept Black's formatting decisions without exception

## Validation

* **Developer feedback**: Monitor team satisfaction and adaptation progress
* **Code review metrics**: Track reduction in formatting-related comments
* **Onboarding efficiency**: Measure time saved in new developer training
* **Consistency metrics**: Verify uniform formatting across codebase
* **Productivity indicators**: Assess time saved on formatting tasks

## Personal Experience Note

The adaptation period involved adjusting to Black's opinionated formatting, particularly when it would reformat carefully hand-formatted code back to its preferred style. However, this minor frustration transformed into appreciation upon realizing that any code could be typed without formatting effort, and complex formatting scenarios would be handled automatically. The "life-changing" moment came when observing Black effortlessly convert between single-line and multi-line function calls - a task that's tedious to do manually.

The later discovery of Prettier for TypeScript reinforced the value of zero-configuration formatting tools across different languages, confirming that the approach scales well beyond Python development.

---

**Date**: 2026-01-10  
**Deciders**: Project Lead  
**Last Updated**: 2026-01-10