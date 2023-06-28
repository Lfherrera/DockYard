defmodule Greeting do
  def main(args) do
    {opts, _word, _error} = OptionParser.parse(args, switches: [time: :string])
    IO.puts("Good #{opts[:time] || "morning"}!")
    {opts, word, _error} = OptionParser.parse(switches: [upcase: :boolean])
    # IO.puts("#{opts[:upcase], do: String.upcase(), Good morning"}!")
  end
end
