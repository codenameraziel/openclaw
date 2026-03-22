# syntax=docker/dockerfile:1.7

FROM node:22-bookworm

# Instalar dependências necessárias + cliente Docker
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      git \
      jq \
      python3 \
      openssl \
      docker.io && \
    rm -rf /var/lib/apt/lists/*

# Habilitar corepack para pnpm
RUN corepack enable

# Definir usuário e diretório de trabalho
USER node
WORKDIR /app

# ✅ Clonar repositório OpenClaw
RUN git clone https://github.com/openclaw/openclaw.git . && \
    git checkout main

# Instalar dependências
RUN --mount=type=cache,id=openclaw-pnpm,target=/home/node/.local/share/pnpm/store,sharing=locked \
    pnpm install --frozen-lockfile

# Build do OpenClaw
RUN pnpm build

ENV NODE_ENV=production
ENV HOME=/home/node

EXPOSE 18789 18790

# ✅ Iniciar aplicação
CMD ["pnpm", "start"]
