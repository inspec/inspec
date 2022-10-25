require "helper"
require "inspec/resource"
require "inspec/resources/csv"

describe "Inspec::Resources::CSV" do
  describe "when loading a valid csv using default header true" do
    let(:resource) { load_resource("csv", "example.csv") }
    let(:params) do
      {}
    end

    it "gets the resource_id for the current resource" do
      _(resource.resource_id).must_equal "example.csv"
    end

    it "captures an array of params" do
      _(resource.params).must_be_kind_of Array
    end

    it "gets all value lines" do
      _(resource.params.length).must_equal 4
    end

    it "captures a hashmap of entries of a line" do
      _(resource.params[0]).must_be_kind_of Hash
    end

    it "gets params by header fields" do
      _(resource.params[0]["name"]).must_equal "addressable"
    end

    it "retrieves nil if a param is missing" do
      _(resource.params[0]["missing"]).must_be_nil
    end

    it "returns an array of values by column name" do
      _(resource.value(["name"])).must_equal(%w{addressable ast astrolabe berkshelf})
    end
  end

  describe "when loading a valid csv using default header false" do
    let(:resource) { load_resource("csv", "example.csv", false) }
    let(:params) do
      {}
    end

    it "captures an array of params" do
      _(resource.params).must_be_kind_of Array
    end

    it "gets all value lines" do
      _(resource.params.length).must_equal 5
    end

    it "gets params by row" do
      _(resource.params[0]).must_equal(%w{name version license title description})
    end
  end
end
