# encoding: utf-8
require 'helper'

describe Train do
  it 'defines a version' do
    Train::VERSION.must_be_instance_of String
  end
end
