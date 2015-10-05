# encoding: utf-8

# Usage:
# describe gem('rubocop') do
#   it { should be_installed }
# end
class GemPackage < Vulcano.resource(1)
  name 'gem'

  def initialize(package_name)
    @package_name = package_name
  end

  def info
    return @info if defined?(@info)

    cmd = vulcano.command("gem list --local -a -q \^#{@package_name}\$")
    @info = {
      installed: cmd.exit_status == 0,
      type: 'gem',
    }
    return @info unless @info[:installed]

    # extract package name and version
    # parses data like winrm (1.3.4, 1.3.3)
    params = /^\s*([^\(]*?)\s*\((.*?)\)\s*$/.match(cmd.stdout.chomp)
    versions = params[2].split(',')
    @info[:name] = params[1]
    @info[:version] = versions[0]
    @info
  end

  def installed?
    info[:installed] == true
  end

  def version
    info[:version]
  end

  def to_s
    "gem package #{@package_name}"
  end
end
