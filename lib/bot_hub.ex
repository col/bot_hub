defmodule BotHub do
  use Application

  def protocol, do: Application.get_env(:bot_hub, :protocol)

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(__MODULE__, [protocol], function: :run),
    ]

    opts = [strategy: :one_for_one, name: BotHub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run("http") do
    {:ok, _} = Plug.Adapters.Cowboy.http BotHub.Router, [], port: 5000
  end

  def run("https") do
    {:ok, _} = Plug.Adapters.Cowboy.https BotHub.Router, [], ssl_config(Elixir.Mix.env)
  end

  def ssl_config(:prod) do
    [
      port: 443,
      otp_app: :bot_hub,
      keyfile: "priv/ssl/bothub.colharris.key",
      certfile: "priv/ssl/bothub.colharris.crt"
    ]
  end

  def ssl_config(_) do
    [
      port: 5000,
      otp_app: :bot_hub,
      keyfile: "priv/ssl/localhost.key",
      certfile: "priv/ssl/localhost.crt"
    ]
  end

end
