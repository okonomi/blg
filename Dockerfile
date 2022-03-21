FROM ruby:3.1.1-slim-bullseye AS base

# ENV TZ=Asia/Tokyo

# WORKDIR /app

# RUN apk add --no-cache \
#     git \
#     build-base \
#     postgresql-dev \
#     tzdata \
#     yarn \
#     bash

RUN apt update && apt install -y \
    build-essential \
    libpq-dev \
    curl \
    gnupg

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install -y yarn


FROM base AS development

# ENV BUNDLE_FORCE_RUBY_PLATFORM true

WORKDIR /app

# RUN apk add --no-cache \
#     less \
#     chromium \
#     chromium-chromedriver \
#     imagemagick
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
RUN yarn install --frozen-lockfiile

# compile assets
COPY Rakefile .
COPY bin bin
COPY config config
COPY app/assets app/assets
COPY app/javascript app/javascript
RUN bin/rails assets:precompile


FROM ruby:3.1.1-slim-bullseye AS production

# ENV BUNDLE_FROZEN true
# ENV BUNDLE_WITHOUT development test
# ENV BUNDLE_FORCE_RUBY_PLATFORM true

# ENV RAILS_ENV production
# ENV RAILS_LOG_TO_STDOUT 1
# ENV RAILS_SERVE_STATIC_FILES 1

WORKDIR /app

# RUN apk add --no-cache \
#     curl \
#     postgresql-libs \
#     tzdata \
#     imagemagick
RUN apt update && apt install -y --no-install-recommends \
    curl

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /app/public/assets /app/public/assets
COPY . .
