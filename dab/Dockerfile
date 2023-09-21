ARG VERSION=latest
FROM mcr.microsoft.com/azure-databases/data-api-builder:${VERSION}
LABEL org.opencontainers.image.description="Data Api Builder with curl"
LABEL org.opencontainers.image.source="https://github.com/atrakic/dab-postgresql"
RUN apt-get update && apt-get install -y curl && apt-get clean
