FROM coollabsio/openclaw:latest

USER root

# Cria os diretórios esperados pelo OpenClaw e garante permissões
RUN mkdir -p /data/npm-global /data/uv /data/go /data/workspace /data/.openclaw \
    && chmod -R 777 /data

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

# Mantém o container rodando como root para evitar problemas de permissão
