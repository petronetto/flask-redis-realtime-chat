FROM python:3-alpine

RUN mkdir /app

COPY . /app

RUN apk add -U --no-cache --virtual=build-dependencies \
    gcc linux-headers musl musl-dev

RUN cd /app \
    && pip install -r requirements.txt --no-cache-dir \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/* \
    && mv /app/start.sh /start \
    && chmod +x /start

WORKDIR /app

CMD  [ "/start" ]
