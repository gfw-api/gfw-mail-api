FROM node:20.4-alpine3.18
MAINTAINER info@vizzuality.com

ENV NAME gfw-mail-api
ENV USER microservice

RUN addgroup $USER && adduser -s /bin/bash -D -G $USER $USER

RUN apk update && apk upgrade && \
    apk add --no-cache --update bash git openssh python3 build-base

RUN yarn global add grunt-cli bunyan

RUN mkdir -p /opt/$NAME
COPY package.json /opt/$NAME/package.json
COPY yarn.lock /opt/$NAME/yarn.lock
COPY tsconfig.json /opt/$NAME/tsconfig.json
RUN cd /opt/$NAME && yarn

COPY entrypoint.sh /opt/$NAME/entrypoint.sh
COPY config /opt/$NAME/config
COPY src /opt/$NAME/src
COPY test /opt/$NAME/test

WORKDIR /opt/$NAME

# Tell Docker we are going to use this ports
EXPOSE 3500
USER $USER

ENTRYPOINT ["./entrypoint.sh"]
