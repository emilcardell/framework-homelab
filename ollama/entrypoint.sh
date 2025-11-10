#!/bin/bash
set -e

MODEL="volker-mauel/Kimi-Dev-72B-GGUF:q8_0"

echo "Starting Ollama with auto-pull for model: $MODEL"

# Ensure Ollama daemon is running in background
ollama serve &

# Wait until Ollama API is reachable (using ollama list as health check)
echo "Waiting for Ollama to start..."
until ollama list > /dev/null 2>&1; do
  echo "Waiting for Ollama daemon..."
  sleep 2
done

echo "Pulling model..."
ollama pull "$MODEL" || {
  echo "Model pull failed."
}

echo "Model pull complete. Starting main Ollama server."

# Bring ollama serve to foreground
wait -n
