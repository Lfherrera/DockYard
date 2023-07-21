defmodule HelloWorld2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HelloWorld2Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HelloWorld2.PubSub},
      # Start Finch
      {Finch, name: HelloWorld2.Finch},
      # Start the Endpoint (http/https)
      HelloWorld2Web.Endpoint
      # Start a worker by calling: HelloWorld2.Worker.start_link(arg)
      # {HelloWorld2.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloWorld2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloWorld2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
