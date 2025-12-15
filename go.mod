module example.com/repro

go 1.25

replace example.com/repro/api => ./api

require (
	example.com/repro/api v0.0.0
	github.com/pkg/errors v0.8.1
)

require google.golang.org/protobuf v1.36.0 // indirect
