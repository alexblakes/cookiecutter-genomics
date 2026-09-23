#!/usr/bin/env bash

function _log() {
	# If stdin is not from the terminal, consume it.
	# This prevents issues with back-to-back tees.
	# It also facilitates logging outside of a pipe.
	[[ -t 0 ]] || cat > /dev/null

	printf '[%s] (%s) %b\n' "$(date '+%F %T.%3N')" "${0##*/}" "$*"

} >&2
