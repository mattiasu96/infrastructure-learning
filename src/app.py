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
    return {"msg": "Welcome to the meme job posting"}


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


@app.post("/jobs/")
def post_job(job: BaseJob) -> BaseJob:
    """
    API to post a new job role to the database
    :param job: the desired job to be added
    :return: the posted job
    """
    with open(
        Path(__file__).parent / "database.json", "r", encoding="UTF-8"
    ) as jobs_file:
        jobs = json.load(jobs_file)

    max_id = int(max(jobs.keys()))
    new_id = max_id + 1

    jobs[new_id] = job.dict()

    with open(
        Path(__file__).parent / "database.json", "w", encoding="UTF-8"
    ) as jobs_file:
        json.dump(jobs, jobs_file)

    return job
