# encoding: utf-8

module Train::Platforms
  module Common
    # Add a family connection. This will create a family
    # if it does not exist and add a child relationship.
    def in_family(family)
      if self.class == Train::Platforms::Family && @name == family
        raise "Unable to add family #{@name} to itself: '#{@name}.in_family(#{family})'"
      end

      # add family to the family list
      family = Train::Platforms.family(family)
      family.children[self] = @condition

      @families[family] = @condition
      @condition = nil
      self
    end

    def detect(&block)
      @detect = block if block

      # TODO: detect shouldn't be a setter and getter at the same time
      @detect ||= ->(_) { false }
    end

    def to_s
      be = backend ? backend.backend_type : "unknown"
      "%s:%s:%s" % [self.class, be, name]
    end

    def inspect
      to_s
    end
  end
end
