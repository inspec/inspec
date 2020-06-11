require "cgi"
require "date"

module Gyoku
  module XMLValue
    class << self

      # xs:date format
      XS_DATE_FORMAT = "%Y-%m-%d"

      # xs:time format
      XS_TIME_FORMAT = "%H:%M:%S"

      # xs:dateTime format
      XS_DATETIME_FORMAT = "%Y-%m-%dT%H:%M:%S%Z"

      # Converts a given +object+ to an XML value.
      def create(object, escape_xml = true, options = {})
        if Time === object
          object.strftime XS_TIME_FORMAT
        elsif DateTime === object
          object.strftime XS_DATETIME_FORMAT
        elsif Date === object
          object.strftime XS_DATE_FORMAT
        elsif String === object
          escape_xml ? CGI.escapeHTML(object) : object
        elsif object.respond_to?(:to_datetime)
          create object.to_datetime
        elsif object.respond_to?(:call)
          create object.call
        elsif ::Hash === object
          Gyoku::Hash.to_xml(object, options)
        else
          object.to_s
        end
      end

    end
  end
end
