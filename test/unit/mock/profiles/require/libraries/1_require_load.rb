# encoding: utf-8
require '3_dependency'

class RequireResource < Inspec.resource(1)
  name 'require_load'

  desc "
    tests inspec `require`
  "

  example "
    describe require_load do
      it { should be_working }
    end
  "

  def initialize(opts = {})

  end

  def working?
    Dependency::dep_method
  end


  def to_s
    "require load tester"
  end
end
