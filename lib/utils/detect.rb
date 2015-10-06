# encoding: utf-8
# Copyright 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# Tiny test file to return OS info of the tested node

# print OS detection infos
conf = {
  name:    os[:name],
  family:  os[:family],
  release: os[:release],
  arch:    os[:arch],
}
puts JSON.dump(conf)
exit 0
