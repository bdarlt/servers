# Architecture Decision Log (ADL)

This folder contains Architecture Decision Records (ADRs) for our project. ADRs capture important architectural decisions and their rationale to preserve institutional knowledge and improve future decision-making.

## What are ADRs?

Architecture Decision Records (ADRs) are short documents that capture a single architectural decision and its context, options, and consequences. They serve as the institutional memory of our project's technical evolution.

## Quick Links

- [ADR Introduction](../architecture-decision-records-intro.md) - Learn about ADRs, their benefits, and when to use them
- [How to Write ADRs](../how-to-write-adrs.md) - Step-by-step guide for creating ADRs
- [ADR Template](adr-template-madr-light.md) - Template for new ADRs

## Current ADRs

<!-- This section should be updated as new ADRs are added -->

### [0001: Use Black Code Formatter](0001-use-black-code-formatter.md)
**Status**: Accepted  
**Date**: 2026-01-10  
**Decision**: Adopt Black for automated code formatting to eliminate bike shedding and reduce cognitive load  
**Impact**: Zero-configuration formatting that enforces consistency across the codebase

## Naming Convention

ADR files should follow this pattern:
```
NNNN-title-with-dashes.md
```

Where:
- `NNNN` is a zero-padded sequential number (0001, 0002, etc.)
- `title-with-dashes` is a lowercase, dash-separated version of the decision title

Examples:
- `0001-use-postgresql-for-user-data.md`
- `0002-implement-jwt-authentication.md`
- `0003-deploy-with-docker-containers.md`

## Status Definitions

- **Proposed**: Decision is being discussed but not yet finalized
- **Accepted**: Decision has been made and is being implemented
- **Rejected**: Decision was considered but not chosen
- **Superseded**: Decision was previously accepted but has been replaced by a new decision

## Creating a New ADR

1. Copy the [template](adr-template-madr-light.md)
2. Fill in all sections with relevant information
3. Use the naming convention above
4. Update this README to include the new ADR in the list
5. Submit for team review before marking as "Accepted"

## Best Practices

- Create ADRs for architecturally significant decisions only
- Be honest about trade-offs and negative consequences
- Include all stakeholders in the decision-making process
- Keep ADRs concise but complete
- Review and update ADRs when decisions change