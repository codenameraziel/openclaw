FROM ubuntu:22.04

# Instalar dependências básicas
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instalar o OpenClaw via script oficial
RUN curl -fsSL https://openclaw.dev/install.sh | bash

# Definir diretório de trabalho
WORKDIR /app

# Expor porta padrão (se o OpenClaw rodar como serviço)
EXPOSE 8080

# Comando padrão (ajuste conforme necessário)
CMD ["openclaw", "serve"]
