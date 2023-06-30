defmodule Games.GuessingGameTest do
	use ExUnit.Case
	doctest Games.GuessingGame
	alias Games.GuessingGame

	test "winner/2 WIN" do
		assert Games.GuessingGame.check_for_winner(8,8) == "You win!"
	end

	test "winner/2 LOSER" do
		assert Games.GuessingGame.check_for_winner(8,7) == "Incorrect!"
	end
end
