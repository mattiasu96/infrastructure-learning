FROM python:3.10

# Configure Poetry
ENV POETRY_VERSION=1.4.2
ENV POETRY_HOME=/opt/poetry
ENV POETRY_CACHE_DIR=/opt/.cache

# install poetry
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && curl -sSL https://install.python-poetry.org | POETRY_HOME=$POETRY_HOME POETRY_VERSION=$POETRY_VERSION python3 -

ENV PATH="$POETRY_HOME/bin:$PATH"

# sets the working directory for any of the following RUN, COPY, CMD commands
# Useful: https://stackoverflow.com/questions/55108649/what-is-app-working-directory-for-a-dockerfile
WORKDIR /app

# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at
# the path <dest>
COPY ./poetry.lock poetry.lock
COPY ./pyproject.toml pyproject.toml
COPY ./Makefile Makefile
COPY ./src ./src

# So long story short, I can disable the virtualenv creation and install the packages at docker system level
# this is ok in docker because theoretically I should be working with isolated projects/microservices, so docker is doing the job
# of isolating stuff. On the other hand, if I am working with multistage builds, it might be handy to have local virtualenvs
# in that case; to do so, I have to enable in-project virtualenvs + run the command through poetry (so that automatically
# activates the virtualenv)

# RUN poetry config virtualenvs.in-project true
RUN poetry config virtualenvs.create false
RUN make install

# CMD poetry run uvicorn src.app:app --host 0.0.0.0 --port 8000
CMD uvicorn src.app:app --host 0.0.0.0 --port 8000


