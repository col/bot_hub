# BotHub

## Start Local

    iex --name "bot_hub@127.0.0.1" -S mix    

## Deployment

    mix edeliver build release
    mix edeliver deploy release to production --version=0.0.x
    mix edeliver start|restart production

## Upgrade

    mix edeliver build upgrade --from=0.0.x --to=0.0.z
    mix edeliver deploy upgrade to production --version=0.0.z

## SSL

*Local*

    openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt -subj '/CN=localhost'

*Prod*

    openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout bothub.colharris.key -out bothub.colharris.crt -subj '/CN=bothub.colharris.com'
