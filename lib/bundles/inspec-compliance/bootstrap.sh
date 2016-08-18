#!/bin/bash

echo "Installing Chef Compliance $deb"
# select latest package from cache directory
# deb=$(find /inspec/.cache -name '*.deb' | tail -1)
# sudo dpkg -i $deb

# use chef compliance package repository
sudo apt-get install -y apt-transport-https
sudo apt-get install wget
wget -qO - https://downloads.chef.io/packages-chef-io-public.key | sudo apt-key add -
CHANNEL=${CHANNEL:-stable}
DISTRIBUTION=$(lsb_release --codename | cut -f2)
echo "found $DISTRIBUTION"
echo "use $CHANNEL channel"
echo "deb https://packages.chef.io/$CHANNEL-apt $DISTRIBUTION main" > /etc/apt/sources.list.d/chef-$CHANNEL.list
sudo apt-get update
sudo apt-get install chef-compliance

sudo chef-compliance-ctl reconfigure --accept-license
sudo chef-compliance-ctl restart

# finalize setup
cd /
/opt/chef-compliance/embedded/service/core/bin/core setup --endpoint "http://127.0.0.1:10500/setup" --login "admin" --password "admin" --name "John Doe" --accept-eula

# wget --no-check-certificate http://127.0.0.1/api/version
# cat version

# install ruby 2.3
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install -y ruby2.3 ruby2.3-dev
ruby2.3 -v

# prepare the usage of bundler
sudo gem install bundler
cd /inspec
bundle install
BUNDLE_GEMFILE=/inspec/Gemfile bundle exec inspec version
