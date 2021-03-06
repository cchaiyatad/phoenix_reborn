defmodule PhoenixRebornWeb.Router do
  use PhoenixRebornWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PhoenixRebornWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixRebornWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).

  # Enables LiveDashboard for release
  # if Mix.env() in [:dev, :test] do
  import Phoenix.LiveDashboard.Router
  import Plug.BasicAuth

  # Authentication
  pipeline :admins_only do
    plug(:basic_auth, username: "admin", password: "REBORN")
  end

  pipeline :count_dashboard do
    # if pass authentication increase count and log on console
    plug(PhoenixRebornWeb.Plugs.CounterPlug)
  end

  scope "/" do
    pipe_through([:browser, :admins_only, :count_dashboard])

    live_dashboard("/dashboard",
      metrics: PhoenixRebornWeb.Telemetry,
      ecto_repos: [PhoenixReborn.Repo]
    )
  end
end
