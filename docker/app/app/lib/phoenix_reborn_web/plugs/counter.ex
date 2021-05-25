defmodule PhoenixRebornWeb.Plugs.CounterPlug do
  require Logger
  use PhoenixRebornWeb.Worker.Counter
  alias PhoenixRebornWeb.Worker.Counter, as: CounterWorker

  @spec init(any) :: :ok
  def init(_) do
    :ok
  end

  @spec call(Plug.Conn.t(), any) :: Plug.Conn.t()
  def call(conn, _default) do
    # Only log when path is /dashboard
    if conn.request_path == "/dashboard" do
      # increment/0 should return :ok
      CounterWorker.increment()
      Logger.info("LiveDashboard was opened #{inspect(CounterWorker.value())} times")
    end

    conn
  end
end
