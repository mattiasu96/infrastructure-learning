from typing import Union

from fastapi import FastAPI
from src.jobs import BaseJob

app = FastAPI()


@app.get("/")
def read_root():
    return {"msg":"Hello World"}

# @app.get("/jobs/{job}")
# def read_item(job: BaseJob):
#     return {"job_name": job.name, "salary": job.salary, "swag": job.swag}

# @app.post("")
# def post_job(item_id: int, q: Union[str, None] = None):
#     return {"item_id": item_id, "q": q}