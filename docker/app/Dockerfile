FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

COPY app/mix.exs .
COPY app/mix.lock .

RUN mkdir assets

COPY app/assets/package.json assets
COPY app/assets/package-lock.json assets

CMD mix deps.get && cd assets && npm install && cd .. && mix phx.server