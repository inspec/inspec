module Gyoku
  module XMLKey
    class << self

      CAMELCASE       = lambda { |key| key.gsub(/\/(.?)/) { |m| "::#{m.split('').last.upcase}" }.gsub(/(?:^|_)(.)/) { |m| m.split('').last.upcase } }
      LOWER_CAMELCASE = lambda { |key| key[0].chr.downcase + CAMELCASE.call(key)[1..-1] }
      UPCASE          = lambda { |key| key.upcase }

      FORMULAS = {
        :lower_camelcase => lambda { |key| LOWER_CAMELCASE.call(key) },
        :camelcase       => lambda { |key| CAMELCASE.call(key) },
        :upcase          => lambda { |key| UPCASE.call(key) },
        :none            => lambda { |key| key }
      }

      # Converts a given +object+ with +options+ to an XML key.
      def create(key, options = {})
        xml_key = chop_special_characters key.to_s

        if unqualified = unqualify?(xml_key)
          xml_key = xml_key.split(":").last
        end

        xml_key = key_converter(options, xml_key).call(xml_key) if Symbol === key

        if !unqualified && qualify?(options) && !xml_key.include?(":")
          xml_key = "#{options[:namespace]}:#{xml_key}"
        end

        xml_key
      end

    private

      # Returns the formula for converting Symbol keys.
      def key_converter(options, xml_key)
        return options[:key_converter] if options[:key_converter].is_a? Proc

        defined_key = options[:key_to_convert]
        if (defined_key != nil) && (defined_key == xml_key)
          key_converter = options[:key_converter]
        elsif defined_key != nil
          key_converter = :lower_camelcase
        elsif (options[:except] == xml_key)
          key_converter = :lower_camelcase
        else
          key_converter = options[:key_converter] || :lower_camelcase
        end
        FORMULAS[key_converter]
      end

      # Chops special characters from the end of a given +string+.
      def chop_special_characters(string)
        ["!", "/"].include?(string[-1, 1]) ? string.chop : string
      end

      # Returns whether to remove the namespace from a given +key+.
      def unqualify?(key)
        key[0, 1] == ":"
      end

      # Returns whether to namespace all keys (elementFormDefault).
      def qualify?(options)
        options[:element_form_default] == :qualified && options[:namespace]
      end

    end
  end
end
