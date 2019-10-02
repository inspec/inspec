module Inspec::Resources
  class Noop < Inspec.resource(1)
    name "noop"

    def to_s
      "No-op"
    end
  end
end
