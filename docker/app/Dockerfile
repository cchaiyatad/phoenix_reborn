FROM elixir:1.9.0-alpine AS build

# Define Variables
ARG username="postgres"
ARG password="password"
ARG database="phoenix_reborn_dev"
ARG hostname="db:5432"
ARG secret_key="Q7L8D8/bmWl81fYNw93guQAJZgOyDbB4nBX5QcHEh4nTmRmx1faHJ8Ob5oS6grPF"


# install build dependencies
RUN apk add --no-cache build-base npm git python

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod
ENV DATABASE_URL=postgres://$username:$password@$hostname/$database
ENV SECRET_KEY_BASE=$secret_key

# install mix dependencies
COPY app/mix.exs app/mix.lock ./
COPY app/config config
RUN mix do deps.get, deps.compile

# build assets
COPY app/assets/package.json app/assets/package-lock.json ./assets/
RUN npm --prefix ./assets ci --progress=false --no-audit --loglevel=error

COPY app/priv priv
COPY app/assets assets
RUN npm run --prefix ./assets deploy
RUN mix phx.digest

# compile and build release
COPY app/lib lib
# uncomment COPY if rel/ exists
# COPY rel rel
RUN mix do compile, release

# prepare release image
FROM alpine:3.9 AS app
RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/phoenix_reborn ./

ENV HOME=/app

CMD ["bin/phoenix_reborn", "start"]