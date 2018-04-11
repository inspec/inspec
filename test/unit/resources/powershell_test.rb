# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::PowershellScript' do
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

  it 'properly generates command if deprecated `script` is used on Windows' do
    Inspec::Resources::LegacyPowershellScript.any_instance.stubs(:deprecated)
    resource = MockLoader.new(:windows).load_resource('script', 'Get-Help')
    _(resource.command).must_equal 'Get-Help'

    resource = MockLoader.new(:osx104).load_resource('script', 'Get-Help')
    _(resource.command).must_equal("pwsh -encodedCommand '#{base64_command}'")
  end
end
