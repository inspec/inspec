require "builder"

require "gyoku/hash"
require "gyoku/xml_value"

module Gyoku
  class Array

    NESTED_ELEMENT_NAME = "element"

    # Translates a given +array+ to XML. Accepts the XML +key+ to add the elements to,
    # whether to +escape_xml+ and an optional Hash of +attributes+.
    def self.to_xml(array, key, escape_xml = true, attributes = {}, options = {})

      self_closing = options.delete(:self_closing)
      unwrap = options[:unwrap] || false 

      iterate_with_xml array, key, attributes, options do |xml, item, attrs, index|
        if self_closing
          xml.tag!(key, attrs)
        else
          case item
            when ::Hash       then 
              if unwrap
                xml << Hash.to_xml(item, options)
              else
                xml.tag!(key, attrs) { xml << Hash.to_xml(item, options) }
              end
            when ::Array      then 
              xml.tag!(key, attrs) { xml << Array.to_xml(item, NESTED_ELEMENT_NAME) }
            when NilClass     then 
              xml.tag!(key, "xsi:nil" => "true")
            else              
              xml.tag!(key, attrs) { xml << XMLValue.create(item, escape_xml) }
          end
        end
      end
    end

  private

    # Iterates over a given +array+ with a Hash of +attributes+ and yields a builder +xml+
    # instance, the current +item+, any XML +attributes+ and the current +index+.
    def self.iterate_with_xml(array, key, attributes, options, &block)

      xml = Builder::XmlMarkup.new
      unwrap = options[:unwrap] || false

      if (unwrap)
        xml.tag!(key) { iterate_array(xml, array, attributes, &block) }
      else
        iterate_array(xml, array, attributes, &block)
      end

      xml.target!
    end


    # Iterates over a given +array+ with a Hash of +attributes+ and yields a builder +xml+
    # instance, the current +item+, any XML +attributes+ and the current +index+.
    def self.iterate_array(xml, array, attributes, &block)
      array.each_with_index do |item, index|
        if item.respond_to?(:keys)
          attrs = item.reduce({}) do |st, v|
            k = v[0].to_s
            st[k[1..-1]] = v[1].to_s if k =~ /^@/
            st
          end
        else
          attrs = {}
        end
        yield xml, item, tag_attributes(attributes, index).merge(attrs), index
      end
    end


    # Takes a Hash of +attributes+ and the +index+ for which to return attributes
    # for duplicate tags.
    def self.tag_attributes(attributes, index)
      return {} if attributes.empty?

      attributes.inject({}) do |hash, (key, value)|
        value = value[index] if value.kind_of? ::Array
        value ? hash.merge(key => value) : hash
      end
    end

  end
end
