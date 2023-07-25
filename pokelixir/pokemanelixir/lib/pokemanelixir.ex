defmodule Pokemanelixir do
  alias Pokemanelixir.Pokemon

  @spec get(any) :: Finch.Request.t()
  def get(path) do
    request_url = "https://pokeapi.co/api/v2/pokemon/#{path}"
    headers = [{"Content-Type", "application/json"}]
    # Poison.decode!(~s({"name": "Dan", "age": 42}), %{as: %Person{}, keys: atoms!})
    #
    # body = Jason.decode!(%Pokemon{name: name, })

    Finch.build(:get, request_url, headers)
    |> IO.inspect(label: "request")
    |> Finch.request(MyFinch)
    |> parse_json()
    |> response()
  end

  def all() do
  end

  def response({:ok, body}) do
    poke_values = [
      "id",
      "name",
      "hp",
      "attack",
      "defense",
      "special-attack",
      "special-defense",
      "speed",
      "height",
      "weight",
      "types"
    ]

    base_values = %{
      :id => body["id"],
      :name => body["name"],
      :height => body["height"],
      :weight => body["weight"]
    }

    stats_results =
      body
      |> Map.get("stats")
      |> Enum.filter(fn each ->
        %{
          "base_stat" => _base_stat,
          "effort" => _,
          "stat" => %{
            "name" => name,
            "url" => _
          }
        } = each

        Enum.member?(poke_values, name)
      end)
      |> Enum.map(fn each ->
        %{
          "base_stat" => base_stat,
          "effort" => _,
          "stat" => %{
            "name" => name,
            "url" => _
          }
        } = each

        case name do
          "special-defense" -> {:special_defense, base_stat}
          "special-attack" -> {:special_attack, base_stat}
          _ -> {String.to_existing_atom(name), base_stat}
        end
      end)
      |> IO.inspect()
      |> Map.new()
      |> IO.inspect()

    types =
      body
      |> Map.get("types")
      |> Enum.map(fn each ->
        %{
          "slot" => _,
          "type" => %{
            "name" => name,
            "url" => _
          }
        } = each

        name
      end)

    final_output = base_values
    |> IO.inspect()
    |> Map.merge(stats_results)
    |> IO.inspect()
    |> Map.put(:types, types)

    struct!(Pokemon, final_output)

  end

  def transform_response_to_struct(body) do
    # body
    # |> Map.get("stats")
  end

  defp parse_json({:ok, %Finch.Response{status: 200, body: body}}) do
    Jason.decode(body)
  end

  defp parse_json({:ok, %Finch.Response{status: error_code, body: body}}) do
    {:error, {:http, error_code, body}}
  end

  defp parse_json({:error, _exception} = error), do: {:error, error}
end
