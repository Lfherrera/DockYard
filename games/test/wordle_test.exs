defmodule Games.WordleTest do
	use ExUnit.Case
	doctest Games.Wordle
	alias Games.Wordle



  describe "feedback/2" do  # if letter is not in answer_list -> grey
    test "all gray" do
      assert Wordle.feedback("aaaaa", "bbbbb") == [:grey, :grey, :grey, :grey, :grey]
    end

    test "all gray with capitals" do
      assert Wordle.feedback("WORDS", "CLACK") == [:grey, :grey, :grey, :grey, :grey]
    end

    test "all green" do   # if letter is in answer_list and in same position -> green
      assert Wordle.feedback("aaaaa", "aaaaa") == [:green, :green, :green, :green, :green]
    end
    test "all yellow" do  # if letter is in answer_list -> yellow
      assert Wordle.feedback("aabbc", "bbcaa") == [:yellow, :yellow, :yellow, :yellow, :yellow]
    end

    test "mixed test1" do
      assert Wordle.feedback("aabbc", "babad") == [:yellow, :green, :green, :yellow, :grey]
    end
    #@tag :skip
    test "mixed test2" do
      assert Wordle.feedback("cocas", "locos") == [:grey, :green, :green, :yellow, :green]
    end

  end
end
