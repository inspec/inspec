require "helper"
require "inspec/resource"
require "inspec/resources/opa_api"

describe "Inspec::Resources::OpaApi" do
  it "verify opa api query result parsing" do
    resource = load_resource("opa_api", url: "localhost:8181/v1/data/example/violation", data: "v1-data-input.json")
    _(resource.params["result"]).must_equal %w{ ci busybox }
    _(resource.params["result"]).must_include "ci"
  end

  it "verify opa api query result parsing when output is empty" do
    resource = load_resource("opa_api", url: "localhost:8181/v1/data/example/violation", data: "v1-data-input1.json")
    _(resource.result).must_be_nil
    _(resource.params["result"]).must_equal([])
  end

  it "fails when url or data is nil." do
    resource = load_resource("opa_api")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "OPA url and data are mandatory."
  end

  it "fails when url or data is empty." do
    resource = load_resource("opa_api", url: "", data: "")
    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "OPA url and data are mandatory."
  end
end
