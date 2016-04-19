#!/bin/bash

export MY_DEPS_PATH=/var/go/deps
source ~/.kerl/installs/18.2.1/activate
export PATH=`pwd`/vendor/elixir/bin:$PATH

mix do deps.compile, compile
NEW_VERSION=$( mix version )
echo "New Version:" $NEW_VERSION

DEPLOYED_VERSION=$( curl http://bothub.colharris.com/version )
echo "Deployed Version:" $DEPLOYED_VERSION

if [ NEW_VERSION != DEPLOYED_VERSION ]
then
  mix edeliver build appups --with=$DEPLOYED_VERSION --to=$NEW_VERSION
  mix edeliver build upgrade --with=$DEPLOYED_VERSION --to=$NEW_VERSION
  mix edeliver deploy upgrade to production
else
  mix edeliver build appups --with=$DEPLOYED_VERSION
  mix edeliver build upgrade --with=$DEPLOYED_VERSION
  mix edeliver deploy upgrade to production
fi
