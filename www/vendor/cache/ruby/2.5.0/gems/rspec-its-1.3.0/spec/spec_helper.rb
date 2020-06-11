require 'rspec/its'

Dir['./spec/support/**/*'].each {|f| require f}

class NullFormatter
  private
  def method_missing(method, *args, &block)
    # ignore
  end
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
