from pydantic import BaseModel, Field
from typing import Optional, List

class ItemBase(BaseModel):
    name: str = Field(..., example="Laptop")
    description: str = Field(..., example="A high-performance laptop")

class ItemCreate(ItemBase):
    pass

class Item(ItemBase):
    id: int = Field(..., example=1)

    class Config:
        orm_mode = True

class ItemUpdate(ItemBase):
    name: Optional[str] = Field(None, example="Updated Laptop")
    description: Optional[str] = Field(None, example="An updated high-performance laptop")

class ItemList(BaseModel):
    items: List[Item]

class Message(BaseModel):
    message: str = Field(..., example="Operation successful")