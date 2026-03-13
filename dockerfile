FROM coollabsio/openclaw:latest

USER root

# Instala nano e utilitários básicos
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

USER 1000
