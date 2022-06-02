module Inspec::Resources
  class Noop < Inspec.resource(1)
    name "noop"

    def resource_id
      "No-op"
    end

    def to_s
      "No-op"
    end
  end
end
