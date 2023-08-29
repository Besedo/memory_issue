FROM python:3.11-slim

WORKDIR /code

COPY quick_test/requirements.txt .
COPY quick_test/main.py .
COPY quick_test/launch.sh .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt && \
    mkdir -p memory_plots

COPY locust_file.py .
COPY test.jpg .

CMD ["bash", "launch.sh"]