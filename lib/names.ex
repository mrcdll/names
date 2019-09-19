defmodule Names do
  @moduledoc """
  Documentation for Names.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Names.hello()
      :world

  """
  def hello do
    :world
  end

  def uniq_integer do
    System.unique_integer([:positive])
  end
end
