from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional

app = FastAPI()

# In-memory database
items = []

class Item(BaseModel):
    id: Optional[int] = None
    name: str
    description: str

@app.get("/")
async def read_root():
    return {"message": "Welcome to the FastAPI Microservice"}

@app.get("/items", response_model=List[Item])
async def read_items():
    return items

@app.get("/items/{item_id}", response_model=Item)
async def read_item(item_id: int):
    item = next((item for item in items if item.id == item_id), None)
    if item is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return item

@app.post("/items", response_model=Item)
async def create_item(item: Item):
    item.id = len(items) + 1
    items.append(item)
    return item

@app.put("/items/{item_id}", response_model=Item)
async def update_item(item_id: int, item: Item):
    index = next((index for index, i in enumerate(items) if i.id == item_id), None)
    if index is None:
        raise HTTPException(status_code=404, detail="Item not found")
    items[index] = item
    item.id = item_id
    return item

@app.delete("/items/{item_id}")
async def delete_item(item_id: int):
    index = next((index for index, item in enumerate(items) if item.id == item_id), None)
    if index is None:
        raise HTTPException(status_code=404, detail="Item not found")
    items.pop(index)
    return {"message": "Item deleted successfully"}