# Orders Now! backend & backoffice

## Get Started with the application

For local development we have a specific compose configuration in `docker-compose.yml` to run the application

Designed to run Rails in development mode:
- Uses the `Dockerfile` and `.env` files
- Creates a volume for `bundler_gems` in order not to have to re-install the gems all the time
- Mounts the source code of the project in `/app` of the container in order to have live reload
- Uses postgres as a docker service running locally

The `Dockerfile` itself has nothing more than `ruby:3.2.3-slim-bookworm` and for its correct setup it is necessary to install dependencies with `bundle install`.

### Setup env vars

The `.env` file should look like this. You can start by cloning the `.env.example` file

```
RAILS_ENV=development
RAILS_SERVE_STATIC_FILES=true

# DATABASE
DATABASE_HOST=db
DATABASE_NAME=app
POSTGRES_USER=postgres
POSTGRES_PASSWORD=root

# REDIS
REDIS_URL=redis://redis:6379/1

# EMAIL & SMTP SETTINGS
APP_HOST="http://localhost:3000"
MAIL_SENDER=""
SMTP_ADDRESS=""
SMTP_PORT=""
SMTP_USER_NAME=""
SMTP_PASSWORD=""
SMTP_AUTHENTICATION="plain"

# AWS
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_S3_REGION=""
AWS_S3_BUCKET=""
AWS_CLOUDFRONT_DISTRIBUTION_ID=""
AWS_CLOUDFRONT_DISTRIBUTION_REGION=""
CDN_HOST=""

# GOOGLE MAPS
GOOGLE_STATIC_MAP_API_KEY=""
```

### Docker setup with compose

The steps to run the local development environment are as follows:

```bash
docker compose build
docker compose run --rm --no-deps app bundle install
docker compose run --rm app bundle exec rake db:drop db:create db:migrate db:seed
docker compose up
```

### Seed file

In the `db/seed.rb` file you will find the initial dataset of the application, such as: users, locations, products, etc.

### Swagger: API Documentation

To re-generate swagger documentation based on 'spec/integration/*'

```bash
docker compose run --rm app rake rswag:specs:swaggerize
```