defmodule Games do
  def main(_args \\ []) do
    # {opts, _word, _errors} = OptionParser.parse(args, switches: [number: :string])

    game_option =
      IO.gets("What game would you like to play?
      1. Guessing game
      2. Rock Paper Scissors
      3. Wordle\n

      enter stop to exit\n")
      |> String.trim()
      |> game_choice()
  end

  def game_choice(game_option) do
    case game_option do
      "1" -> Games.GuessingGame.play()
      "2" -> Games.RockPaperScissors.play()
      "3" -> Games.Wordle.play()
      _ -> "Invalid input, Game stopped"
    end

    unless game_option == "stop" do
      main([])
    end
  end
end
