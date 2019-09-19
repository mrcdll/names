defmodule NamesTest do
  use ExUnit.Case
  doctest Names

  test "greets the world" do
    assert Names.hello() == :world
  end
end
