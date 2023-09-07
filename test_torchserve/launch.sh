#!/bin/bash
set -e

mkdir -p model_store
mkdir -p memory_plots

torch-model-archiver --model-name doesntmatter --export-path model_store --version 1.0  --handler handler.py --force

mprof run --include-children torchserve --start --model-store model_store --models doesntmatter=doesntmatter.mar --foreground --ts-config config.properties > memory_plots/log_api.txt &
echo "API running"  
sleep 10;

# # memray
# memray run --native -o app.bin -m torchserve --start --model-store model_store --models doesntmatter=doesntmatter.mar --foreground --ts-config config.properties

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
API_PORT=8888

for NUM_IMGS in 10 40 80 120; do
	load_test "$API_HOST" "$API_PORT" "$NUM_IMGS"
    sleep 10
done

echo "test finished"
sleep 30;
mprof plot -o memory_plots/memory_torchserve
cp report.html memory_plots
cp *.dat memory_plots
echo "plot created"
