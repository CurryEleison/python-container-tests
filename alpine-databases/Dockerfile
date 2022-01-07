FROM python:3.9-alpine as builder

COPY . /app
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install gcc, convert Pipfile.lock into a requirements.txt
# for pymssql install freetds-dev libressl-dev (or openssl-dev)
# for psycopg2 install postgresql-dev
RUN apk update && apk add python3-dev gcc g++ libc-dev \
     freetds-dev libressl-dev \
     postgresql-dev \
    && python -m pip install --upgrade pip

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

# Now make the container we really need
FROM python:3.9-alpine

LABEL maintainer=petersen@temp.dk

COPY . /app
WORKDIR /app

COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

RUN pip install --no-cache /wheels/*
