export PATH=`pwd`/vendor/elixir/bin:$PATH

echo "Run Elixir tests..."
MIX_ENV=test mix test
