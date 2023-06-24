defmodule HelloWorld.Greeting do
  def salutations(name) do
    # to_string(name)
    "Salutations, #{name}!"
  end
end

defmodule HelloWorld.Greeting.Formal do
  def charmed() do
    "Charmed, I'm sure."
  end
end
