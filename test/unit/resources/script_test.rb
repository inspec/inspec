# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Script' do

  ps1_script = <<-EOH
    # call help for get command
    Get-Help Get-Command
  EOH

  it 'check if script for windows is properly generated ' do
    resource = MockLoader.new(:windows).load_resource('script', ps1_script)
    _(resource.command).must_equal 'powershell -encodedCommand IAAgACAAIAAjACAAYwBhAGwAbAAgAGgAZQBsAHAAIABmAG8AcgAgAGcAZQB0ACAAYwBvAG0AbQBhAG4AZAAKACAAIAAgACAARwBlAHQALQBIAGUAbABwACAARwBlAHQALQBDAG8AbQBtAGEAbgBkAAoA'
  end
end
