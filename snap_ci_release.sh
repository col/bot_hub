export MY_DEPS_PATH=/var/go/deps
source ~/.kerl/installs/18.2.1/activate
export PATH=`pwd`/vendor/elixir/bin:$PATH

echo "Build release..."
mix edeliver build release
