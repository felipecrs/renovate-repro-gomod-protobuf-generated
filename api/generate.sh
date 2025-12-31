#!/bin/sh

set -e

PROTOC_VERSION="33.2"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$SCRIPT_DIR"

PROTOC_DIR="$PWD/.protoc-install"

if [ ! -x "$PROTOC_DIR/bin/protoc" ]; then
    mkdir -p "$PROTOC_DIR"
    curl -fsSL -o "$PROTOC_DIR/protoc.zip" "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip"
    unzip -qo "$PROTOC_DIR/protoc.zip" bin/protoc -d "$PROTOC_DIR"
    rm -f "$PROTOC_DIR/protoc.zip"
fi

PROTOC_GEN_GO=$(go tool -n protoc-gen-go)
PROTOC_GEN_GO_DIR=$(dirname "$PROTOC_GEN_GO")

PROTOC_GEN_GO_GRPC=$(go tool -n protoc-gen-go-grpc)
PROTOC_GEN_GO_GRPC_DIR=$(dirname "$PROTOC_GEN_GO_GRPC")

export PATH="$TOOLS_DIR/bin:$PROTOC_GEN_GO_DIR:$PROTOC_GEN_GO_GRPC_DIR:$PATH"

exec protoc \
    --go_out=. --go_opt=paths=source_relative \
    --go-grpc_out=. --go-grpc_opt=paths=source_relative \
    api.proto
