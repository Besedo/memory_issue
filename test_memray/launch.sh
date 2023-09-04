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


# `PYTHONMALLOC=malloc`
# https://bloomberg.github.io/memray/python_allocators.html
# Note that the Python allocator doesn't necessarily release memory to the system when Python objects are deallocated 
# and these can still appear as "leaks". If you want to exclude these, you can run your application with the `PYTHONMALLOC=malloc` environment variable set.

# --native
# https://bloomberg.github.io/memray/native_mode.html

PYTHONMALLOC=malloc memray run --native -o app.bin -m uvicorn main:app --workers 1 --host "$API_HOST" --port "$API_PORT" > memory_plots/log_api.txt &
echo "API running"  
sleep 10;

for NUM_IMGS in 10 40 80 120; do
	load_test "$API_HOST" "$API_PORT" "$NUM_IMGS"
    sleep 10
done

echo "test finished"
sleep 30;

# --temporal
memray flamegraph app.bin --leak -o memory_plots/memory_memray.html
cp *.bin memory_plots
echo "data ploted"
