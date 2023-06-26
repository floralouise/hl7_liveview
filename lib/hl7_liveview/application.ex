defmodule Hl7Liveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Hl7LiveviewWeb.Telemetry,
      # Start the Ecto repository
      Hl7Liveview.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hl7Liveview.PubSub},
      # Start Finch
      {Finch, name: Hl7Liveview.Finch},
      # Start the Endpoint (http/https)
      Hl7LiveviewWeb.Endpoint
      # Start a worker by calling: Hl7Liveview.Worker.start_link(arg)
      # {Hl7Liveview.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hl7Liveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Hl7LiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
