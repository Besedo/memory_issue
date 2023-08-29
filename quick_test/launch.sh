#!/bin/bash
set -e

load_test() {
    local api_host="$1"
    local api_port="$2"
    local num_imgs="$3"

    export API_HOST="$api_host"
    export API_PORT="$api_port"
    export NUM_IMGS="$num_imgs"

    locust -f locust_file.py -u 300 -r 300 -t 10s --headless --html report.html --logfile memory_plots/log_locust.txt

}

API_HOST="0.0.0.0"
API_PORT=8080

mprof run --include-children uvicorn main:app --host "$API_HOST" --port "$API_PORT" > memory_plots/log_api.txt &
echo "API running"  
sleep 10;
NUM_IMGS=120
load_test "$API_HOST" "$API_PORT" "$NUM_IMGS"

echo "test finished"
sleep 30;
mprof plot -o memory_plots/memory_uvicorn
cp *.dat memory_plots
echo "plot created"
