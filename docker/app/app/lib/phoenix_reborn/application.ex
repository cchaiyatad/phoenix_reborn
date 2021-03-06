defmodule PhoenixReborn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixReborn.Repo,
      # Start the Telemetry supervisor
      PhoenixRebornWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixReborn.PubSub},
      # Start the Endpoint (http/https)
      PhoenixRebornWeb.Endpoint,
      # Start a worker by calling: PhoenixReborn.Worker.start_link(arg)
      # {PhoenixReborn.Worker, arg}
      PhoenixRebornWeb.Worker.Counter
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixReborn.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixRebornWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
