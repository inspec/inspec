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
    if Gem.loaded_specs['winrm'].version < Gem::Version.new('1.6.1')
      _(resource.command).must_equal 'powershell -encodedCommand IAAgACAAIAAjACAAYwBhAGwAbAAgAGgAZQBsAHAAIABmAG8AcgAgAGcAZQB0ACAAYwBvAG0AbQBhAG4AZAAKACAAIAAgACAARwBlAHQALQBIAGUAbABwACAARwBlAHQALQBDAG8AbQBtAGEAbgBkAAoA'
    else
      _(resource.command).must_equal 'powershell -encodedCommand JABQAHIAbwBnAHIAZQBzAHMAUAByAGUAZgBlAHIAZQBuAGMAZQA9ACcAUwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQAnADsAIAAgACAAIAAjACAAYwBhAGwAbAAgAGgAZQBsAHAAIABmAG8AcgAgAGcAZQB0ACAAYwBvAG0AbQBhAG4AZAAKACAAIAAgACAARwBlAHQALQBIAGUAbABwACAARwBlAHQALQBDAG8AbQBtAGEAbgBkAAoA'
    end
  end

  it 'check if legacy `script` for windows is properly generated ' do
    resource = MockLoader.new(:windows).load_resource('script', ps1_script)
    if Gem.loaded_specs['winrm'].version < Gem::Version.new('1.6.1')
      _(resource.command).must_equal 'powershell -encodedCommand IAAgACAAIAAjACAAYwBhAGwAbAAgAGgAZQBsAHAAIABmAG8AcgAgAGcAZQB0ACAAYwBvAG0AbQBhAG4AZAAKACAAIAAgACAARwBlAHQALQBIAGUAbABwACAARwBlAHQALQBDAG8AbQBtAGEAbgBkAAoA'
    else
      _(resource.command).must_equal 'powershell -encodedCommand JABQAHIAbwBnAHIAZQBzAHMAUAByAGUAZgBlAHIAZQBuAGMAZQA9ACcAUwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQAnADsAIAAgACAAIAAjACAAYwBhAGwAbAAgAGgAZQBsAHAAIABmAG8AcgAgAGcAZQB0ACAAYwBvAG0AbQBhAG4AZAAKACAAIAAgACAARwBlAHQALQBIAGUAbABwACAARwBlAHQALQBDAG8AbQBtAGEAbgBkAAoA'
    end
  end
end
