# encoding: utf-8
# author: Jonathan Morley

module Inspec::Resources
  class XmlConfig < JsonConfig
    name 'xml'
    desc 'Use the xml InSpec resource to test configuration data in an XML file'
    example "
      describe xml('default.xml') do
        its('key/sub_key') { should eq(['value']) }
        its(['root/name.with.a.period']) { should cmp 'so_many_dots' }
      end
    "

    def parse(content)
      require 'rexml/document'
      REXML::Document.new(content)
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse XML: #{e.message}"
    end

    def value(key)
      output = []
      REXML::XPath.each(@params, key.first.to_s) do |element|
        if element.is_a?(REXML::Attribute)
          output.push(element.to_s)
        elsif element.is_a?(REXML::Element)
          output.push(element.text)
        else
          raise Inspec::Exceptions::ResourceFailed, "Unknown XML object received (#{element.class}): #{element}"
        end
      end

      output
    end

    private

    # used by JsonConfig to build up a full to_s method
    # based on whether a file path, content, or command was supplied.
    def resource_base_name
      'XML'
    end
  end
end
