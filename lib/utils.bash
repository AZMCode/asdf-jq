#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Wrap curl to ensure that the "User-Agent" header is always set to a value
# that ensures detection of curl as the client making the request.  This
# overrides the value of the `user-agent` setting in the `.curlrc` file.
#
# N.B. The actual curl version is of no importance; also GitHub caches HTTP
# responses for some small amount of time, please bare this in mind.
curl_wrapper() {
  curl -A 'curl/1.0.0' -H 'Accept: application/json' "$@"
}
