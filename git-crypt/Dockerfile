#
# Based on the outdated dockerfile at https://github.com/lukebond/docker-git-crypt
#

FROM alpine:3.9@sha256:28ef97b8686a0b5399129e9b763d5b7e5ff03576aa5580d6f4182a49c5fe1913

ENV GIT_CRYPT_VERSION 0.6.0
ENV GIT_CRYPT_CHECKSUM 777c0c7aadbbc758b69aff1339ca61697011ef7b92f1d1ee9518a8ee7702bb78

RUN apk --update --no-cache add \
   bash \
   curl \
   git \
   g++ \
   gnupg \
   make \
   openssh \
   openssl \
   openssl-dev

RUN cd /var/tmp \
    && curl -fSsL https://github.com/AGWA/git-crypt/archive/$GIT_CRYPT_VERSION.tar.gz \
            -o git-crypt.tar.gz \
    && echo "$GIT_CRYPT_CHECKSUM  git-crypt.tar.gz" | sha256sum -c - \
    && tar xzf git-crypt.tar.gz \
    && cd git-crypt-$GIT_CRYPT_VERSION \
    && make \
    && make install PREFIX=/usr/local \
    && cd .. \
    && rm -rf *

WORKDIR /repo
ENTRYPOINT ["/usr/local/bin/git-crypt"]
