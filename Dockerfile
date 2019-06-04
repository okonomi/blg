FROM ruby:2.6.3-alpine3.9

WORKDIR /app

RUN gem install bundler
RUN apk add --update --no-cache \
    git \
    build-base \
    postgresql-dev \
    tzdata \
    yarn
