from fastapi import FastAPI, Request
import requests
import time

app = FastAPI()

OLLAMA_URL = "http://ollama:11434/api/generate"

@app.post("/v1/chat/completions")
async def chat_completions(req: Request):
    body = await req.json()
    model = body.get("model", "llama3:8b")
    messages = body.get("messages", [])
    prompt = messages[-1]["content"] if messages else ""

    # chama Ollama
    resp = requests.post(OLLAMA_URL, json={
        "model": model,
        "prompt": prompt,
        "stream": False
    })
    ollama_json = resp.json()

    # adapta para formato OpenAI-like
    return {
        "id": "chatcmpl-001",
        "object": "chat.completion",
        "created": int(time.time()),
        "model": model,
        "choices": [
            {
                "index": 0,
                "message": {
                    "role": "assistant",
                    "content": ollama_json.get("response", "")
                },
                "finish_reason": "stop"
            }
        ]
    }
