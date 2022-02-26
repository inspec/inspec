require "helper"
require "inspec/resource"
require "inspec/resources/kernel_parameters"

describe "Inspec::Resources::KernelParameters" do
  it "verify kernel_parameters parsing" do
    resource = load_resource("kernel_parameters")
    _(resource.parameters).must_include "net.ipv4.conf.all.forwarding"
    _(resource.values).must_include 1
  end

  it "verify kernel_parameters parsing using where query" do
    resource = load_resource("kernel_parameters")
    _(resource.where { parameter == "net.ipv4.conf.all.forwarding" }.values).must_equal [1]
    _(resource.where { value == 1 }.parameters).must_include "net.ipv4.conf.all.forwarding"
  end

  it "verify kernel_parameters parsing using where query with regex" do
    resource = load_resource("kernel_parameters")
    _(resource.where { parameter =~ /^net./ }.entries.length).must_equal 28
  end
end
