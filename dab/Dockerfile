ARG VERSION=latest
FROM mcr.microsoft.com/azure-databases/data-api-builder:${VERSION}
LABEL maintainer="Admir Trakic <atrakic@users.noreply.github.com>"
RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y curl ca-certificates \
    && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/*
