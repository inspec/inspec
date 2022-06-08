require "helper"
require "inspec/resource"
require "inspec/resources/vbscript"

describe "Inspec::Resources::VbScript" do

  vb_script = <<-EOH
    WScript.Echo "hello vbscript"
  EOH

  it "check if `vbscript` for windows is properly generated " do
    resource = MockLoader.new(:windows).load_resource("vbscript", vb_script)
    _(resource.command.to_s).must_include vb_script
  end

  it "generates the resouce_id for the current resource" do
    resource = MockLoader.new(:windows).load_resource("vbscript", vb_script)
    _(resource.resource_id).must_equal "Windows VBScript"
  end
end
