"""Type definitions and generic utilities for MCP Server Git.

This module demonstrates PEP 695 type parameter syntax and provides
reusable type aliases and generic utilities.
"""

from __future__ import annotations

from pathlib import Path
from typing import Callable

# Type aliases using PEP 695
type RepositoryPath = str | Path
type CommitHash = str
type BranchName = str
type FilePath = str | Path

# Generic type aliases
type Handler[T, U] = Callable[[T], U]
type Validator[T] = Callable[[T], bool]

# Git-specific type aliases
type GitResult = str
type GitError = str


class RepositoryResult[T]:
    """Generic result wrapper for repository operations."""

    def __init__(self, value: T | None = None, error: GitError | None = None) -> None:
        self.value = value
        self.error = error

    @property
    def is_success(self) -> bool:
        return self.error is None

    @property
    def is_failure(self) -> bool:
        return self.error is not None

    def map[U](self, func: Callable[[T], U]) -> RepositoryResult[U]:
        """Transform the success value if present."""
        if self.is_success and self.value is not None:
            return RepositoryResult(func(self.value))
        return RepositoryResult(error=self.error)

    def unwrap(self) -> T:
        """Get the value or raise an exception."""
        if self.is_failure:
            raise ValueError(self.error)
        if self.value is None:
            raise ValueError("No value present")
        return self.value


def validate_not_empty(value: str) -> bool:
    """Validate that a string is not empty."""
    return len(value.strip()) > 0


def validate_path_exists(path: str | Path) -> bool:
    """Validate that a path exists."""
    return Path(path).exists()
