build:
	cd ${APP_DIR} && swift build

echo-proto:
	protoc --swift_out=. --swiftgrpc_out=. Sources/Protos/echo.proto

copy-echo:
	cp ${APP_DIR}/Sources/Protos/*.swift ${APP_DIR}/Sources/EchoClient
	cp ${APP_DIR}/Sources/Protos/*.swift ${APP_DIR}/Sources/EchoServer

gen-echo-proto:
	make echo-proto
	make copy-echo

project:
	cd ${APP_DIR}
	swift package generate-xcodeproj

build-release:
	docker run -i -t -v `pwd`:/working_dir -w /working_dir \
    swift:4.2 \
    swift build --product EchoServer \
    --build-path .release \
    --configuration release

build-server:
	docker build -t echoserver -f server.Dockerfile .

run-server:
	docker rm echoServer
	docker run -d --name echoServer -p 9000:9000 echoserver

refresh:
	make build-release
	make build-server
	make run-server
