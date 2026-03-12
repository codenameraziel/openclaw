FROM python:3.10-slim

# Instala dependências do OpenClaw
RUN pip install --no-cache-dir openclaw

# Porta interna padrão
EXPOSE 8080

# Usa python -m openclaw para garantir que funciona
CMD ["python", "-m", "openclaw", "serve", "--port", "8080"]
