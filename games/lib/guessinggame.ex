defmodule Games.GuessingGame do
  @spec play() :: String.t()
  def play() do
    guess = IO.gets("Guess a number between 1 and 10:\ ") |> String.trim() |> String.to_integer()
    #guess = String.replace(guess,~r/\r|\n/, "")
    number_generator = Enum.random(1..10)
    IO.inspect("#{number_generator}", label: "Random number")
    IO.inspect("#{guess}", label: "guess number")
        if guess == number_generator, do: "You win!", else: "Incorrect!"
  end
end
