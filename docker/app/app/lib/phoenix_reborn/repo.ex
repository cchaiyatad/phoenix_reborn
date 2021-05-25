defmodule PhoenixReborn.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_reborn,
    adapter: Ecto.Adapters.Postgres
end
