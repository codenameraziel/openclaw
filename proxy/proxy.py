from datetime import datetime

@app.post("/v1/chat/completions")
async def chat_completions(request: Request):
    body = await request.json()
    model = body.get("model", "llama3:8b")
    messages = body.get("messages", [])

    ollama_payload = {
        "model": model,
        "messages": messages,
        "stream": False,
        "options": {"num_predict": 128}
    }

    resp = requests.post("http://ollama:11434/api/chat", json=ollama_payload, timeout=120)
    data = resp.json()
    content = data.get("message", {}).get("content", "")

    return {
        "id": "chatcmpl-ollama",
        "object": "chat.completion",
        "created": int(datetime.now().timestamp()),
        "model": model,
        "choices": [
            {
                "index": 0,
                "message": {"role": "assistant", "content": content},
                "finish_reason": "stop"
            }
        ],
        "usage": {
            "prompt_tokens": len(str(messages)),
            "completion_tokens": len(content.split()),
            "total_tokens": len(str(messages)) + len(content.split())
        }
    }
