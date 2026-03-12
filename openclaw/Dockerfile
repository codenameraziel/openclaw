FROM python:3.10-slim

# Instala dependencias do OpenClaw
RUN pip install --no-cache-dir openclaw

EXPOSE 8080

CMD ["openclaw", "serve", "--port", "8080"]
