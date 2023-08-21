#!/bin/bash

load_test() {
    local api_host="$1"
    local api_port="$2"
    local num_imgs="$3"
    local endpoint="$4"

    export API_HOST="$api_host"
    export API_PORT="$api_port"
    export NUM_IMGS="$num_imgs"
    export ENDPOINT="$endpoint"

    locust -f locust_file.py -u 300 -r 10 -t 60s --headless --html report.html --logfile log_locust.txt

}

API_HOST="0.0.0.0"
API_PORT=8080

mprof run --include-children uvicorn main:app --host "$API_HOST" --port "$API_PORT" > memory_plots/log_api.txt &
API_PID=$!
echo "API running with PID $API_PID"
sleep 10;

ENDPOINT="/infer_sync"
for NUM_IMGS in 10 40 80 120; do
    load_test "$API_HOST" "$API_PORT" "$NUM_IMGS" "$ENDPOINT"
    sleep 10; 
done
sleep 20;
mprof plot -o memory_plots/memory_sync_endpoint
kill -9 $API_PID

API_PORT=8081

mprof run --include-children uvicorn main:app --host "$API_HOST" --port "$API_PORT" > memory_plots/log_api.txt &
sleep 10;
echo "API running"

ENDPOINT="/infer"
for NUM_IMGS in 10 40 80 120; do
    load_test "$API_HOST" "$API_PORT" "$NUM_IMGS" "$ENDPOINT"
    sleep 10; 
done
sleep 20;
mprof plot -o memory_plots/memory_async_endpoint
cp *.dat memory_plots
echo "plots created"