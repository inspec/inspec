# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'utils/simpleconfig'

class SshConf < Vulcano.resource(1)
  name 'ssh_config'

  def initialize(conf_path = nil, type = nil)
    @conf_path = conf_path || '/etc/ssh/ssh_config'
    typename = ( @conf_path.include?('sshd') ? 'Server' : 'Client' )
    @type = type || "SSH #{typename} configuration #{conf_path}"
    read_content
  end

  def to_s
    @type
  end

  def content
    @conf.content
  end

  def params(*opts)
    res = @params
    opts.each do |opt|
      res = res[opt] unless res.nil?
    end
    res
  end

  def method_missing(name)
    @params[name.to_s]
  end

  private

  def read_content
    @conf = vulcano.file(@conf_path)
    # read the file
    if !@conf.file?
      return skip_resource "Can't find file \"#{@conf_path}\""
    end

    if @conf.content.empty? && @conf.size > 0
      return skip_resource "Can't read file \"#{@conf_path}\""
    end

    # parse the file
    @params = SimpleConfig.new(@conf.content,
      assignment_re: /^\s*(\S+?)\s+(.*?)\s*$/,
      multiple_values: false
    ).params
  end

end

class SshdConf < SshConf
  name 'sshd_config'

  def initialize(path = nil)
    super(path || '/etc/ssh/sshd_config')
  end
end
