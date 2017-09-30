#!/usr/bin/env sh

gunicorn -k gevent -b 0.0.0.0:5000 --chdir /app app:app