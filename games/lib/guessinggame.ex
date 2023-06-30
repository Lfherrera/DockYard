defmodule Games.GuessingGame do
  @spec play() :: String.t()
  def play() do
    guess = IO.gets("Guess a number between 1 and 10:\ ") |> String.trim() |> String.to_integer()
    # guess = String.replace(guess,~r/\r|\n/, "")
    number_generator = Enum.random(1..10)

    IO.inspect("#{number_generator}", label: "Random number")
    IO.inspect("#{guess}", label: "guess number")
    check_for_winner(guess, number_generator)
    # |> IO.inspect()

    # if guess == number_generator, do: IO.puts(IO.ANSI.green() <> "You win!" <> IO.ANSI.reset()), else: IO.puts(IO.ANSI.red() <> "Incorrect!" <> IO.ANSI.reset())
  end

  def check_for_winner(guess, number_generator) do
    if guess == number_generator, do: "You win!", else: "Incorrect!"
    # this was making my test fail
    # do: IO.puts(IO.ANSI.green() <> "You win!" <> IO.ANSI.reset()),
    # else: IO.puts(IO.ANSI.red() <> "Incorrect!" <> IO.ANSI.reset())
  end
end
