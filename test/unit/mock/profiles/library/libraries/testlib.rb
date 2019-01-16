# Library resource

require "gordonlib"
require "hashie"

class Gordon < Inspec.resource(1)
  name "gordon"
  include GordonLib
  def enabled?
    true
  end
end
