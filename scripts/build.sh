#!/usr/bin/env bash
set -euo pipefail

arch=${EPICS_HOST_ARCH:-$(uname -m)}
root=$(cd "$(dirname "$0")/.." && pwd)

cmake -S "$root" -B "$root/build/$arch" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$root/install/$arch" \
    "$@"
cmake --build "$root/build/$arch" --parallel
cmake --install "$root/build/$arch"
