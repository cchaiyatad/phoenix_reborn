defmodule PhoenixRebornWeb.Worker.Counter do
  use Agent

  @spec __using__(any) :: :ok
  def __using__(_) do
    :ok
  end

  @spec start_link(any) :: {:error, any} | {:ok, pid}
  def start_link(_) do
    Agent.start_link(fn -> %{value: 0} end, name: __MODULE__)
  end

  @spec value :: integer()
  def value() do
    Agent.get(__MODULE__, fn state -> state.value end)
  end

  @spec increment :: :ok
  def increment() do
    Agent.update(__MODULE__, fn state -> %{value: state.value + 1} end)
  end
end
