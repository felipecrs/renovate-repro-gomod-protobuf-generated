# Reproduction of Go Mod Protobuf Issue

This project demonstrates a scenario where a Go module depends on a locally generated Protobuf module.

## Structure

- `main.go`: Imports the generated protobuf module.
- `api/`: Directory for the protobuf module.

The project uses Go 1.24+ tool dependencies to manage `protoc-gen-go`.

## Reproduction Steps

1. **Initial State**: The project is cloned, but the Go code from Protobuf is not yet generated.

2. **Fail Case**:

    ```bash
    go get ./...
    ```

    This should fail because the `example.com/repro/api` package does not exist yet (no Go files in `api/`).

3. **Generate the Go Code from Protobuf**:

    ```bash
    ./api/generate.sh
    ```

    This command will:
    1. Download `protoc` from GitHub (if not already present).
    2. Unzip it to the `.protoc-install` directory.
    3. Run `protoc` using the downloaded binary and `protoc-gen-go`/`protoc-gen-go-grpc` tools managed by `go.mod`.

4. **Pass Case**:

    ```bash
    go get ./...
    ```

    This should now succeed.

### Alternative to Generate Code

To avoid having to install `protoc` and generating the code, you can also run:

```bash
api/stub.sh
```

Which creates a stub Go file in the `api/` directory, allowing the `go get ./...` command to succeed without actual code generation.
