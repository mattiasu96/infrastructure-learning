import os

from fastapi.testclient import TestClient

from src.app import app

client = TestClient(app)


def test_get_job():
    """
    Testing job retrieval
    :return:
    """
    print(f"porcoddio {os.getcwd()}")
    response = client.get("/jobs/1")
    assert response.status_code == 200
    # assert response.json() == {
    #     "id": "1",
    #     "name": "Data Swaglord",
    #     "salary": 1500,
    #     "swag": 9999,
    # }
