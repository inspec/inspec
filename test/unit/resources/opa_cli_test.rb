require "helper"
require "inspec/resource"
require "inspec/resources/opa_cli"

describe "Inspec::Resources::OpaCli" do
  it "verify opa eval query result parsing" do
    resource = load_resource("opa_cli", policy: "example.rego", data: "input.json", query: "data.example.allow")
    _(resource.params["result"][0]["expressions"][0]["value"]).must_equal false
    _(resource.allow).must_equal false
  end

  it "fails when policy, data or query is nil." do
    resource = load_resource("opa_cli")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "OPA policy, data and query are mandatory."
  end

  it "fails when empty string passed for options policy, data or query." do
    resource = load_resource("opa_cli", policy: "", data: "", query: "")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "OPA policy, data and query are mandatory."
  end
end
