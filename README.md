# BotHub

## Deployment

    mix edeliver build release --verbose
    mix edeliver deploy release to production --verbose --version=0.0.x
    mix edeliver start production --verbose

## Upgrade

    mix edeliver build upgrade --from=0.0.2 --to=0.0.3

## SSL

*Local*

    openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt -subj '/CN=localhost'

*Prod*

    openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout bothub.colharris.key -out bothub.colharris.crt -subj '/CN=bothub.colharris.com'

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add bot_hub to your list of dependencies in `mix.exs`:

        def deps do
          [{:bot_hub, "~> 0.0.1"}]
        end

  2. Ensure bot_hub is started before your application:

        def application do
          [applications: [:bot_hub]]
        end
