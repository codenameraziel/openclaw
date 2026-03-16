FROM ghcr.io/openclaw/openclaw:latest

USER root

# Cria diretórios e garante permissões para evitar erro de "Is a Directory"
RUN mkdir -p /data/workspace /data/.openclaw \
    && chmod -R 777 /data

# Utilidades para o seu i5 respirar melhor
RUN apt-get update && apt-get install -y \
    curl \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["openclaw", "gateway", "start"]
