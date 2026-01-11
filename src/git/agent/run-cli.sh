#!/bin/bash

# --- Configuration ---
IMAGE_NAME="ai-cli-tools"
KIMI_CONFIG="$HOME/.kimi"
VIBE_CONFIG="$HOME/.vibe"

alias docker=podman
# --- Initialization ---
# Ensure host directories exist so they are owned by the current user
mkdir -p "$KIMI_CONFIG" "$VIBE_CONFIG"

# --- Build the Arguments Array ---
# We use an array to handle spaces and complex paths safely
COMMON_ARGS=(
    --rm                             # Remove container after exit
    -v "$(pwd):/app"                 # Mount current project
    -v "$KIMI_CONFIG:/root/.kimi"    # Persist Kimi settings
    -v "$VIBE_CONFIG:/root/.vibe"    # Persist Vibe settings
    -w /app                          # Set working directory
)

# --- Logic to Parse Input ---
# Defaults
MODE="interactive"
TOOL="kimi"

# Simple flag parsing
for arg in "$@"; do
    case $arg in
        --acp)
            MODE="acp"
            ;;
        vibe)
            TOOL="vibe"
            ;;
        kimi)
            TOOL="kimi"
            ;;
    esac
done

# --- Execution ---
if [ "$MODE" == "acp" ]; then
    echo "🚀 Starting $TOOL in ACP mode (background)..."
    # Execute with array expansion
    docker run -d --name "${TOOL}-acp" "${COMMON_ARGS[@]}" "$IMAGE_NAME" "$TOOL" --acp
else
    echo "💻 Starting $TOOL in interactive mode..."
    # Add -it for interactive terminal
    MSYS_NO_PATHCONV=1 docker run -it "${COMMON_ARGS[@]}" "$IMAGE_NAME" "$TOOL"
fi

