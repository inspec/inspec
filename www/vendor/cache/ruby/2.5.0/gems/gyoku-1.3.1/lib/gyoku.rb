require "gyoku/version"
require "gyoku/hash"

module Gyoku

  # Converts a given Hash +key+ with +options+ into an XML tag.
  def self.xml_tag(key, options = {})
    XMLKey.create(key, options)
  end

  # Translates a given +hash+ with +options+ to XML.
  def self.xml(hash, options = {})
    Hash.to_xml hash.dup, options
  end

end
