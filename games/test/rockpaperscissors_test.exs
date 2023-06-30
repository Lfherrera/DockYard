defmodule Games.RockPaperScissorsTest do
	use ExUnit.Case
	doctest Games.RockPaperScissors
	alias Games.RockPaperScissors
    #[{"rock", "scissors"}, {"paper", "rock"}, {"scissors", "paper"}]
  test "rockpaperscissors rock beats scissors/0" do
    assert RockPaperScissors.beats?("rock", "scissors") == true
  end
  test "rockpaperscissors paper beats rock/0" do
    assert RockPaperScissors.beats?("paper", "rock") == true
  end
  test "rockpaperscissors scissors beats paper/0" do
    assert RockPaperScissors.beats?("scissors", "paper") == true
  end

  test "rockpaperscissors false cond scissors beat rocks /0" do
    assert RockPaperScissors.beats?("scissors", "rock") == false
  end
  test "rockpaperscissors rock beats paper false cond /0" do
    assert RockPaperScissors.beats?("rock", "paper") == false
  end
  test "rockpaperscissors paper beats scissors false cond /0" do
    assert RockPaperScissors.beats?("paper", "scissors") == false
  end

end
