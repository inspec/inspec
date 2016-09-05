# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Powershell' do

  ps1_script = <<-EOH
    # call help for get command
    Get-Help Get-Command
  EOH

  it 'check if `powershell` for windows is properly generated ' do
    resource = MockLoader.new(:windows).load_resource('powershell', ps1_script)
    # string should be the same
    _(resource.command.to_s).must_equal ps1_script
  end

  it 'check if legacy `script` for windows is properly generated ' do
    resource = MockLoader.new(:windows).load_resource('script', ps1_script)
    # string should be the same
    _(resource.command.to_s).must_equal ps1_script
  end
end
