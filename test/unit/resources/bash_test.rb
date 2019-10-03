require "helper"
require "inspec/resource"
require "inspec/resources/bash"

describe "Inspec::Resources::Bash" do
  let(:x) { rand.to_s }
  let(:resource) { load_resource("bash", '$("' + x + '")') }

  it "prints as a bash command" do
    _(resource.to_s).must_equal 'Bash command $("' + x + '")'
  end

  it "wraps the command" do
    _(resource.command).must_equal "bash -c \\$\\(\\\"#{x}\\\"\\)"
  end

  it "can specify an executable path" do
    resource = load_resource("bash", '$("' + x + '")', path: "/bin/bash")
    _(resource.command).must_equal "/bin/bash -c \\$\\(\\\"#{x}\\\"\\)"
  end

  it "can specify a arguments" do
    resource = load_resource("bash", '$("' + x + '")', args: "-x -c")
    _(resource.command).must_equal "bash -x -c \\$\\(\\\"#{x}\\\"\\)"
  end
end
