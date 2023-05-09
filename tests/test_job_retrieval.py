from fastapi.testclient import TestClient

from src.app import app

client = TestClient(app)


def test_get_job():
    """
    Testing job retrieval
    :return:
    """
    response = client.get("/jobs/1")
    assert response.status_code == 200
    assert response.json() == {
        "id": "1",
        "name": "Data Swaglord",
        "salary": 1500,
        "swag": 9999,
    }


def test_post_job():
    """
    Testing job retrieval
    :return:
    """
    job = {
        "id": "3",
        "name": "Swordman",
        "salary": 100000,
        "swag": 619,
    }

    response = client.post("/jobs/", json=job)
    assert response.status_code == 200
