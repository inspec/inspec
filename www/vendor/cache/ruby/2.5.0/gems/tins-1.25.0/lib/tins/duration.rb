module Tins
  class Duration
    include Comparable

    def initialize(seconds)
      @negative = seconds < 0
      seconds = seconds.abs
      @original_seconds = seconds
      @days, @hours, @minutes, @seconds, @fractional_seconds =
        [ 86_400, 3600, 60, 1, 0 ].inject([ [], seconds ]) {|(r, s), d|
          if d > 0
            dd, rest = s.divmod(d)
            r << dd
            [ r, rest ]
          else
            r << s
          end
        }
    end

    def to_f
      @original_seconds.to_f
    end

    def <=>(other)
      to_f <=> other.to_f
    end

    def negative?
      @negative
    end

    def days?
      @days > 0
    end

    def hours?
      @hours > 0
    end

    def minutes?
      @minutes > 0
    end

    def seconds?
      @seconds > 0
    end

    def fractional_seconds?
      @fractional_seconds > 0
    end

    def format(template = '%S%d+%h:%m:%s.%f', precision: nil)
      result = template.gsub(/%[DdhmSs]/) { |directive|
        case directive
        when '%S' then ?- if negative?
        when '%d' then @days
        when '%h' then '%02u' % @hours
        when '%m' then '%02u' % @minutes
        when '%s' then '%02u' % @seconds
        when '%D' then format_smart
        end
      }
      if result.include?('%f')
        if precision
          fractional_seconds = "%.#{precision}f" % @fractional_seconds
        else
          fractional_seconds = '%f' % @fractional_seconds
        end
        result.gsub!('%f', fractional_seconds[2..-1])
      end
      result
    end

    def to_s
      format_smart
    end

    private

    def format_smart
      template  = '%h:%m:%s'
      precision = nil
      if days?
        template.prepend '%d+'
      end
      if fractional_seconds?
        template << '.%f'
        precision = 3
      end
      template.prepend '%S'
      format template, precision: precision
    end
  end
end
