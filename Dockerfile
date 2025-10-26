

FROM python:3.10-slim

RUN  mkdir -p /app

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y \
    build-essential \
    apt-utils \
    bash \
    curl \
    default-libmysqlclient-dev \
    libcairo2-dev \
    libgirepository1.0-dev \
    gir1.2-pango-1.0 \
    libssl-dev \
    python3-venv \
    python3-setuptools \
    python3-wheel \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirement.txt

RUN chmod +x entrypoint.sh

ENTRYPOINT  ["bash", "./entrypoint.sh"]





