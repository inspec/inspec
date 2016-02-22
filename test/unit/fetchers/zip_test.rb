# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe Fetchers::Zip do
  let(:fetcher) { Fetchers::Zip }

  it 'registers with the fetchers registry' do
    reg = Inspec::Fetcher.registry
    _(reg['zip']).must_equal fetcher
  end

  describe 'applied to a zipped archive' do
    let(:target) { MockLoader.profile_zip('complete-profile') }
    let(:res) { fetcher.resolve(target) }

    it 'must be resolved' do
      _(res).must_be_kind_of fetcher
    end

    it 'must contain all files' do
      _(res.files.sort).must_equal %w{inspec.yml libraries libraries/testlib.rb
        controls controls/filesystem_spec.rb}.sort
    end

    it 'must not read if the file isnt included' do
      _(res.read('file-not-in-archive')).must_be_nil
    end

    it 'must read the contents of the file' do
      _(res.read('inspec.yml')).must_match /^name: complete$/
    end
  end
end
