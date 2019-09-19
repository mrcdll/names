defmodule Names.SecondServer do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: :"#{__MODULE__}#{Names.uniq_integer()}")
  end

  def init(state) do
    sups =
      Enum.map(1..3, fn _ ->
        Names.SecondSupervisor.start_link()
      end)

    Enum.each(sups, fn {:ok, sup} ->
      Names.SecondSupervisor.start_child(sup)
    end)

    {:ok, state}
  end
end
