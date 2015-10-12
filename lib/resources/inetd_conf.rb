# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

require 'utils/simpleconfig'

# Usage:
#
# describe inetd_conf do
#   its('shell') { should eq nil }
#   its('login') { should eq nil }
#   its('exec') { should eq nil }
# end

class InetdConf < Vulcano.resource(1)
  name 'inetd_config'

  def initialize(path = nil)
    @conf_path = path || '/etc/inetd.conf'
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
      assignment_re: /^\s*(\S+?)\s+(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s*$/,
      key_vals: 6,
      multiple_values: false,
    )
    @params = conf.params
  end

  def to_s
    'inetd.conf'
  end
end
