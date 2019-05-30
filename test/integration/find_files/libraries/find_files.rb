# Custom resource for Utils::FindFIles
class TestFindFiles < Inspec.resource(1)
  name 'test_find_files'

  desc "
    Resource used for testing the funcitonality of Utils::FindFiles
  "

  example "
    describe test_find_files('/some/filepath') do
      its('results') { should include 'somefile.conf' }
    end
  "

  require 'inspec/utils/find_files'
  include FindFiles

  attr_reader :results

  def initialize(path)
    @results = find_files(path)
  end
end
