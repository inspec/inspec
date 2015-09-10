# encoding: utf-8

# Usage:
# describe npm('bower') do
#   it { should be_installed }
# end
class NpmPackage < Vulcano.resource(1)
  name 'npm'

  def initialize(package_name)
    @package_name = package_name
    @cache = nil
  end

  def info
    return @cache if !@cache.nil?
    cmd = vulcano.run_command("npm ls -g --json #{@package_name}")
    return nil if cmd.exit_status != 0
    pkgs = JSON.parse(cmd.stdout)
    @cache = {
      name: @package_name,
      version: pkgs['dependencies'][@package_name]['version'],
      type: 'npm',
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
    "npm package #{@package_name}"
  end
end
