# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe Fetchers::Local do
  let(:fetcher) { Fetchers::Local }

  it 'registers with the fetchers registry' do
    reg = Inspec::Fetcher.registry
    _(reg['local']).must_equal fetcher
  end

  describe 'applied to this file' do
    let(:res) { fetcher.resolve(__FILE__) }

    it 'must be resolved' do
      _(res).must_be_kind_of fetcher
    end

    it 'must only contain this file' do
      _(res.files).must_equal [__FILE__]
    end

    it 'must not read if the file doesnt exist' do
      _(res.read('file-does-not-exist')).must_be_nil
    end

    it 'must not read files not covered' do
      _(File.file?('/proc/cpuinfo')).must_equal true
      _(res.read('/proc/cpuinfo')).must_be_nil
    end

    it 'must read the contents of the file' do
      _(res.read(__FILE__)).must_equal File.read(__FILE__)
    end
  end

  describe 'applied to this folder' do
    let(:path) { File.dirname(__FILE__) }
    let(:res) { fetcher.resolve(path) }

    it 'must be resolved' do
      _(res).must_be_kind_of fetcher
    end

    it 'must contain all files' do
      _(res.files).must_include __FILE__
    end

    it 'must not read if the file doesnt exist' do
      _(res.read('file-not-in-folder')).must_be_nil
    end

    it 'must not read files not covered' do
      _(File.file?('/proc/cpuinfo')).must_equal true
      _(res.read('/proc/cpuinfo')).must_be_nil
    end

    it 'must read the contents of the file' do
      _(res.read(__FILE__)).must_equal File.read(__FILE__)
    end
  end
end
