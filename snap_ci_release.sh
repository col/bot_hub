export PATH=`pwd`/vendor/elixir/bin:$PATH

echo "Build release..."
mix edeliver build release
