require "helper"
require "inspec/fetcher"

describe Inspec::Fetcher::Local do
  let(:fetcher) { Inspec::Fetcher::Local }

  it "registers with the fetchers registry" do
    reg = Inspec::Fetcher::Registry.registry
    _(reg["local"]).must_equal fetcher
  end

  describe "applied to this file" do
    let(:res) { fetcher.resolve(__FILE__) }

    it "must be resolved" do
      _(res).must_be_kind_of fetcher
    end
  end

  describe "applied to this folder" do
    let(:path) { File.dirname(__FILE__) }
    let(:res) { fetcher.resolve(path) }

    it "must be resolved" do
      _(res).must_be_kind_of fetcher
    end
  end
end
