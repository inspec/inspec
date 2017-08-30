# encoding: utf-8
# author: Jonathan Morley

module Inspec::Resources
  class XmlConfig < JsonConfig
    name 'xml'
    desc 'Use the xml InSpec resource to test configuration data in an XML file'
    example "
      describe xml('default.xml') do
        its('key/sub_key') { should eq(['value']) }
      end
    "

    def parse(content)
      require 'nokogiri'
      Nokogiri::XML(content)
    end

    def value(key)
      @params.xpath(key.first.to_s).map(&:text)
    end

    def to_s
      "XML #{@path}"
    end
  end
end
