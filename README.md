[![Shortlinks CI](https://github.com/zubans/shortlinks/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/zubans/shortlinks/actions/workflows/rubyonrails.yml)

# Rails 7 on Docker

This app demonstrates Rails 7 with PostgreSQL, import maps, turbo, stimulus and hotwire, all running in Docker.

## Features

* Rails 7
* Ruby 3
* Dockerfile and Docker Compose configuration
* PostgreSQL database
* GitHub Actions for 
  * tests
  * Rubocop for linting
* Dependabot for automated updates

## Initial setup
```
cp .env.example .env
docker compose build
docker compose run --rm web bin/rails db:setup
```

## Running the Rails app
```
docker compose up
```

## Running the Rails console
When the app is already running with `docker-compose` up, attach to the container:
```
docker compose exec web bin/rails c
```

When no container running yet, start up a new one:
```
docker compose run --rm web bin/rails c
```

## Running tests
```
docker compose run --rm web bin/rspec
```

## Updating gems
```
docker compose run --rm web bundle update
docker compose up --build
```

## Production build

```
docker build -f production.Dockerfile .
```
