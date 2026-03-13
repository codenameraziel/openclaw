FROM coollabsio/openclaw:latest

USER root

# Cria o diretório /data e ajusta permissões
RUN mkdir -p /data && chown -R 1000:1000 /data

# Instala utilitários
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

# Volta para o usuário padrão
USER 1000
