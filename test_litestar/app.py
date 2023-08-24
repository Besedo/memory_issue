from dataclasses import dataclass

from typing_extensions import Annotated

from litestar import Litestar, post
from litestar.params import Body
import json
@dataclass
class Item:
    id: int
    data: str


@post(path="/infer")
async def create_user(
    data: list[Item],
) ->int:
    images = data
    return len(images)

app = Litestar(route_handlers=[create_user])