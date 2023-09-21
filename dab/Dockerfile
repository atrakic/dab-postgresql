ARG VERSION=latest
FROM mcr.microsoft.com/azure-databases/data-api-builder:${VERSION}
LABEL maintainer="Admir Trakic <atrakic@users.noreply.github.com>"
RUN apt-get update && apt-get install -y curl && apt-get clean
