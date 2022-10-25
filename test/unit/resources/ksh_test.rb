require "helper"
require "inspec/resource"
require "inspec/resources/ksh"

describe Inspec::Resources::Ksh do
  let(:x) { rand.to_s }
  let(:resource) { load_resource("ksh", '$("' + x + '")') }

  it "prints as a ksh command" do
    _(resource.to_s).must_equal 'KornShell command $("' + x + '")'
    _(resource.resource_id).must_equal '$("' + x + '")'
  end

  it "wraps the command" do
    _(resource.command).must_equal "ksh -c \\$\\(\\\"#{x}\\\"\\)"
  end

  it "can specify an executable path" do
    resource = load_resource("ksh", '$("' + x + '")', path: "/bin/ksh")
    _(resource.command).must_equal "/bin/ksh -c \\$\\(\\\"#{x}\\\"\\)"
  end

  it "can specify a arguments" do
    resource = load_resource("ksh", '$("' + x + '")', args: "-x -c")
    _(resource.command).must_equal "ksh -x -c \\$\\(\\\"#{x}\\\"\\)"
  end
end
