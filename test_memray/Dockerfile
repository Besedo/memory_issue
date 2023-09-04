FROM python:3.11-slim

WORKDIR /code

COPY test_memray/requirements.txt .
COPY test_memray/main.py .
COPY test_memray/launch.sh .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt && \
    mkdir -p memory_plots

COPY locust_file.py .
COPY test.jpg .

CMD ["bash", "launch.sh"]