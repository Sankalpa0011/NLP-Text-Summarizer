FROM python:3.8-slim-buster

RUN apt update -y && \
    apt install -y --no-install-recommends awscli && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir accelerate transformers evaluate
COPY . /app

CMD ["python3", "app.py"]