from sanic import Sanic, response
import asyncio
app = Sanic("MyHelloWorldApp")

@app.post("/infer")
async def infer(request):
    data = request.json
    await asyncio.sleep(0.1)
    return response.json("done")
