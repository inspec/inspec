module Regexp::Expression

  class Root < Regexp::Expression::Subexpression
    # TODO: this override is here for backwards compatibility, remove in 2.0.0
    def initialize(*args)
      unless args.first.is_a?(Regexp::Token)
        warn('WARNING: Root.new without a Token argument is deprecated and '\
             'will be removed in 2.0.0. Use Root.build for the old behavior.')
        return super(self.class.build_token, *args)
      end
      super
    end

    class << self
      def build(options = {})
        new(build_token, options)
      end

      def build_token
        Regexp::Token.new(:expression, :root, '', 0)
      end
    end
  end
end
