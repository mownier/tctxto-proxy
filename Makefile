BA=0.0.0.0:3232
DP=2121

clone:
	git clone https://github.com/improbable-eng/grpc-web.git

build:
	cd grpc-web/go/grpcwebproxy && go build && cd ../../../

run:
	cd grpc-web/go/grpcwebproxy && go build && ./grpcwebproxy --run_tls_server=false --backend_addr=$(BA) --server_http_debug_port=$(DP) --allow_all_origins && cd ../../../

help:
	@echo ""
	@echo "Usage:"
	@echo "  make clone - clone the dependency"
	@echo "  make build - creates executable from the dependency"
	@echo "  make run   - run the executable"
	@echo ""
	@echo "make run BA=0.0.0.0:9090 DP=7878"
	@echo "  BA = backend addresss, default 0.0.0.0:3232"
	@echo "  DP = server http debug port, default 2121"
	@echo ""