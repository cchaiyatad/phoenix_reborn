defmodule PhoenixRebornWeb.PageController do
  use PhoenixRebornWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
