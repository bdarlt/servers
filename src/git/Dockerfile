# --- Stage 1: Build Stage ---
FROM ghcr.io/astral-sh/uv:python3.13-alpine AS builder

WORKDIR /app

# Enable bytecode compilation for faster startup
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

# Install dependencies using the lockfile
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev --no-editable

# Install the project itself
COPY . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev --no-editable


# --- Stage 2: Production Stage ---
FROM python:3.13-alpine3.23

# Install Git (and optionally git-lfs/openssh if needed)
RUN apk add --no-cache git=2.52.0-r0 git-lfs=3.7.0-r4

WORKDIR /app

# Copy the virtual environment from the builder
COPY --from=builder /app/.venv /app/.venv

# Add the venv to the PATH so 'mcp-server-git' is found automatically
ENV PATH="/app/.venv/bin:$PATH"

# Git safety: prevent "dubious ownership" errors if mounting external volumes
RUN git config --global --add safe.directory '*'

ENTRYPOINT ["mcp-server-git"]
