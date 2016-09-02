# encoding: utf-8
# copyright: 2015, Chef Software, Inc.
# license: All rights reserved

title '/tmp profile'

# you can also use plain tests
describe file('/tmp') do
  it { should be_directory }
  it { should_nota be_directory }
end
