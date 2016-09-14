#!/bin/sh

# install latest inspec
gem install inspec.gem
# use force to overwrite the binary
gem install inspec-mock.gem  --force

# prep environment
apk add --update openssh
sed -i '/#   Protocol 2/c\Protocol 2' /etc/ssh/ssh_config
