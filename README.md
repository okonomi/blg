# Blg

"Blg" is tiny blog made with Rails.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Local

Setup:

- `$ cp .env.example .env`
- `$ bin/setup`

Run:

- `$ bin/rails s`

## Docker

Setup:

- `$ cp .env.example .env`
- `$ docker-compose build`
- `$ docker-compose run --rm web bin/setup`

Run:

- `$ docker-compose up -d`
