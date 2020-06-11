$LOAD_PATH << File.expand_path(File.join(File.dirname( __FILE__ ), "../lib"))

require 'libyajl2'

RSpec.configure do |c|

  c.order = 'random'

  c.expect_with :rspec do |c2|
    c2.syntax = :expect
  end

end
