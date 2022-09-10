# This file tests Inspec::Feature functionality,
# which allows you to declare a group of functionality
# for purposes of logging, entitlement, feature flagging,
# telemetry, and other future purposes

require "helper"

require "inspec/feature"

describe "Inspec::Feature" do
  it "should be a class" do
    _(Inspec::Feature).must_be_kind_of Class
  end

  #======================
  # The global convenience method with_feature
  #======================
  # It exists
  describe "Inspec.with_feature" do
    it "should have a with_feature class method" do
      _(Inspec.respond_to?(:with_feature)).must_equal true
    end
    it "should take a symbol, options, and a block" do
      _(Inspec.method(:with_feature).arity).must_equal -2
    end

    it "defaults to calling the block" do
      called = false
      Inspec.with_feature(:test_feature) do
        called = true
      end
      _(called).must_equal true
    end
  end

  # ??It throws certain exceptions if the symbol is not recognized

  # TODO: Integration with Logger
  # TODO: Integration with Entitlement
  # TODO: Integration with feature flagging
  # TODO: Integration with usage telemetry

  #======================
  # Internals
  #======================

end
