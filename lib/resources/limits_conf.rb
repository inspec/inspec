# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

require 'utils/simpleconfig'

# Usage:
#
# describe limits_conf do
#   its('*') { should include ['hard','core','0'] }
# end

class LimitsConf < Vulcano.resource(1)
  name 'limits_conf'

  def initialize(path = nil)
    @conf_path = path || '/etc/security/limits.conf'
  end

  def to_s
    'limits_conf'
  end

  def method_missing(name)
    read_params[name.to_s]
  end

  def read_params
    return @params if defined?(@params)

    # read the file
    file = vulcano.file(@conf_path)
    if !file.file?
      skip_resource "Can't find file \"#{@conf_path}\""
      return @params = {}
    end

    content = file.content
    if content.empty? && file.size > 0
      skip_resource "Can't read file \"#{@conf_path}\""
      return @params = {}
    end

    # parse the file
    conf = SimpleConfig.new(
      content,
      assignment_re: /^\s*(\S+?)\s+(.*?)\s+(.*?)\s+(.*?)\s*$/,
      key_vals: 3,
      multiple_values: true,
    )
    @params = conf.params
  end
end
