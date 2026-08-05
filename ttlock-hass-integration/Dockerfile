FROM node:22-alpine

ENV LANG C.UTF-8

RUN apk update

RUN apk add --no-cache nodejs npm python3 py3-pip alpine-sdk libcap bluez bluez-dev eudev-dev dbus openrc git

RUN setcap cap_net_raw+eip $(eval readlink -f $(which node))

WORKDIR /

COPY addon /app
RUN rm -rf /app/node_modules

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

RUN cd /app && NPM_CONFIG_INCLUDE=dev npm install && npm install -g npm@latest

ENTRYPOINT ["/app/start.sh"]
