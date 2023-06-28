defmodule Greeting do
  def main(args \\ []) do
    args
    |> parse_arg()
    |> response()
    |> IO.puts()

    # {opts, _word, _error} = OptionParser.parse(args, switches: [time: :string])
    # IO.puts("Good #{opts[:time] || "morning"}!")
  end

  defp parse_arg(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [upcase: :boolean])

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:upcase] do
      String.upcase(word)
    else
      word
    end
  end
end
