#!/bin/bash
set -e

MODEL="volker-mauel/Kimi-Dev-72B-GGUF:q8_0"

echo "Starting Ollama with auto-pull for model: $MODEL"

# Ensure Ollama daemon is running in background
ollama serve &

# Wait until Ollama API is reachable
until curl -sf http://localhost:11434/api/version > /dev/null; do
  echo "Waiting for Ollama to start..."
  sleep 2
done

echo "Pulling model..."
ollama pull "$MODEL" || {
  echo "Model pull failed."
}

echo "Model pull complete. Starting main Ollama server."

# Bring ollama serve to foreground
wait -n
