unless (1..4).cover?(2..3)
  require 'backports/tools/alias_method_chain'

  class Range
    def cover_with_range_compatibility?(what)
      return cover_without_range_compatibility?(what) unless what.is_a?(Range)

      left = self.begin <=> what.begin
      right = self.end <=> what.end
      return false unless left && right

      left <= 0 && (
        right >= 1 ||
        right == 0 && (!exclude_end? || what.exclude_end?) ||
        what.exclude_end? && what.begin.is_a?(Integer) &&
          what.end.is_a?(Integer) && cover_without_range_compatibility?(what.end - 1)
      )
    end
    Backports.alias_method_chain self, :cover?, :range_compatibility
  end

end
