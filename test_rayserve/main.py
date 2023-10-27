from starlette.requests import Request

import ray
from ray import serve

@serve.deployment(num_replicas=1, route_prefix="/infer", ray_actor_options = {"num_cpus": 1})
class Counter:
    async def __call__(self, http_request: Request) -> str:
        item: list = await http_request.json()
        return "Hello World"

app = Counter.bind()