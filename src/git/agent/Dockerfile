# Use the official uv image for Python 3.13
FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install both CLI tools
RUN uv tool install kimi-cli
RUN uv tool install mistral-vibe

# The ENTRYPOINT can be a shell or a custom script to let you choose
CMD ["/bin/bash"]
