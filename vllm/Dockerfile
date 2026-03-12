FROM python:3.10-slim

RUN pip install --no-cache-dir vllm huggingface_hub

EXPOSE 8000

CMD ["python", "-m", "vllm.entrypoints.openai.api_server", \
     "--model", "meta-llama/Llama-2-7b-chat-hf", \
     "--port", "8000", \
     "--host", "0.0.0.0", \
     "--device", "cpu"]
