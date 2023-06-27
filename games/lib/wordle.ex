defmodule Games.Wordle do
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
end
