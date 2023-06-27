defmodule Games.RockPaperScissors do
  def play() do
    ai_choice = Enum.random(["rock", "paper", "scissors"])
    IO.inspect(ai_choice, label: "AI choice")
    input = IO.gets("(rock/paper/scissors):\ ") |> String.trim()
    #input = String.replace(input,~r/\r|\n/, "")
    IO.inspect(input, label: "input")

    cond do
      ai_choice == input -> "It's a tie!"
      beats?(input, ai_choice) -> "You win! #{input} beats #{ai_choice}."
      beats?(ai_choice, input) -> "You lose! #{ai_choice} beats #{input}."
    end
    # refactor code above
    # case {ai_choice, input} do
    #   {"rock", "paper"} -> "You win! #{input} beats rocks."
    #   {"paper", "scissors"} -> "You win! #{input} beats paper."
    #   {"scissors", "rock"} -> "You win! #{input} beats scissors."
    #   {"paper", "rock"} -> "You lose! #{ai_choice} beats rocks."
    #   {"rock", "scissors"} -> "You lose! #{ai_choice} beats scissors."
    #   {"scissors", "paper"} -> "You lose! #{ai_choice} beats paper."
    #   {_a, _b} -> "It's a tie"
    # end
  end

  defp beats?(player1, player2) do
    {player1, player2} in [{"rock", "scissors"}, {"paper", "rock"},{"scissors", "paper"} ]
    #refactor case using in
    # case {player1, player2} do
    # {"rock", "scissors"} -> true
    # {"paper", "rock"} -> true
    # {"scissors", "paper"} -> true
    # _ -> false
    # end
  end
end
