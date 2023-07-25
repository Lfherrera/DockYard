defmodule RandomNumberWeb.RandomNumberController do
  use RandomNumberWeb, :controller

  def random(conn, _params) do
    random = Enum.random(1..100)
    render(conn, :random, random: random)
  end
  def random(conn, _params) do
    render(conn, :random, random: 0)
  end

  def add_to_random(conn, params) do
    increment_by = String.to_integer(params["increment_by"])
    current_num = String.to_integer(params["cur_random"])
    IO.inspect(current_num, label: "Current Random Num")
    IO.inspect(increment_by, label: "Increment by")
    render(conn, :random, random: current_num + increment_by)
  end
end
