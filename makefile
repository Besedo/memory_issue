build_test_fastapi:
	docker build -t test_fastapi  -f "test_fastapi/Dockerfile" .
build_test_starlette:
	docker build -t test_starlette  -f "test_starlette/Dockerfile" .
build_test_gunicorn:
	docker build -t test_gunicorn  -f "test_gunicorn/Dockerfile" .
build_test_hypercorn:
	docker build -t test_hypercorn -f "test_hypercorn/Dockerfile" .
build_test_sync:
	docker build -t test_sync  -f "test_sync/Dockerfile" .
build_test_django_ninja:
	docker build -t test_django_ninja  -f "test_django_ninja/Dockerfile" .
build_test_sanic:
	docker build -t test_sanic  -f "test_sanic/Dockerfile" .
build_test_httptools:
	docker build -t use_httptools  -f "use_httptools/Dockerfile" .
build_test_litestar:
	docker build -t test_litestar  -f "test_litestar/Dockerfile" .

run_test_fastapi:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_fastapi:/code/memory_plots --name test_fastapi test_fastapi
run_test_starlette:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_starlette:/code/memory_plots  --name test_starlette test_starlette
run_test_gunicorn:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_gunicorn:/code/memory_plots  --name test_gunicorn test_gunicorn
run_test_hypercorn:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_hypercorn:/code/memory_plots  --name test_hypercorn test_hypercorn
run_test_sync:
	docker run -it --rm -p 8085:8080 -p 8086:8081 -v ${PWD}/test_sync:/code/memory_plots  --name test_sync test_sync
run_test_django_ninja:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_django_ninja:/code/memory_plots  --name test_django_ninja test_django_ninja
run_test_sanic:
	docker run -idt --rm -p 8085:8080 -v ${PWD}/test_sanic:/code/memory_plots --name test_sanic test_sanic
run_test_httptools:
	docker run -idt --rm -p 8085:8080 -v ${PWD}/use_httptools:/code/memory_plots --name use_httptools use_httptools
run_test_litestar:
	docker run -idt --rm -p 8085:8080 -v ${PWD}/test_litestar:/code/memory_plots --name test_litestar test_litestar