FROM python:3.12-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends --only-upgrade \
       libssl3t64 \
       openssl \
       openssl-provider-legacy \
    && rm -rf /var/lib/apt/lists/*

workdir /app

copy requirements.txt .

run pip install --no-cache-dir -r requirements.txt

copy . .

cmd ["python", "app/app.py"]





