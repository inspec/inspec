require "helper"
require "inspec/resource"
require "inspec/resources/powershell"

describe "Inspec::Resources::Powershell" do
  let(:base64_command) do
    # Encoded version of `$ProgressPreference='SilentlyContinue';Get-Help`
    "JABQAHIAbwBnAHIAZQBzAHMAUAByAGUAZgBlAHIAZQBuAGMAZQA9ACcAUwBpAGwA" \
    "ZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQAnADsARwBlAHQALQBIAGUAbABwAA=="
  end

  it "properly generates command" do
    resource = MockLoader.new(:windows).load_resource("powershell", "Get-Help")
    _(resource.command).must_equal "Get-Help"
    _(resource.resource_id).must_equal "Powershell"

    resource = MockLoader.new(:macos10_10).load_resource("powershell", "Get-Help")
    _(resource.command).must_equal("pwsh -encodedCommand '#{base64_command}'")
    _(resource.resource_id).must_equal "Powershell"
  end

  it "properly generates command if deprecated `script` is used" do
    expect_deprecation(:resource_script) do
      resource = MockLoader.new(:windows).load_resource("script", "Get-Help")
      _(resource.command).must_equal "Get-Help"
    end
    expect_deprecation(:resource_script) do
      resource = MockLoader.new(:macos10_10).load_resource("script", "Get-Help")
      _(resource.command).must_equal("pwsh -encodedCommand '#{base64_command}'")
    end
  end
end
