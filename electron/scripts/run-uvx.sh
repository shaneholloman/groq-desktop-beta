#!/bin/bash

# Preserve existing PATH and add common paths
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Ensure Python environment is properly set
export PYTHONUNBUFFERED=1
export PYTHONIOENCODING=utf-8
export UV_NATIVE_TLS=1

# Get the uvx path
UVX_PATH="/opt/homebrew/bin/uvx"
if [ ! -f "$UVX_PATH" ]; then
  UVX_PATH=$(which uvx 2>/dev/null)
  if [ -z "$UVX_PATH" ]; then
    echo "Error: uvx executable not found"
    exit 1
  fi
fi

# Log environment for debugging
echo "Running uvx with PATH: $PATH"
echo "UVX path: $UVX_PATH"

# Execute uvx directly with all arguments
exec "$UVX_PATH" "$@" 