FROM pytorch/torchserve:0.8.2-cpu

USER root
WORKDIR /code

COPY test_torchserve/requirements.txt .
COPY test_torchserve/handler.py .
COPY test_torchserve/launch.sh .
COPY test_torchserve/config.properties .
COPY test_torchserve/locust.py locust_file.py

RUN pip install --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt && \
    mkdir -p memory_plots

COPY test.jpg .

CMD ["bash", "launch.sh"]