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
    return @info if defined?(@info)

    @info = {}
    @info[:type] = 'pip'

    cmd = vulcano.run_command("pip show #{@package_name}")
    return @info if cmd.exit_status != 0

    params = SimpleConfig.new(
      cmd.stdout,
      assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
      multiple_values: false,
    ).params
    @info[:name] = params['Name']
    @info[:version] = params['Version']
    @info[:installed] = true
    @info
  end

  def installed?
    info[:installed] == true
  end

  def version
    info[:version]
  end

  def to_s
    "pip package  #{@package_name}"
  end
end
