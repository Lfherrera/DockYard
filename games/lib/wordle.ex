defmodule Games.Wordle do
  @spec feedback(String.t(), String.t()) :: [atom()]
  def feedback(answer, guess) do
    answer_list = String.split(answer, "", trim: true)
    guess_list = String.split(guess, "", trim: true)
    # if letter is not in answer_list -> grey
    # if letter is in answer_list and in same position -> green
    # if letter is in answer_list -> yellow

    # in order to compare letters position in each list we need to use Enum.zip, Enum.with_index don't work

    # Enum.map(answer_list, fn char ->
    #   char not in answer_list -> :grey
    #   char in answer_list -> :green
    #   true
    # end)

    join_lists = Enum.zip([guess_list, answer_list])

    Enum.map(join_lists, fn {guess_char, answer_char} ->
      cond do
      guess_char not in answer_list -> :grey
      guess_char == answer_char -> :green
      true -> :yellow
      end
    end)
  end
  @spec play() :: String.t()
  def play() do
    player_guess = IO.gets("Enter a five letter word:  ") |> String.trim()
    #if String.length(player_guess) > 5, do: "Word has more then 5 letters"
    #check = String.length(player_guess)
    #if check > 5 do
    five_letter_word =  Enum.random(["toast", "tarts", "hello", "beats"]) |> IO.inspect()

    feedback(five_letter_word, player_guess)

  end

end
