# ADR 001: Require Python 3.12 as Minimum Version

## Status
**Proposed**

## Context

The Model Context Protocol (MCP) server project currently supports Python 3.10+ but is considering requiring Python 3.12 as the minimum supported version. This decision needs to balance the benefits of newer Python features against potential adoption barriers for users.

Python 3.12 was released in October 2023 and represents a significant advancement in the language's evolution, particularly in areas of performance, type system improvements, and developer experience enhancements that are directly relevant to MCP server development.

## Decision

**Require Python 3.12 as the minimum supported version** for the MCP server project, effective immediately for all new development.

## Consequences

### Positive Consequences

1. **Performance Improvements**
   - **5% overall performance improvement** compared to Python 3.11, with some benchmarks showing up to 2x speedup for comprehensions
   - **75% speedup in asyncio operations** through optimized socket writing and eager task execution
   - **64% faster tokenization** due to PEP 701 f-string parsing improvements
   - **2-20x faster isinstance() checks** against runtime-checkable protocols
   - Reduced memory usage through removal of wstr from Unicode objects (8-16 bytes saved per string on 64-bit platforms)

2. **Enhanced Type System (PEP 695)**
   - **New type parameter syntax** that eliminates verbose TypeVar declarations:
     ```python
     # Before (3.11)
     from typing import TypeVar, Generic
     T = TypeVar('T')
     class Stack(Generic[T]):
         def push(self, item: T) -> None: ...
     
     # After (3.12)
     class Stack[T]:
         def push(self, item: T) -> None: ...
     ```
   - **Automatic variance inference** - no need to manually specify covariant/contravariant
   - **Type aliases with `type` statement** supporting generics and forward references
   - **Lazy evaluation** of type bounds and constraints

3. **Developer Experience Improvements**
   - **Enhanced f-string flexibility** (PEP 701) allowing nested f-strings, multi-line expressions, and quote reuse
   - **Better error messages** with "Did you mean..." suggestions for NameError, ImportError, and SyntaxError
   - **Improved debugging** with more precise f-string error locations
   - **New debugging/profiling API** (PEP 669) for near-zero overhead monitoring

4. **Security Enhancements**
   - **Formally verified cryptographic implementations** from HACL* project for SHA1, SHA3, SHA2-384, SHA2-512, and MD5
   - **Improved tarfile extraction filters** to prevent directory traversal attacks
   - **Enhanced buffer overflow protection** on supported platforms
   - **Stack overflow protection** mechanisms

5. **Modern Language Features**
   - **Buffer protocol accessible from Python** (PEP 688) for better C integration
   - **Per-interpreter GIL** (PEP 684) enabling better multi-core utilization
   - **Comprehension inlining** (PEP 709) for better performance and cleaner tracebacks
   - **Override decorator** (PEP 698) for better API design

6. **Standard Library Improvements**
   - **pathlib.Path subclassing support** for custom path implementations
   - **Enhanced Windows filesystem support** in os and pathlib modules
   - **Command-line interfaces** added to sqlite3 and uuid modules
   - **Improved asyncio performance** with up to 75% speedup in some benchmarks

### Negative Consequences

1. **Adoption Barriers**
   - Users on older Linux distributions may need to install Python 3.12 manually
   - Some enterprise environments may have strict Python version policies
   - Container images may need updates to include Python 3.12

2. **Breaking Changes**
   - **distutils removal** - projects using distutils need to migrate to setuptools
   - **wstr removal** from Unicode objects may affect C extensions
   - **Deprecated modules removed**: asynchat, asyncore, imp
   - **Invalid escape sequences** now generate SyntaxWarning instead of DeprecationWarning

3. **Compatibility Considerations**
   - Third-party packages may not yet support Python 3.12
   - Some C extensions may need updates for the free-threading build
   - Unicode changes may affect international applications

## Rationale

The decision to require Python 3.12 is justified by several key factors that directly benefit MCP server development:

### 1. Performance Critical for MCP Servers
MCP servers handle real-time model context operations where performance directly impacts user experience. The 5% overall performance improvement and 75% asyncio speedup are significant for server responsiveness.

### 2. Type Safety for Complex Protocols
The new type parameter syntax (PEP 695) significantly reduces boilerplate while improving type safety. For MCP's complex protocol definitions involving generics, this represents a substantial improvement in code maintainability and developer productivity.

### 3. Security for Production Deployments
The formally verified cryptographic implementations and enhanced security features are crucial for MCP servers that may handle sensitive model context data in production environments.

### 4. Developer Experience for Active Development
The improved error messages, debugging capabilities, and modern language features reduce development friction and improve code quality during active MCP server development.

### 5. Future-Proofing
Python 3.12 receives security support until October 2028, providing a stable foundation for long-term MCP server deployments. The per-interpreter GIL feature positions the project well for future multi-core scaling needs.

## Mitigation Strategies

To address adoption barriers:

1. **Provide clear migration documentation** with platform-specific installation guides
2. **Offer container images** with Python 3.12 pre-installed
3. **Maintain compatibility shims** for critical dependencies during transition
4. **Gradual rollout** starting with development environments before production

## Adoption Statistics

Based on available data:
- Python 3.12 was released in October 2023
- Major cloud providers (AWS, GCP, Azure) support Python 3.12 in their serverless offerings
- Most popular Python packages now support Python 3.12
- The Python community generally adopts new versions within 12-18 months of release

## Conclusion

The benefits of Python 3.12's performance improvements, enhanced type system, security enhancements, and developer experience improvements significantly outweigh the adoption challenges. For an MCP server project focused on performance, type safety, and modern Python practices, requiring Python 3.12 as the minimum version is the optimal technical decision.

The improvements in asyncio performance alone justify the requirement for a server application, while the type system enhancements directly support the complex protocol definitions inherent to MCP. The security improvements are essential for production deployments, and the overall performance gains contribute to better user experience.

## References

- [Python 3.12 What's New](https://docs.python.org/3/whatsnew/3.12.html)
- [PEP 695 - Type Parameter Syntax](https://peps.python.org/pep-0695/)
- [PEP 701 - Syntactic formalization of f-strings](https://peps.python.org/pep-0701/)
- [PEP 709 - Comprehension inlining](https://peps.python.org/pep-0709/)
- [PEP 669 - Low impact monitoring for CPython](https://peps.python.org/pep-0669/)
- [PEP 688 - Making the buffer protocol accessible in Python](https://peps.python.org/pep-0688/)
- [Python 3.12 Release Notes](https://www.python.org/downloads/release/python-3120/)
- [Python Developer Guide - Version Status](https://devguide.python.org/versions/)