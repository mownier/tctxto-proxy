BA=0.0.0.0:3232
DP=2121

clone:
	git clone https://github.com/improbable-eng/grpc-web.git

build:
	cd grpc-web/go/grpcwebproxy && go build && ./grpcwebproxy --run_tls_server=false --backend_addr=$(BA) --server_http_debug_port=$(DP) --allow_all_origins && cd ../../../