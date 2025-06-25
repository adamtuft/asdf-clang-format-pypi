#!/usr/bin/env bash

set -euo pipefail

fail() {
	echo -e "asdf-clang-format: $*"
	exit 1
}

coalesce_install_version() {
	if [ "$ASDF_INSTALL_VERSION" = "latest" ]; then
		# shellcheck disable=SC2154
		ASDF_INSTALL_VERSION="$("${plugin_dir}/bin/latest-stable")"
	fi
}
