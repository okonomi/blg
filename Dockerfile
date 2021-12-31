FROM ruby:3.0.3-alpine3.13 AS base

ENV TZ=Asia/Tokyo

WORKDIR /app

RUN gem update --system
RUN apk add --no-cache \
    git \
    build-base \
    postgresql-dev \
    tzdata \
    yarn \
    bash


FROM base AS development

WORKDIR /app

RUN apk add --no-cache \
    less \
    chromium \
    chromium-chromedriver \
    postgresql-client \
    imagemagick
RUN gem install foreman

FROM base AS builder

ENV BUNDLE_FROZEN true
ENV BUNDLE_WITHOUT development test

ENV RAILS_ENV production
ENV SECRET_KEY_BASE xxx

WORKDIR /app

# install gems
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --jobs 4

# install npm packages
COPY package.json .
COPY yarn.lock .
RUN yarn install --frozen-lockfile

# compile assets
COPY Rakefile .
COPY bin bin
COPY config config
COPY app/assets app/assets
COPY app/javascript app/javascript
RUN bin/rails assets:precompile


FROM ruby:3.0.3-alpine3.13 AS production

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT 1
ENV RAILS_SERVE_STATIC_FILES 1

WORKDIR /app

RUN apk add --no-cache \
    curl \
    postgresql-libs \
    tzdata \
    imagemagick

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/public/assets /app/public/assets
COPY . .
