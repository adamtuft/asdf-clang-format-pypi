#!/usr/bin/env bash

set -euo pipefail

stacktrace() {
	# source: https://gitlab.com/kyb/autorsync/-/blob/master/utils.bash#L84
	printf "Stack trace:\n"
	local i=1 line file func
	while read -r line func file < <(caller $i); do
		printf "[%d] $file:$line in $func\n" "$i"
		((i++))
	done
}

fail() {
	printf "asdf-%s: $* \n" "${PLUGIN_NAME:-unknown}"
	stacktrace
	exit 1
}

detect_plugin_name() {
	local CURRENT_SCRIPT="${BASH_SOURCE[0]}"
	PLUGIN_ROOT="$(dirname "$(dirname "${CURRENT_SCRIPT}")")"
	if [ "${PLUGIN_NAME+x}" != x ]; then
		PLUGIN_NAME="${PLUGIN_ROOT##*/}"
	fi
}

coalesce_install_version() {
	local get_latest_version="${1:?missing argument: path to latest-stable script}"
	if [ "$ASDF_INSTALL_VERSION" = "latest" ]; then
		# shellcheck disable=SC2154
		ASDF_INSTALL_VERSION="$("$get_latest_version")"
	fi
}
