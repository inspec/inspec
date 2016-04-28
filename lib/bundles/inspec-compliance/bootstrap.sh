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

# build master version of inspec
sudo /opt/chef-compliance/embedded/bin/gem list inspec

cd /inspec
sudo /opt/chef-compliance/embedded/bin/gem build *.gemspec
sudo /opt/chef-compliance/embedded/bin/gem install inspec*.gem
sudo /opt/chef-compliance/embedded/bin/inspec version
sudo /opt/chef-compliance/embedded/bin/gem list inspec

# finalize setup
cd /
/opt/chef-compliance/embedded/service/core/bin/core setup --endpoint "http://127.0.0.1:10500/setup" --login "admin" --password "admin" --name "John Doe" --accept-eula

# wget --no-check-certificate http://127.0.0.1/api/version
# cat version
