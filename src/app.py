import json
from pathlib import Path

from fastapi import FastAPI

from src.jobs import BaseJob

app = FastAPI()


@app.get("/")
def read_root():
    """
    Root entry point of the app.
    :return:
    """
    return {"msg": "Hello World"}


@app.get("/jobs/{job_id}")
def read_item(job_id: str) -> BaseJob:
    """
    Endpoint to retrieve the job infos from the ID
    :param job_id: unique job ID
    :return: The job data structure
    """
    with open(
        Path(__file__).parent / "database.json", "r", encoding="UTF-8"
    ) as jobs_file:
        jobs = json.load(jobs_file)
    return jobs[job_id]


# @app.post("")
# def post_job(item_id: int, q: Union[str, None] = None):
#     return {"item_id": item_id, "q": q}
