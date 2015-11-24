# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/simpleconfig'

# Parses a ini file
# Usage:
# descibe ini do
#   its("auth_protocol") { should eq "https" }
# end
class IniConfig < JsonConfig
  name 'ini'

  # override file load and parse hash with simple config
  def parse(content)
    SimpleConfig.new(content).params
  end

  def to_s
    "INI #{@path}"
  end
end
