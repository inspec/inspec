require "helper"
require "inspec/utils/filter_array"

describe FilterArray do
  let(:data) do
    [
   { foo: 3, bar: true, baz: "yay" },
   { foo: 2, bar: false, baz: "noo" },
   { foo: 2, bar: false, baz: "whatever" },
    ]
  end

  let(:instance) do
    FilterArray.new data
  end

  describe "#content" do
    it "returns the current set" do
      _(instance.content).must_equal data
    end

    it "can also be referred to as #rules" do
      _(instance.rules).must_equal instance.content
    end
  end

  describe "#field" do
    it "retrieves (unique) values" do
      _(instance.field("foo")).must_equal [3, 2]
    end

    it "filters the current set" do
      _(instance.field("foo", 2).content).must_equal [
        { foo: 2, bar: false, baz: "noo" },
        { foo: 2, bar: false, baz: "whatever" },
      ]
    end

    it "can be chained" do
      _(instance.field("foo", 2).field("baz", "noo").content).must_equal [
        { foo: 2, bar: false, baz: "noo" },
      ]
    end

    it "can be abbreviated for retrieval" do
      _(instance.foo).must_equal [3, 2]
    end

    it "can be abbreviated for querying" do
      _(instance.foo(2).content).must_equal [
        { foo: 2, bar: false, baz: "noo" },
        { foo: 2, bar: false, baz: "whatever" },
      ]
    end

    it "returns `[nil]` when queried for a non-existing key" do
      _(instance.what).must_equal [nil]
    end
  end
end
