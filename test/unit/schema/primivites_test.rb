# Tests that the components of the schema generation framework are behaving properly
require "helper"
require "inspec/schema/primitives"

describe Inspec::Schema::Primitives do
  describe "title construction" do
    let(:schema_alpha) do
      Inspec::Schema::Primitives::SchemaType.new("Alpha", {
      "type" => "string",
    }, []) end

    let(:schema_beta) do
      Inspec::Schema::Primitives::SchemaType.new("Beta", {
      "type" => "object",
      "required" => [],
      "properties" => {
        "param1" => { "type" => "number" },
      },
    }, []) end

    # Omega nests alpha and beta
    let(:schema_omega) do
      Inspec::Schema::Primitives::SchemaType.new("Omega", {
      "type" => "object",
      "required" => ["my_beta"],
      "properties" => {
        "my_alpha" => schema_alpha.ref,
        "my_beta" => schema_beta.ref,
      },
    }, [schema_alpha, schema_beta]) end

    it "should work" do
      lambda { raise "oops" }.must_raise "oops"
    end

    it "should add the title to schema bodies" do
      (schema_alpha.body["title"]).must_equal "Alpha"
      (schema_beta.body["title"]).must_equal  "Beta"
      (schema_omega.body["title"]).must_equal "Omega"
    end

    it "should properly generate ref keys" do
      # pass schema
    end
  end

  describe "property validation" do
    it "detects if an object does not define required properties" do
      lambda {
        Inspec::Schema::Primitives.SchemaType.new("Test1", {
          "type" => "object",
          "properties" => {
            "hello" => { "type" => "string" },
          },
        }, [])
      }.must_raise "Objects in schema must have a \"required\" property, even if it is empty"
    end

    it "detects if a required property is missing" do
      lambda {
        Inspec::Schema::Primitives.SchemaType.new("Test2", {
          "type" => "object",
          "required" => %w{alpha beta},
          "properties" => {
            "alpha" => { "type" => "number" },
            "omega" => { "type" => "number" },
          },
        }, [])
      }.must_raise "Property beta is required in schema Test2 but does not exist!"
    end
  end
end
