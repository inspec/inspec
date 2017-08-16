# encoding: utf-8
# author: Matthew Dromazos

require 'utils/SimpleConfig'
require 'utils/parser'
class AuthConfig < Inspec.resource(1)
  name 'authconfig'
  desc 'Use the authconfig InSpec audit resource '
  example "
  "

  attr_reader :params

  def initialize(host_path = nil)
    return skip_resource 'The `authconfig` resource is not supported on your OS.' unless inspec.os.linux? || inspec.os.windows?
    @conf_path = host_path || '/etc/sysconfig/authconfig'
    @content = nil
    @params = nil
    read_content
  end

  def installed?
    inspec.package('authconfig').installed?
  end

  def method_missing(name)
    @params[name.to_s]
  end

  def smartcard_authen_enabled?
    return 'The `authconfig` resource is not installed on your machine.' unless installed?
    result = authconfig_command("authconfig --test | grep -i \"smartcard for login is\" | awk '{ print $NF }'")
    return result unless result.match?(/^Error.+/)
    result == 'enabled'
  end

  def smartcard_removal_action
    return 'The `authconfig` resource is not installed on your machine.' unless installed?
    authconfig_command("authconfig --test | grep -i 'smartcard removal action' | awk \'{ print $NF }\'")[1..-3]
  end

  private

  def read_content
    @content = ''
    @params = {}
    @content = read_file(@conf_path)
    @params = read_params(@content)
  end

  def read_params(content)
    # parse the file
    conf = SimpleConfig.new(
      content,
    )
    @params = conf.params
  end

  def read_file(conf_path = @conf_path)
    file = inspec.file(conf_path)
    if !file.file?
      return skip_resource "Can't find file. \"#{@conf_path}\""
    end

    raw_conf = file.content
    if raw_conf.empty? && !file.empty?
      return skip_resource("File is empty.\"#{@conf_path}\"")
    end
    inspec.file(conf_path).content
  end

  def authconfig_command(command)
    result = inspec.command(command)
    if result.stderr != ''
      return "Error on command #{command}: #{result.stderr}"
    end
    result.stdout
  end
end
