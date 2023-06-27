defmodule Games.WordleTest do
	use ExUnit.Case
	doctest Games.Wordle
	alias Games.Wordle

  describe "feedback/2" do
    test "all gray" do
      assert Wordle.feedback("aaaaa", "bbbbb") == [:grey, :grey, :grey, :grey, :grey]
    end

    test "all green" do
      assert Wordle.feedback("aaaaa", "aaaaa") == [:green, :green, :green, :green, :green]
    end

    test "all yellow" do
      assert Wordle.feedback("aabbc", "bbcaa") == [:yellow, :yellow, :yellow, :yellow, :yellow]
    end

    test "mixed" do
      assert Wordle.feedback("aabbc", "babad") == [:yellow, :green, :green, :yellow, :grey]
    end
  end
end
