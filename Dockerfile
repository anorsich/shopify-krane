FROM ruby:2.6.4-alpine3.10

RUN apk update \
    && apk add \
    build-base \
    python \
    curl \
    which \
    bash

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ADD https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

ENV HOME=/config

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Basic check it works.
    kubectl version --client

RUN gem install krane -v 1.1.4

# Clean up
RUN apk del build-base
ENV HOME=/