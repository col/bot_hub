defmodule BotHub do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(__MODULE__, [], function: :run),
      supervisor(SampleBot, [])
    ]

    opts = [strategy: :one_for_one, name: BotHub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run() do
    {:ok, _} = Plug.Adapters.Cowboy.http BotHub.Router, [],
      port: get_env(:http_port)

    {:ok, _} = Plug.Adapters.Cowboy.https BotHub.Router, [],
      port: get_env(:https_port),
      otp_app: :bot_hub,
      keyfile: get_env(:ssl_key),
      certfile: get_env(:ssl_crt)
  end

  def get_env(key), do: Application.get_env(:bot_hub, key)

end
