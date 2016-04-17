defmodule BotHub.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bot_hub,
      version: "0.0.16",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  def application do
    [
      applications: [:crypto, :public_key, :ssl, :logger, :cowboy, :plug, :edeliver],
      mod: {BotHub, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"},
      {:edeliver, git: "https://github.com/col/edeliver"}
    ]
  end
end
