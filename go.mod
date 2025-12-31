module example.com/repro

go 1.25

tool google.golang.org/protobuf/cmd/protoc-gen-go

tool google.golang.org/grpc/cmd/protoc-gen-go-grpc

require (
	github.com/pkg/errors v0.8.1
	google.golang.org/grpc v1.78.0
	google.golang.org/protobuf v1.36.11
)

require (
	golang.org/x/net v0.47.0 // indirect
	golang.org/x/sys v0.38.0 // indirect
	golang.org/x/text v0.31.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20251029180050-ab9386a59fda // indirect
	google.golang.org/grpc/cmd/protoc-gen-go-grpc v1.6.0 // indirect
)
