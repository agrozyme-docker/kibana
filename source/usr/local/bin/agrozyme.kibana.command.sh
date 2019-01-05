#!/bin/bash
set -euo pipefail

function main() {
  agrozyme.alpine.function.sh change_core
  chown -R core:core /var/lib/kibana /var/log/kibana /usr/share/kibana/optimize /usr/share/kibana/plugins
  exec su-exec core /usr/share/kibana/bin/kibana
}

main "$@"
