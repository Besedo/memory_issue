FROM python:3.11-slim

WORKDIR /code

COPY use_uvloop/requirements.txt .
COPY use_uvloop/main.py .
COPY use_uvloop/launch.sh .

RUN pip install --upgrade pip && \
    pip install --upgrade -r requirements.txt && \
    mkdir -p memory_plots

COPY locust_file.py .
COPY test.jpg .

CMD ["bash", "launch.sh"]