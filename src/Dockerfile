ARG VERSION=latest

FROM nginx:${VERSION}
LABEL maintainer="Admir Trakic <atrakic@users.noreply.github.com>"
RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y curl ca-certificates jq gettext \
    && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY site ./
COPY --chmod=0755 fetch-api-data.sh /docker-entrypoint.d/99-fetch-api-data.sh
