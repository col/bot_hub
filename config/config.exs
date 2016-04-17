use Mix.Config

config :bot_hub, http_port: 80

config :bot_hub, https_port: 443
config :bot_hub, ssl_key: "priv/ssl/localhost.key"
config :bot_hub, ssl_crt: "priv/ssl/localhost.crt"

import_config "#{Mix.env}.exs"
