build-macos:
	GOOS=darwin GOARCH=amd64 go build -o build/macos/tctxtopx && cd libs/grpc-web/go/grpcwebproxy && go build && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy build/macos/

build-linux:
	GOOS=linux GOARCH=amd64 go build -o build/linux/tctxtopx && cd libs/grpc-web/go/grpcwebproxy && go build && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy build/linux/

build-windows:
	GOOS=windows GOARCH=amd64 go build -o build/windows/tctxtopx.exe && cd libs/grpc-web/go/grpcwebproxy && go build -o grpcwebproxy.exe && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy.exe build/windows/

build-all: build-macos build-linux build-windows

run:
	go build -o tctxtopx && cd libs/grpc-web/go/grpcwebproxy && go build && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy . && ./tctxtopx

# for windows
run-w:
	go build -o tctxtopx.exe && cd libs/grpc-web/go/grpcwebproxy && go build && cd ../../../../ && mv libs/grpc-web/go/grpcwebproxy/grpcwebproxy . && ./tctxtopx