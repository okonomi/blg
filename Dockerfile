FROM ruby:2.6.3-alpine3.9

WORKDIR /app

RUN gem install bundler -v 2.0.2
RUN apk add --update --no-cache \
    git \
    build-base \
    postgresql-dev \
    tzdata \
    yarn \
    bash
