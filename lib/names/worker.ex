defmodule Names.Worker do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: :"#{__MODULE__}#{Names.uniq_integer()}")
  end

  def init(state) do
    IO.inspect("It's me! #{inspect(self())}")
    {:ok, state}
  end
end
