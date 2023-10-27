FROM python:3.8-slim

WORKDIR /code

COPY test_rayserve/requirements.txt .
COPY test_rayserve/main.py .
COPY test_rayserve/launch.sh .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt && \
    mkdir -p memory_plots

COPY locust_file.py .
COPY test.jpg .

CMD ["bash", "launch.sh"]