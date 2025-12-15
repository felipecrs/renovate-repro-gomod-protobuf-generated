# Reproduction of Go Mod Protobuf Issue

This project demonstrates a scenario where a Go module depends on a locally generated Protobuf module.

## Structure

- `go.mod`: Root module.
- `main.go`: Imports the generated code and `github.com/pkg/errors`.
- `api/`: Directory for the generated module.
  - `go.mod`: Module definition for the generated code.
  - `api.proto`: Protobuf definition.

## Reproduction Steps

1.  **Initial State**: The project is set up, but the Go code from Protobuf is not yet generated.

2.  **Fail Case**: Run `go get ./...`.

    ```bash
    go get ./...
    ```

    This should fail because the `example.com/repro/api` package does not exist yet (no Go files in `api/`).

3.  **Generate Code**: Run `protoc` to generate the Go code.

    ```bash
    export PATH=$PATH:$(go env GOPATH)/bin
    protoc --go_out=. --go_opt=paths=source_relative api/api.proto
    ```

4.  **Pass Case**: Run `go get ./...` again.

    ```bash
    go get ./...
    ```

    This should now succeed.
