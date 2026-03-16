FROM ghcr.io/openclaw/openclaw:latest

USER root

RUN mkdir -p /data/workspace /data/.openclaw \
    && chmod -R 777 /data

# Removemos o ENTRYPOINT fixo para deixar o comando do Compose agir sozinho
CMD ["openclaw", "gateway"]
