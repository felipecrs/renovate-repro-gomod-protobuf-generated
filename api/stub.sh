#!/bin/sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$SCRIPT_DIR"

tee stub.pb.go <<'EOF'
package api

import (
    protobuf "google.golang.org/protobuf"
    grpc "google.golang.org/grpc"
)
EOF
