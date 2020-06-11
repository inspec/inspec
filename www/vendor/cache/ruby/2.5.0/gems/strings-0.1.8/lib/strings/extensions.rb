# frozen_string_literal: true

require_relative '../strings'

module Strings
  module Extensions
    refine String do
      def align(*args, **kws)
        Align.align(self, *args, **kws)
      end

      def align_left(*args, **kws)
        Align.align_left(self, *args, **kws)
      end

      def align_center(*args, **kws)
        Align.align_center(self, *args, **kws)
      end

      def align_right(*args, **kws)
        Align.align_right(self, *args, **kws)
      end

      def ansi?
        ANSI.ansi?(self)
      end

      def fold(*args)
        Fold.fold(self, *args)
      end

      def pad(*args, **kws)
        Pad.pad(self, *args, **kws)
      end

      def sanitize
        ANSI.sanitize(self)
      end

      def truncate(*args)
        Truncate.truncate(self, *args)
      end

      def wrap(*args, **kws)
        Wrap.wrap(self, *args, **kws)
      end
    end
  end # Extensions
end # Strings
