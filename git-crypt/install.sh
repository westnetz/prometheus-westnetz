#!/bin/bash
#
# Build and tag git-crypt docker image and install wrapper script to use git-crypt on CoreOS
#
# Based on a template by BASH3 Boilerplate v2.3.0
# http://bash3boilerplate.sh/#authors
#
# The MIT License (MIT)
# Copyright (c) 2013 Kevin van Zonneveld and contributors
# You are not obligated to bundle the LICENSE file with your b3bp projects as long
# as you leave these references intact in the header comments of your source files.

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

GIT_CRYPT_TAG="git-crypt"

cd "$(dirname "$0")"
docker build -t "$GIT_CRYPT_TAG" .
mkdir -p /opt/bin
sed "s+@GIT_CRYPT_TAG@+${GIT_CRYPT_TAG}+" < wrapper.sh > /opt/bin/git-crypt
chmod +x /opt/bin/git-crypt
