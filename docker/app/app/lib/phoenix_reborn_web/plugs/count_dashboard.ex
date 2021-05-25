defmodule PhoenixRebornWeb.Plugs.CountDashboard do
  # import Plug.Conn

  @count 0

  def init(default), do: default

  def call(conn, _default) do
    # Only log when path is /dashboard
    # TODO: Increase count value
    if conn.request_path == "/dashboard" do
      IO.puts("You opened LiveDashboard #{inspect(@count)} times")
    end

    conn
  end
end
