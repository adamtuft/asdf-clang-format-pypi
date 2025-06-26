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
	# Detect the plugin name from the current script path.
	local CURRENT_SCRIPT="${BASH_SOURCE[0]}"
	PLUGIN_ROOT="$(dirname "$(dirname "${CURRENT_SCRIPT}")")"
	if [ "${PLUGIN_NAME+x}" != x ]; then
		PLUGIN_NAME="${PLUGIN_ROOT##*/}"
		# When added with `asdf plugin test ...` the plugin name is prefixed with `asdf-test-`
		# so remove this to detect the tool name correctly.
		PLUGIN_NAME="${PLUGIN_NAME##asdf-test-}"
	fi
}

coalesce_install_version() {
	local get_latest_version="${1:?missing argument: path to latest-stable script}"
	if [ "$ASDF_INSTALL_VERSION" = "latest" ]; then
		# shellcheck disable=SC2154
		ASDF_INSTALL_VERSION="$("$get_latest_version")"
	fi
}
