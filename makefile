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
	docker build -t test_httptools  -f "test_httptools/Dockerfile" .
build_test_uvloop:
	docker build -t test_uvloop  -f "test_uvloop/Dockerfile" .
build_test_litestar:
	docker build -t test_litestar  -f "test_litestar/Dockerfile" .
build_test_granian:
	docker build -t test_granian  -f "test_granian/Dockerfile" .
build_test_flask:
	docker build -t test_flask  -f "test_flask/Dockerfile" .
build_quick_test:
	docker build -t quick_test  -f "quick_test/Dockerfile" .
build_test_memray:
	docker build -t test_memray  -f "test_memray/Dockerfile" .

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
	docker run -idt --rm -p 8085:8080 -v ${PWD}/test_httptools:/code/memory_plots --name test_httptools test_httptools
run_test_uvloop:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_uvloop:/code/memory_plots --name test_uvloop test_uvloop
run_test_litestar:
	docker run -idt --rm -p 8085:8080 -v ${PWD}/test_litestar:/code/memory_plots --name test_litestar test_litestar
run_test_granian:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_granian:/code/memory_plots --name test_granian test_granian
run_test_flask:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_flask:/code/memory_plots --name test_flask test_flask
run_quick_test:
	docker run -idt --rm -p 8085:8080 -v ${PWD}/quick_test:/code/memory_plots --name quick_test quick_test
run_test_memray:
	docker run -it --rm -p 8085:8080 -v ${PWD}/test_memray:/code/memory_plots --name test_memray test_memray
