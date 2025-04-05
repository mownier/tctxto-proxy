BA=localhost:3232
DP=2121
AO=

clone:
	git clone https://github.com/improbable-eng/grpc-web.git

build:
	cd grpc-web/go/grpcwebproxy && go build && cd ../../../

run:
	cd grpc-web/go/grpcwebproxy && go build && ./grpcwebproxy --run_tls_server=false --backend_addr=$(BA) --server_http_debug_port=$(DP) --allowed_origins=$(AO) && cd ../../../

help:
	@echo ""
	@echo "Usage:"
	@echo "  make clone - clone the dependency"
	@echo "  make build - creates executable from the dependency"
	@echo "  make run   - run the executable"
	@echo ""
	@echo "make run BA=0.0.0.0:9090 DP=7878 AO=http://localhost:2323"
	@echo "  BA = backend addresss, default 0.0.0.0:3232"
	@echo "  DP = server http debug port, default 2121"
	@echo "  AO = allowed origins, any urls that want to connect, comma separated, must be set"
	@echo ""