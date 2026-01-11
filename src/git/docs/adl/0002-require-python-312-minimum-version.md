# Require Python 3.12 as Minimum Version for PEP 695 Type Support

## Status
Accepted

## Date
2026-01-10

## Deciders
Project Lead (single developer project)

## Context and Problem Statement

This project started with the intention of supporting Python 3.10+ to maximize compatibility. However, the goal of implementing comprehensive type annotations throughout the codebase created a conflict with this compatibility target. The new PEP 695 type parameter syntax, which provides a much cleaner and more modern approach to generic types, is only available in Python 3.12+.

The project will be distributed via containerization, which means end users won't need to worry about their local Python version availability. This makes the compatibility trade-off more acceptable since the container environment can be controlled.

## Decision Drivers

* **PEP 695 Type Parameter Syntax**: Modern, concise syntax for generic types (only available in 3.12+)
* **Developer Experience**: Want to learn and use current Python typing best practices
* **Container Distribution**: User's local Python version is irrelevant since software runs in containers
* **Future-Proofing**: Adopt modern standards early in project lifecycle
* **Three-Year Horizon**: Comfortable maintaining this version requirement for approximately three years, similar to Node.js LTS approach

## Considered Options

### Option 1: Support Python 3.10+ (Original Plan)
* **Description**: Maintain compatibility with Python 3.10 and later versions
* **Pros**: Broader compatibility, more users can run the software locally
* **Cons**: Cannot use PEP 695 type parameter syntax, stuck with verbose TypeVar declarations
* **Impact**: Would need to use traditional typing syntax throughout the codebase

### Option 2: Support Python 3.11+ (Compromise)
* **Description**: Require Python 3.11 as minimum version
* **Pros**: Still relatively broad compatibility, access to some modern features
* **Cons**: Still no access to PEP 695 syntax, limited improvement over 3.10
* **Impact**: Minimal benefit for the compatibility trade-off

### Option 3: Require Python 3.12+ (Chosen)
* **Description**: Require Python 3.12 as minimum version
* **Pros**: Access to PEP 695 syntax, modern type system features
* **Cons**: Reduced compatibility, but mitigated by container distribution
* **Impact**: Enables clean, modern type annotations throughout the codebase

### Option 4: Require Python 3.13+ (Too Aggressive)
* **Description**: Jump directly to Python 3.13
* **Pros**: Latest and greatest features
* **Cons**: Too new, potential stability issues, very limited compatibility
* **Impact**: Encountered pathlib glitches with pytest, indicating stability concerns

## Decision Outcome

**Chosen option: Python 3.12+ requirement**, because it provides access to the modern PEP 695 type parameter syntax while being sufficiently stable for production use. The container-based distribution strategy makes the compatibility trade-off acceptable.

Python 3.13 was considered too aggressive due to early stability issues (pathlib glitches with pytest), while 3.12 offers the needed type system improvements without the bleeding-edge risks.

## Consequences

### Positive
* **Good, because** enables use of PEP 695's concise type parameter syntax
* **Good, because** provides modern typing capabilities for learning current best practices
* **Good, because** container distribution makes compatibility concerns irrelevant
* **Good, because** positions codebase for future Python enhancements
* **Good, because** three-year stability horizon aligns with project planning
* **Good, because** avoids stability issues encountered with Python 3.13

### Negative
* **Bad, because** prevents users from running software directly without containers
* **Bad, because** limits compatibility with older systems
* **Bad, because** requires maintaining awareness of Python release schedule and LTS policies
* **Bad, because** may need version updates if compelling features appear in newer versions

## Implementation Notes

### Current Environment
- Development occurs on Python 3.13
- Project targets Python 3.12+ as minimum requirement
- Container-based distribution eliminates user compatibility concerns

### Known Issues
- Python 3.13 has pathlib-related glitches with pytest
- Workaround implemented via short Python script for test execution
- Validates decision to target 3.12 rather than 3.13 as minimum

### Future Considerations
- Willing to upgrade minimum version if compelling features emerge
- Monitoring Python release schedule for LTS information
- Planning for approximately three-year stability window
- No immediate plans to require newer versions unless significant benefits justify the change

## Validation

* **Type System Usage**: Implement PEP 695 syntax throughout codebase
* **Container Testing**: Verify software runs correctly in containerized environment
* **Compatibility Verification**: Ensure 3.12+ features work as expected
* **Performance Monitoring**: Track any performance improvements (though not primary driver)
* **Developer Experience**: Assess learning curve and productivity with modern type system

---

**Date**: 2026-01-10  
**Deciders**: Project Lead  
**Last Updated**: 2026-01-10  
**Python Version**: 3.12+ minimum, 3.13 for development