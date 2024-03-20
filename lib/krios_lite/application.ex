defmodule KriosLite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KriosLiteWeb.Telemetry,
      KriosLite.Repo,
      {DNSCluster, query: Application.get_env(:krios_lite, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KriosLite.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: KriosLite.Finch},
      # Start a worker by calling: KriosLite.Worker.start_link(arg)
      # {KriosLite.Worker, arg},
      # Start to serve requests, typically the last entry
      KriosLiteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KriosLite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KriosLiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
