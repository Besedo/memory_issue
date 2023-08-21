#!/bin/bash
set -e

load_test() {
    local api_host="$1"
    local api_port="$2"
    local num_imgs="$3"

    export API_HOST="$api_host"
    export API_PORT="$api_port"
    export NUM_IMGS="$num_imgs"

    locust -f locust_file.py -u 300 -r 10 -t 60s --headless --html report.html --logfile memory_plots/log_locust.txt

}

API_HOST="0.0.0.0"
API_PORT=8080

mprof run --include-children uvicorn main:app --host "$API_HOST" --port "$API_PORT" > memory_plots/log_api.txt &
echo "API running"  
sleep 10;

for NUM_IMGS in 10 40 80 120; do
	load_test "$API_HOST" "$API_PORT" "$NUM_IMGS"
    sleep 10
done

echo "test finished"
sleep 30;
mprof plot -o memory_plots/memory_uvicorn
cp *.dat memory_plots
echo "plot created"
