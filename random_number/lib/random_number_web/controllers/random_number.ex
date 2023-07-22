defmodule RandomNumberWeb.RandomNumberController do
  use RandomNumberWeb, :controller

  def random(conn, _params) do
    #current_count = String.to_integer(params["random"])
    #increment_by = String.to_integer(params["increment_by"])
    random = Enum.random(1..100)
    render(conn, :random, random: random)
  end

end
