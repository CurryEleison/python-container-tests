FROM python:3.9-slim as builder

WORKDIR /app
COPY Pipfile.lock /app/Pipfile.lock

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc \
    && python -m pip install --upgrade pip \
    && pip install pipfile-requirements \
    && pipfile2req > requirements.txt

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt


FROM python:3.9-slim

LABEL maintainer=petersen@temp.dk

COPY . /app
WORKDIR /app

COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

RUN pip install --no-cache /wheels/*

# RUN addgroup --system app && adduser --system --group app
# USER app

