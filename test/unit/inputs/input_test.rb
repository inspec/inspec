require "helper"
require "inspec/input"

describe Inspec::Input do
  let(:opts) { {} }
  let(:input) { Inspec::Input.new("test_input", opts) }

  #==============================================================#
  #                        Metadata
  #==============================================================#
  describe "setting and reading metadata" do
    {
      description: "My favorite attribute",
      identifier: "a_ruby_permitted_name",
      required: true,
      title: "how is this different than description",
      type: "Numeric",
    }.each do |field, value|
      it "should be able to recall the #{field} field" do
        opts[field] = value
        ipt = Inspec::Input.new("test_attribute", opts)
        seen_value = ipt.send(field)
        seen_value.must_equal value
      end
    end
  end

  #==============================================================#
  #                   Setting Value - One Shot
  #            (see events_test.rb for overwrite support)
  #==============================================================#
  describe "the dummy value used when value is not set" do
    it "returns the actual value, not the dummy object, if one is assigned" do
      input.value = "new_value"
      input.value.must_equal "new_value"
    end

    it "returns the dummy value if no value is assigned" do
      input.value.must_be_kind_of Inspec::Input::NO_VALUE_SET
      input.value.is_a?(Inspec::Input::NO_VALUE_SET).must_equal true
      input.value.to_s.must_equal "Input 'test_input' does not have a value. Skipping test."
    end

    it "the dummy value responds true to the legacy class checks" do
      input.value.is_a?(Inspec::Attribute::DEFAULT_ATTRIBUTE).must_equal true
      input.value.must_be_kind_of Inspec::Attribute::DEFAULT_ATTRIBUTE
    end

    it "has a dummy value that can be called like a nested map" do
      input.value["hello"]["world"][1][2]["three"].wont_be_nil
    end

    it "has a dummy value that can take any nested method calls" do
      input.value.call.some.fancy.functions.wont_be_nil
    end
  end

  describe "setting a value in the constructor using value:" do
    it "returns the user-configured value" do
      input = Inspec::Input.new("test_input", value: "some_value")
      input.value.must_equal "some_value"
    end

    it "returns the user-configured value if nil is explicitly assigned" do
      input = Inspec::Input.new("test_input", value: nil)
      input.value.must_be_nil
    end

    it "returns the user-configured value if false is explicitly assigned" do
      input = Inspec::Input.new("test_input", value: false)
      input.value.must_equal false
    end

    it "returns a new value if the value has been assigned by value=" do
      input = Inspec::Input.new("test_input", value: "original_value")
      input.value = "new_value"
      input.value.must_equal "new_value"
    end

    it 'accepts the legacy ":default" option' do
      input = Inspec::Input.new("test_input", default: "a_default")
      input.value.must_equal "a_default"
    end

    it 'accepts the legacy ":default" and ":value" options' do
      input = Inspec::Input.new("test_input", default: "a_default", value: "a_value")
      input.value.must_equal "a_value"
    end
  end

  describe "setting a value using value=" do
    it "supports storing and returning a value" do
      input.value = "a_value"
      input.value.must_equal "a_value"
    end

    it "supports storing and returning false" do
      input.value = false
      input.value.must_equal false
    end

    it "supports storing and returning nil" do
      input.value = nil
      input.value.must_be_nil
    end
  end
end
