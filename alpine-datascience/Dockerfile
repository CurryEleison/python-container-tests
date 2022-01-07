FROM python:3.8-alpine as builder

COPY . /app
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install gcc
# for numpy gfortran
RUN apk update && apk add python3-dev gcc libc-dev musl-dev libressl-dev \
    gfortran g++ \
    zlib-dev zlib make jpeg-dev libjpeg  \
    && python -m pip install --upgrade pip

ENV LIBRARY_PATH=/lib:/usr/lib

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

# Now make the container we really need
FROM python:3.8-alpine

LABEL maintainer=petersen@temp.dk

COPY . /app
WORKDIR /app

COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

RUN pip install --no-cache /wheels/*
