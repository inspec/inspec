require 'helper'

describe Fetchers::Mock do
  let(:fetcher) { Fetchers::Mock }

  it 'registers with the fetchers registry' do
    reg = Inspec::Fetcher.registry
    _(reg['mock']).must_equal fetcher
  end

  it 'wont load nil' do
    fetcher.resolve(nil).must_be :nil?
  end

  it 'wont load a string' do
    fetcher.resolve(rand.to_s).must_be :nil?
  end

  describe 'applied to a map' do
    it 'must be resolved' do
      fetcher.resolve({}).must_be_kind_of fetcher
    end
  end
end
