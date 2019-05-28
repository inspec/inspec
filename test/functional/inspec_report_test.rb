require 'functional/helper'

describe 'inspec report tests' do
  include FunctionalHelper

  describe 'report' do
    it 'loads a json report' do
      o = { 'reporter' => ['json'], 'report' => true }
      runner = ::Inspec::Runner.new(o)
      runner.add_target(example_profile)
      runner.run
      runner.report.count.must_equal 4
      runner.report.inspect.must_include ':title=>"InSpec Example Profile"'
      runner.report.inspect.must_include ':status=>"passed"'
    end

    it 'loads a json report twice' do
      skip "this doesn't work yet, but I'd like to poke at it"

      o = { 'reporter' => ['json'], 'report' => true }
      runner = ::Inspec::Runner.new(o)
      runner.add_target(example_profile)
      runner.run
      runner.report.count.must_equal 4
      runner.report.inspect.must_include ':title=>"InSpec Example Profile"'
      runner.report.inspect.must_include ':status=>"passed"'
    end

    # Due to the way we require/use rspec, you can only run one runner.
    # You have to reload rspec to run another.
  end
end
