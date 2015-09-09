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
    cmd = vulcano.run_command("gem list --local -a -q \^#{@package_name}\$")
    return nil if cmd.exit_status != 0

    # extract package name and version
    # parses data like winrm (1.3.4, 1.3.3)
    params = /^\s*([^\(]*?)\s*\((.*?)\)\s*$/.match(cmd.stdout.chomp)
    versions = params[2].split(',')
    @cache = {
      name: params[1],
      version: versions[0],
      type: 'gem',
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
    "pip package #{@package_name}"
  end
end
