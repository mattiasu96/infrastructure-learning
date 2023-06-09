from pydantic import BaseModel

fake_db = {
    "1": {"id": "1", "name": "Data Swaglord", "salary": 1500, "swag": 9999},
    "2": {"id": "2", "name": "Data Scientist", "salary": 2000, "swag": 1},
}


class BaseJob(BaseModel):
    """
    Pydantic class for a generic job
    """

    id: str
    name: str
    salary: int
    swag: int
