FROM ollama/ollama:rocm

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default entrypoint
ENTRYPOINT ["/entrypoint.sh"]
