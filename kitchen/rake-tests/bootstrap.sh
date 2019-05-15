#!/usr/bin/env bash

echo "STARTING PROVISIONER"

export PATH=/opt/inspec/embedded/bin:$PATH
cd /inspec
gem install bundler
bundle install
gem build inspec
gem install ./inspec-*.gem

echo "ENDING PROVISIONER"
