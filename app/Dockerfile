FROM nginx:alpine
LABEL org.opencontainers.image.description="Vanilla JS app that fetches data from API of your choice."
LABEL org.opencontainers.image.source="https://github.com/atrakic/dab-postgresql"
WORKDIR /usr/share/nginx/html

# used for healthchecks
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ENV API_URL="https://api.github.com/users/atrakic/repos"

RUN rm -rf /usr/share/nginx/html/*
COPY ./nginx.conf /etc/nginx/templates/default.conf.template
COPY ./src .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
