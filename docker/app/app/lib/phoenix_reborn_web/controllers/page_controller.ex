defmodule PhoenixRebornWeb.PageController do
  use PhoenixRebornWeb, :controller
  use PhoenixRebornWeb.Worker.Counter
  alias PhoenixRebornWeb.Worker.Counter, as: CounterWorker

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html", count: CounterWorker.value())
  end
end
