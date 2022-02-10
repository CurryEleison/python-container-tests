FROM python:3.9-slim as base

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install gcc, convert Pipfile.lock into a requirements.txt
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --no-install-recommends gcc \
    && python -m pip install --upgrade pip \
    && pip install pipenv \
    && addgroup --system app && adduser --system --group app \
    && chown -R app /app/

USER app
COPY --chown=app . .

# Test image
FROM base as test

WORKDIR /app
USER app

RUN pipenv install --dev

# Can run pylama to prevent builds if linting isn't perfect enough
# RUN pipenv run pylama
# But in this case I want to demo a test action

# Using string syntax because we want a shell to support the &&
CMD pipenv run pylama && pipenv run pytest --junitxml=test-reports/pytest.xml

# Builder image to create wheels for production
FROM base as builder

WORKDIR /app
USER app

RUN pipenv lock -r > requirements.txt \
    && pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

# Now make the production container
FROM python:3.9-slim

LABEL maintainer=petersen@temp.dk

COPY myapp /app/myapp
COPY main.py /app
COPY LICENSE /app
COPY README.md /app
WORKDIR /app

COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && pip install --no-cache /wheels/*

CMD ["python", "main.py"]
