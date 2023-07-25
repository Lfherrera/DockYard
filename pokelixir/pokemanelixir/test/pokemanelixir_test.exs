defmodule PokemanelixirTest do
  use ExUnit.Case
  doctest Pokemanelixir

  test "greets the world" do
    assert Pokemanelixir.hello() == :world
  end
end
