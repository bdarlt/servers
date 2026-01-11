#!/bin/bash
# Script to run bandit security scanner

echo "Running bandit security scan..."
uv run bandit -c bandit.yaml -r src/
echo "Bandit scan completed."