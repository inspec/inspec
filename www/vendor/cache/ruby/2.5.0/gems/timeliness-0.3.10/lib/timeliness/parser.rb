module Timeliness
  module Parser
    class MissingTimezoneSupport < StandardError; end

    class << self

      def parse(value, *args)
        return value if acts_like_temporal?(value)
        return nil unless parseable?(value)

        type, options = type_and_options_from_args(args)

        time_array = _parse(value, type, options)
        return nil if time_array.nil?

        default_values_by_type(time_array, type, options) unless type == :datetime

        make_time(time_array[0..7], options[:zone])
      rescue NoMethodError => ex
        raise ex unless ex.message =~ /undefined method `(zone|use_zone|current)' for Time:Class/
        raise MissingTimezoneSupport, "ActiveSupport timezone support must be loaded to use timezones other than :utc and :local."
      end

      def make_time(time_array, zone_option=nil)
        return nil unless fast_date_valid_with_fallback(*time_array[0..2])

        zone, offset = zone_and_offset(time_array[7]) if time_array[7]

        value = create_time_in_zone(time_array[0..6].compact, zone || zone_option)
        value = shift_time_to_zone(value, zone_option) if zone
        return nil unless value

        offset ? value + (value.utc_offset - offset) : value
      rescue ArgumentError, TypeError
        nil
      end

      def _parse(string, type=nil, options={})
        if options[:strict] && type
          Definitions.send("#{type}_format_set").match(string, options[:format])
        else
          values = nil
          Definitions.format_sets(type, string).find {|set| values = set.match(string, options[:format]) }
          values
        end
      rescue
        nil
      end

      private

      def parseable?(value)
        value.is_a?(String)
      end

      def acts_like_temporal?(value)
        value.is_a?(Time) || value.is_a?(Date) || value.respond_to?(:acts_like_date?) || value.respond_to?(:acts_like_time?)
      end

      def type_and_options_from_args(args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        type_or_now = args.first
        if type_or_now.is_a?(Symbol)
          type = type_or_now
        elsif type_or_now
          options[:now] = type_or_now
        end
        return type, options
      end

      def default_values_by_type(values, type, options)
        case type
        when :date
          values[3..7] = nil
        when :time
          values[0..2] = current_date(options)
        when nil
          dummy_date = current_date(options)
          values[0] ||= dummy_date[0]
          values[1] ||= dummy_date[1] unless values.values_at(0,2).all?
          values[2] ||= dummy_date[2]
        end
      end

      def current_date(options)
        now = if options[:now]
          options[:now]
        elsif options[:zone]
          current_time_in_zone(options[:zone])
        else
          evaluate_date_for_time_type
        end
        now.is_a?(Array) ? now[0..2] : [now.year, now.month, now.day]
      end

      def current_time_in_zone(zone)
        case zone
        when :utc, :local
          Time.now.send("get#{zone}")
        when :current
          Time.current
        else
          Time.use_zone(zone) { Time.current }
        end
      end

      def shift_time_to_zone(time, zone=nil)
        zone ||= Timeliness.default_timezone
        case zone
        when :utc, :local
          time.send("get#{zone}")
        when :current
          time.in_time_zone
        else
          Time.use_zone(zone) { time.in_time_zone }
        end
      end

      def create_time_in_zone(time_array, zone=nil)
        zone ||= Timeliness.default_timezone
        case zone
        when :utc, :local
          time_with_datetime_fallback(zone, *time_array)
        when :current
          Time.zone.local(*time_array)
        else
          Time.use_zone(zone) { Time.zone.local(*time_array) }
        end
      end

      def zone_and_offset(parsed_value)
        if parsed_value.is_a?(String)
          zone   = Definitions.timezone_mapping[parsed_value] || parsed_value
        else
          offset = parsed_value
        end
        return zone, offset
      end

      # Taken from ActiveSupport and simplified
      def time_with_datetime_fallback(utc_or_local, year, month=1, day=1, hour=0, min=0, sec=0, usec=0)
        return nil if hour > 23 || min > 59 || sec > 59
        ::Time.send(utc_or_local, year, month, day, hour, min, sec, usec)
      rescue
        offset = utc_or_local == :local ? (::Time.local(2007).utc_offset.to_r/86400) : 0
        ::DateTime.civil(year, month, day, hour, min, sec, offset)
      end

      # Enforce strict date part validity which the Time class does not.
      # Only does full date check if month and day are possibly invalid.
      def fast_date_valid_with_fallback(year, month, day)
        month && month < 13 && (day < 29 || Date.valid_civil?(year, month, day))
      end

      def evaluate_date_for_time_type
        case Timeliness.date_for_time_type
        when Array
          Timeliness.date_for_time_type
        when Proc
          v = Timeliness.date_for_time_type.call
          [v.year, v.month, v.day]
        end
      end

    end

  end
end
