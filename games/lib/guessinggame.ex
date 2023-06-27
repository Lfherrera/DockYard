defmodule Games.GuessingGame do
  def play() do
    guess = IO.gets("Guess a number between 1 and 10:\ ")
    guess = String.replace(guess,~r/\r|\n/, "")
    number_generator = Enum.random(1..3)
    IO.inspect("#{number_generator}", label: "Random number")
    IO.inspect("#{guess}", label: "guess number")
        if guess == number_generator, do: "You win!", else: "Incorrect!"
  end
end
