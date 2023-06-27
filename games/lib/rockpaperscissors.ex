defmodule Games.RockPaperScissors do
  def play() do
    ai_choice = Enum.random(["rock", "paper", "scissors"])
    input = IO.gets("(rock/paper/scissors):\ ")
    input = String.replace(input,~r/\r|\n/, "")
    IO.inspect(ai_choice, label: "AI choice")
    IO.inspect(input, label: "input")
    case {ai_choice, input} do
      {"rock", "paper"} -> "You win! #{input} beats rocks."
      {"paper", "scissors"} -> "You win! #{input} beats paper."
      {"scissors", "rock"} -> "You win! #{input} beats scissors."
      {"paper", "rock"} -> "You lose! #{ai_choice} beats rocks."
      {"rock", "scissors"} -> "You lose! #{ai_choice} beats scissors."
      {"scissors", "paper"} -> "You lose! #{ai_choice} beats paper."
      {_a, _b} -> "It's a tie"
    end
  end
end
