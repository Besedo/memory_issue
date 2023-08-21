FROM python:3.11-slim

WORKDIR /code

COPY test_hypercorn/requirements.txt .
COPY test_hypercorn/main.py .
COPY test_hypercorn/launch.sh .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt

COPY locust_file.py .
COPY test.jpg .

CMD ["bash", "./launch.sh"]