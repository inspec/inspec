module RSpec
  module Its
    # This is from the gem rspec-its.  We can just alias.
    alias their its
  end
end

module RSpec
  module Core
    class ExampleGroup
      # Can't just alias here, the methods are all handled by special macros.
      # See https://github.com/rspec/rspec-core/blob/master/lib/rspec/core/example_group.rb#L158
      define_example_method :they
    end
  end
end
