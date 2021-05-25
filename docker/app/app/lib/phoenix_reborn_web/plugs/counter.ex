defmodule PhoenixRebornWeb.Plugs.CounterPlug do
  # import Plug.Conn
  use PhoenixRebornWeb.Worker.Counter
  alias PhoenixRebornWeb.Worker.Counter, as: CounterWorker

  @spec init(any) :: :ok
  def init(_) do
    :ok
  end

  def call(conn, _default) do
    # Only log when path is /dashboard
    if conn.request_path == "/dashboard" do
      # increment/0 should return :ok
      CounterWorker.increment()
      IO.puts("LiveDashboard was opened #{inspect(CounterWorker.value())} times")
    end

    conn
  end
end
