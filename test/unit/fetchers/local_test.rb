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
  end

  describe 'applied to this folder' do
    let(:path) { File.dirname(__FILE__) }
    let(:res) { fetcher.resolve(path) }

    it 'must be resolved' do
      _(res).must_be_kind_of fetcher
    end
  end
end
