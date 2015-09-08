# encoding: utf-8

# Usage:
# describe pip('Jinja2') do
#   it { should be_installed }
# end
class PipPackage < Vulcano.resource(1)
  name 'pip'

  def initialize(package_name)
    @package_name = package_name
  end

  def info
    cmd = vulcano.run_command("pip show #{@package_name}")
    return nil if cmd.exit_status != 0

    params = SimpleConfig.new(
      cmd.stdout,
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: false
    ).params
    @cache = {
      name: params['Name'],
      installed: true,
      version: params['Version'],
      type: 'pip'
    }
  end

  def installed?
    !info.nil?
  end

  def version
    return nil if info.nil?
    info[:version]
  end

  def to_s
    "pip package  #{@package_name}"
  end
end
