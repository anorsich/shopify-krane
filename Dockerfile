FROM ruby:3.2.1-alpine3.17

RUN apk update \
    && apk add \
    build-base \
    python3 \
    curl \
    which \
    bash

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ADD https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ENV HOME=/config

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Basic check it works.
    kubectl version --client

RUN gem install krane -v 3.0.1

# Clean up
RUN apk del build-base
ENV HOME=/
