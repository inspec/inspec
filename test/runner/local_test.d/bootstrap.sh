#!/bin/bash

apt-get update && apt-get -y install ruby ruby-dev gem gcc
gem install bundler

cd /tmp/kitchen/data
bundle install
bundle exec ruby -I lib test/runner/local_test.d/test.rb
