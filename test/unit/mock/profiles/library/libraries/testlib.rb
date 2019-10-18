# Library resource

require 'examplelib'
require 'hashie'

class Example < Inspec.resource(1)
  name 'example'
  include ExampleLib
  def enabled?
    true
  end
end
