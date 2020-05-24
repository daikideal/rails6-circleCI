#!/bin/ash
set -e

rm -f /rails6-circleCI/tmp/pids/server.pid

exec "$@"