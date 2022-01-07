FROM python:3.9-slim as builder

COPY . /app
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install gcc, convert Pipfile.lock into a requirements.txt
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc \
    && python -m pip install --upgrade pip

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels -r requirements.txt

# Now make the container we really need
FROM python:3.9-slim

LABEL maintainer=petersen@temp.dk

COPY . /app
WORKDIR /app

COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .

RUN pip install --no-cache /wheels/*

# Maybe later...
# RUN addgroup --system app && adduser --system --group app
# USER app

