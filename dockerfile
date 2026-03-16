FROM ghcr.io/openclaw/openclaw:latest

USER root

# Garante as pastas e permissões
RUN mkdir -p /data/workspace /data/.openclaw && chmod -R 777 /data

# Instala apenas o necessário para rede
RUN apt-get update && apt-get install -y curl iputils-ping && rm -rf /var/lib/apt/lists/*

# Não usamos ENTRYPOINT aqui para evitar conflito de módulos
CMD ["openclaw", "gateway"]
