FROM coollabsio/openclaw:latest

USER root

# Cria os diretórios esperados pelo OpenClaw e ajusta permissões
RUN mkdir -p /data/npm-global /data/uv /data/go /data/workspace /data/.openclaw \
    && chown -R 1000:1000 /data

# Instala utilitários úteis para debug e manutenção
RUN apt-get update && apt-get install -y \
    nano \
    curl \
    wget \
    less \
    vim \
    iputils-ping \
    net-tools \
    htop \
    && rm -rf /var/lib/apt/lists/*

# Volta para o usuário padrão (UID 1000)
USER 1000
