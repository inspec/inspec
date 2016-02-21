# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe Inspec::Fetcher do
  it 'loads the local fetcher for this file' do
    res = Inspec::Fetcher.resolve(__FILE__)
    res.must_be_kind_of Fetchers::Local
  end
end
