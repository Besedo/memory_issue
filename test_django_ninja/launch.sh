#!/bin/bash
set -e
ls
load_test() {
    local api_host="$1"
    local api_port="$2"
    local num_imgs="$3"

    export API_HOST="$api_host"
    export API_PORT="$api_port"
    export NUM_IMGS="$num_imgs"

    locust -f ./locust_file.py -u 300 -r 10 -t 60s --headless --html report.html --logfile memory_plots/log_locust.txt
}

API_HOST="0.0.0.0"
API_PORT=8080

cd apidemo;
mprof run --include-children python manage.py runserver "$API_HOST:$API_PORT" &
cd ..;

sleep 10;
echo "API running"  

for NUM_IMGS in 10 40 80 120; do
	load_test "$API_HOST" "$API_PORT" "$NUM_IMGS"
    sleep 10
done

echo "Test finished"
sleep 30;
cd apidemo;
mprof plot -o ../memory_plots/memory_django_ninja
cp *.dat ../memory_plots
echo "Plot created"