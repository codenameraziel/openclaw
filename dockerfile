FROM coollabsio/openclaw:latest

USER root

# Atualiza pacotes e instala utilitários básicos
RUN apt-get update && apt-get install -y \
    nano \            # editor de texto
    curl \            # testar endpoints HTTP
    wget \            # baixar arquivos
    less \            # visualizar arquivos grandes
    vim \             # editor alternativo
    iputils-ping \    # testar conectividade
    net-tools \       # ifconfig, netstat etc.
    htop \            # monitorar processos
    && rm -rf /var/lib/apt/lists/*

USER 1000
