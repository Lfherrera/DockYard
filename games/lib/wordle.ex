defmodule Games.Wordle do
  @spec feedback(String.t(), String.t()) :: [atom()]
  def feedback(answer, guess) do
    IO.inspect(answer, label: "Random five letter word")

    answer_list = String.split(answer,"", trim: true)
    guess_list = String.split(guess,"", trim: true)

    IO.inspect(answer_list, label: "Random word into list")
    IO.inspect(guess_list, label: "Guess list")

    # in order to compare letters position in each list we need to use Enum.zip, Enum.with_index don't work
    join_lists = Enum.zip([guess_list, answer_list])

    Enum.map(join_lists, fn {guess_char, answer_char} ->
      cond do
        guess_char not in answer_list -> :grey
        guess_char == answer_char -> :green
        true -> :yellow
      end
    end)

     #|> IO.inspect()
  end

  @spec play :: [atom]
  def play() do
    player_guess = String.trim(IO.gets("Enter a five letter word:  "))

    if String.length(player_guess) == 5 do
      five_letter_word =
        Enum.random(["toast", "tarts", "hello", "beats", "knows", "south", "north"]) #|> IO.puts()

      feedback(five_letter_word, player_guess)
    else
      IO.puts(IO.ANSI.red() <> "Incorrect input, Word must be five letters!" <> IO.ANSI.reset())
      #play()
    end
  end
end
