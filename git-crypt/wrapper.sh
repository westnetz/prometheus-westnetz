#!/bin/sh

set -e

if [ -t 0 ]; then
    DOCKER_OPTS="-it"
else
    DOCKER_OPTS="-t"
fi

exec docker run \
        --rm \
        "${DOCKER_OPTS}" \
        -v "$(pwd):/repo" \
        -v ~/.gnupg:/root/.gnupg \
        @GIT_CRYPT_TAG@ "$@"
