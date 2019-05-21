
require 'helper'

describe 'Inspec::Resources::Powershell' do
  let(:base64_command) {
    # Encoded version of `$ProgressPreference='SilentlyContinue';Get-Help`
    'JABQAHIAbwBnAHIAZQBzAHMAUAByAGUAZgBlAHIAZQBuAGMAZQA9ACcAUwBpAGwA' \
    'ZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQAnADsARwBlAHQALQBIAGUAbABwAA=='
  }

  it 'properly generates command' do
    resource = MockLoader.new(:windows).load_resource('powershell', 'Get-Help')
    _(resource.command).must_equal 'Get-Help'

    resource = MockLoader.new(:osx104).load_resource('powershell', 'Get-Help')
    _(resource.command).must_equal("pwsh -encodedCommand '#{base64_command}'")
  end

  it 'properly generates command if deprecated `script` is used' do
    expect_deprecation(:resource_script) do
      resource = MockLoader.new(:windows).load_resource('script', 'Get-Help')
      _(resource.command).must_equal 'Get-Help'
    end
    expect_deprecation(:resource_script) do
      resource = MockLoader.new(:osx104).load_resource('script', 'Get-Help')
      _(resource.command).must_equal("pwsh -encodedCommand '#{base64_command}'")
    end
  end
end
