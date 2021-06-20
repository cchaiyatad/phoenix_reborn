# Phoenix Reborn

This project is a part of [Phoenix web application challenge](https://github.com/opn-ooo/challenges/tree/master/challenge-phoenix)

## Goal

1. Build a web application using a Phoenix Framework and run at localhost:4000
2. Display Live Dashboard with  OS information and Database metrics
3. An authentication system on top of the live dashboard
4. Count how many times the live dashboard page is hit. Persist the counter in memory. And print page hit counter into a console when live dashboard path is hit.
5. Typespec
6. A docker-compose file
7. A Dockerfile for production release

## How to run

``` text
For live dashboard authentication
username: admin
password: REBORN
```

### For develop

#### With docker compose

``` bash
# 1. Change directory
cd <project_path>/docker/app/

# 2. Run docker-compose
docker compose up

# 3. Now we can enter the website from localhost:4000 and we can edit the code without create new container
```

#### Without docker compose

``` bash
# 1. Create docker container of postgres database
docker run --name phoenix-postgres \
    -e POSTGRES_PASSWORD=password \
    -e POSTGRES_DB=phoenix_reborn_dev \
    -p 5432:5432 -d postgres:13.3

# 2. Change directory
cd <project_path>/docker/app/app

# 3. Change db hostname config
# in <project_path>/docker/app/app/config/dev.exs change hostname from 'db' to 'localhost'

# 4. Start server
mix phx.server

# 5. Now we can enter the website from localhost:4000
```

### For release

``` bash
# 1. Change directory
cd <project_path>/docker/app/release

# 2. Edit variable in run.sh

# 3. Change url of release in <project_path>/docker/app/app/config/prod.exs

# 4. Execute run.sh
./run.sh
```

## What I learned so far

- Elixir/Erlang [(Ref)](https://elixir-lang.org/getting-started/introduction.html)
- Phoenix Framwork [(Ref:Hello World)](https://hexdocs.pm/phoenix/up_and_running.html) [(Ref:Directory)](https://hexdocs.pm/phoenix/directory_structure.html)
  - Edit CSS/static image
  - Module Plug [(Ref)](https://hexdocs.pm/phoenix/plug.html#module-plugs)
  - Controller parameter [(Ref:Render)](https://hexdocs.pm/phoenix/controllers.html#rendering)
  - Views and Template [(Ref)](https://hexdocs.pm/phoenix/views.html)
  - Agent [(Ref)](https://hexdocs.pm/elixir/1.12/Agent.html)
  - Live Dashboard [(Ref)](https://hexdocs.pm/phoenix_live_dashboard/Phoenix.LiveDashboard.html) [(Ref:OS data)](https://hexdocs.pm/phoenix_live_dashboard/os_mon.html) [(Ref: DB info)](https://hexdocs.pm/phoenix_live_dashboard/ecto_stats.html#content)
  - Logger [(Ref)](https://hexdocs.pm/logger/Logger.html)
- Docker-compose for development [(Ref)](https://dev.to/hlappa/development-environment-for-elixir-phoenix-with-docker-and-docker-compose-2g17
)
- DockerFile for production release [(Ref:Dockerfile)](https://hexdocs.pm/phoenix/deployment.html#handling-of-your-application-secrets) [(Ref:hostname)](https://hexdocs.pm/phoenix/heroku.html#making-our-project-ready-for-heroku)
