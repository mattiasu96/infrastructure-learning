FROM python:3.10

# Configure Poetry
ENV POETRY_VERSION=1.4.2
ENV POETRY_HOME=/etc/poetry
ENV POETRY_VENV=/etc/poetry-venv
ENV POETRY_CACHE_DIR=/etc/.cache

# install poetry
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="$POETRY_HOME/bin:$PATH"

# sets the working directory for any of the following RUN, COPY, CMD commands
# Useful: https://stackoverflow.com/questions/55108649/what-is-app-working-directory-for-a-dockerfile
WORKDIR /app

# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at
# the path <dest>
COPY . .

RUN poetry install

CMD uvicorn src.app:app --host 0.0.0.0 --port 8000

