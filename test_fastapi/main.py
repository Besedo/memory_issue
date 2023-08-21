from typing import List

from fastapi import FastAPI
from pydantic import BaseModel

class Item(BaseModel):
    id: str
    data: str

app = FastAPI()

@app.post("/infer")
async def infer(item: List[Item]):
    return len(item)
