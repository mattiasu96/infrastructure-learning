SRC_DIR		= src
TEST_DIR	= tests
CHECK_DIRS = $(SRC_DIR) $(TEST_DIR)
PYTEST_FLAGS = -vv tests

.PHONY: install
install:
	poetry run pip install --upgrade pip
	poetry install

.PHONY: format
format:
	poetry run black $(CHECK_DIRS)
	poetry run isort $(CHECK_DIRS)

.PHONY: lint
format:
	poetry run pylint -j 0 $(CHECK_DIRS)

.PHONY: type-check
format:
	poetry mypy $(CHECK_DIRS)

.PHONY: test
format:
	poetry run pytest $(TEST_DIR)


