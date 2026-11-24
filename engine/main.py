from fastapi import FastAPI
from pydantic import BaseModel, Field
app=FastAPI(title='StreamSphere recommendations')
class Item(BaseModel):
    id:int
    category:str
    popularity:int=Field(ge=0)
class Request(BaseModel):
    catalog:list[Item]
    history:list[str]=[]
def rank(data):
    return sorted(data.catalog,key=lambda x:(data.history.count(x.category),x.popularity,-x.id),reverse=True)
@app.get('/health')
def health():return {'ok':True}
@app.post('/recommend')
def recommend(data:Request):return rank(data)
