FROM python:3.11-slim

WORKDIR /code

COPY test_uvloop/requirements.txt .
COPY test_uvloop/main.py .
COPY test_uvloop/launch.sh .

RUN pip install --upgrade pip && \
    pip install --upgrade -r requirements.txt && \
    mkdir -p memory_plots

COPY locust_file.py .
COPY test.jpg .

CMD ["bash", "launch.sh"]