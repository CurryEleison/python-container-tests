FROM python:3-alpine AS builder

COPY . /app
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update && apk add python3-dev gcc musl-dev libressl-dev \
    && python -m pip install --upgrade pip

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

# Now make the container we really need
FROM python:3-alpine

LABEL maintainer=petersen@temp.dk

COPY . /app
WORKDIR /app

COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

RUN pip install --no-cache /wheels/*
