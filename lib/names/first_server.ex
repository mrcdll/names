defmodule Names.FirstServer do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(state) do
    sups =
      Enum.map(1..2, fn _ ->
        Names.FirstSupervisor.start_link()
      end)

    Enum.each(sups, fn {:ok, sup} ->
      Names.FirstSupervisor.start_child(sup)
    end)

    {:ok, state}
  end
end
