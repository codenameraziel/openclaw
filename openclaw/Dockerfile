FROM python:3.10-slim

# Instala dependencias necessarias
RUN pip install --no-cache-dir openclaw vllm huggingface_hub tenacity httpx

EXPOSE 8080

CMD ["python", "-m", "openclaw", "serve", "--port", "8080"]
