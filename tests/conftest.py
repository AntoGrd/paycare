import pytest



@pytest.fixture(scope="module")
def client() -> TestClient:
    return TestClient(app)