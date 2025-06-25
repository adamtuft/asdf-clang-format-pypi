#!/usr/bin/env bash

set -euo pipefail

fail() {
	echo -e "asdf-clang-format: $*"
	exit 1
}
