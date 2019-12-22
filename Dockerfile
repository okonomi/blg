FROM ruby:2.6.5-alpine3.10 AS base

WORKDIR /app

RUN gem update --system 3.1.2
RUN apk add --no-cache \
    git \
    build-base \
    postgresql-dev \
    tzdata \
    yarn \
    bash


FROM base AS development

WORKDIR /app


FROM base AS builder

ENV RAILS_ENV production
ARG GITHUB_OAUTH_CLIENT_KEY
ARG GITHUB_OAUTH_CLIENT_SECRET
ARG SECRET_KEY_BASE

WORKDIR /app

# install gems
RUN bundle config set frozen 'true'
RUN bundle config set without 'development test'
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
COPY .browserslistrc .
COPY postcss.config.js .
COPY babel.config.js .
COPY config config
COPY app/assets app/assets
COPY app/javascript app/javascript
RUN bin/rails assets:precompile


FROM ruby:2.6.5-alpine3.10 AS production

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT 1
ENV RAILS_SERVE_STATIC_FILES 1

WORKDIR /app

RUN apk add --no-cache \
    postgresql-libs \
    tzdata

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/public/assets /app/public/assets
COPY --from=builder /app/public/packs /app/public/packs
COPY . .
