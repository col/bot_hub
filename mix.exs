defmodule BotHub.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bot_hub,
      version: "0.0.10",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:crypto, :public_key, :ssl, :logger, :cowboy, :plug, :gproc, :edeliver, :echo_bot],
      mod: {BotHub, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"},
      {:gproc, "0.5.0"},
      {:edeliver, git: "https://github.com/col/edeliver"},
      {:echo_bot, git: "https://github.com/col/echo_bot"},
      {:nadia, git: "https://github.com/col/nadia"},
      {:telegram, git: "https://github.com/col/telegram"},
      {:poison, "~> 2.0", override: true}
    ]
  end
end
