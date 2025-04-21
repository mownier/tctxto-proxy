build-macos:
	GOOS=darwin GOARCH=amd64 go build -o build/macos/tctxto && cd libs/grpc-web/go/grpcwebproxy && go build && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy build/macos/

build-linux:
	GOOS=linux GOARCH=amd64 go build -o build/linux/tctxto && cd libs/grpc-web/go/grpcwebproxy && go build && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy build/linux/

build-windows:
	GOOS=windows GOARCH=amd64 go build -o build/windows/tctxto.exe && cd libs/grpc-web/go/grpcwebproxy && go build -o grpcwebproxy.exe && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy.exe build/windows/

build-all: build-macos build-linux build-windows

run:
	go build -o build/snapshot/tctxto && cd libs/grpc-web/go/grpcwebproxy && go build && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy build/snapshot/ && cd build/snapshot && ./tctxto

# for windows
run-w:
	go build -o build/snapshot/tctxto.exe && cd libs/grpc-web/go/grpcwebproxy && go build -o grpcwebproxy.exe && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy.exe build/snapshot/ && cd build/snapshot && ./tctxto.exe