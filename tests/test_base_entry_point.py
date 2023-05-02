from fastapi.testclient import TestClient

from src.app import app

client = TestClient(app)


def test_base_entry_point():
    """
    Tests base entry point
    :return: None
    """
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "Hello World"}
