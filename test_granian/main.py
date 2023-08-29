from starlette.applications import Starlette
from starlette.responses import JSONResponse
from starlette.routing import Route

async def infer(request):
    data = await request.json()
    return JSONResponse({"message": "Hello World!"})


routes = [
    Route('/infer', infer, methods=['GET', 'POST'])
]

app = Starlette(debug=True, routes=routes)