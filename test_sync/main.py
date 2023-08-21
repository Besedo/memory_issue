from starlette.applications import Starlette
from starlette.responses import JSONResponse
from starlette.routing import Route
from anyio.lowlevel import RunVar
from anyio import CapacityLimiter


async def infer(request):
    data = await request.json()
    return JSONResponse({"message": "Hello World!"})

def infer_sync(request):
    data = request.json()
    return JSONResponse({"message": "Hello World!"})

routes = [
    Route('/infer', endpoint=infer, methods=['GET', 'POST']),
    Route('/infer_sync', endpoint=infer_sync, methods=['GET', 'POST'])
]

app = Starlette(debug=True, routes=routes)
@app.on_event("startup")
def startup():
    RunVar("_default_thread_limiter").set(CapacityLimiter(1))