# frozen_string_literal: true

require 'inspec/resources/powershell'

# check for web applications in IIS
# Note: this is only supported in windows 2012 and later

class IisAppPool < Inspec.resource(1)
  name 'iis_app_pool'
  desc 'Tests IIS application pool configuration on windows.'
  supports platform: 'windows'
  example <<~EXAMPLE
    describe iis_app_pool('DefaultAppPool') do
      it { should exist }
      its('enable32bit') { should cmp 'True' }
      its('runtime_version') { should eq 'v4.0' }
      its('pipeline_mode') { should eq 'Integrated' }
    end
  EXAMPLE

  def initialize(pool_name)
    @pool_name = pool_name
    @pool_path = "IIS:\\AppPools\\#{@pool_name}"
    @cache = nil

    # verify that this resource is only supported on Windows
    return skip_resource 'The `iis_app_pool` resource is not supported on your OS.' unless inspec.os.windows?
  end

  def pool_name
    iis_app_pool[:pool_name]
  end

  def runtime_version
    iis_app_pool[:version]
  end

  def enable32bit
    iis_app_pool[:e32b]
  end

  def pipeline_mode
    iis_app_pool[:mode]
  end

  def max_processes
    iis_app_pool[:processes]
  end

  def timeout
    iis_app_pool[:timeout]
  end

  def timeout_days
    iis_app_pool[:timeout_days]
  end

  def timeout_hours
    iis_app_pool[:timeout_hours]
  end

  def timeout_minutes
    iis_app_pool[:timeout_minutes]
  end

  def timeout_seconds
    iis_app_pool[:timeout_seconds]
  end

  def user_identity_type
    iis_app_pool[:user_identity_type]
  end

  def username
    iis_app_pool[:username]
  end

  def exists?
    !iis_app_pool[:pool_name].empty?
  end

  def to_s
    "IIS App Pool '#{@pool_name}'"
  end

  private

  def iis_app_pool
    return @cache unless @cache.nil?

    # We use `-Compress` here to avoid a bug in PowerShell
    # It does not affect validity of the output, only the representation
    # See: https://github.com/inspec/inspec/pull/3842
    script = <<~EOH
      Import-Module WebAdministration
      If (Test-Path '#{@pool_path}') {
        Get-Item '#{@pool_path}' | Select-Object * | ConvertTo-Json -Compress
      } Else {
        Write-Host '{}'
      }
    EOH
    cmd = inspec.powershell(script)

    begin
      pool = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      raise Inspec::Exceptions::ResourceFailed, 'Unable to parse app pool JSON'
    end

    process_model = pool.fetch('processModel', {})
    idle_timeout = process_model.fetch('idleTimeout', {})

    # map our values to a hash table
    @cache = {
      pool_name: pool['name'],
      version: pool['managedRuntimeVersion'],
      e32b: pool['enable32BitAppOnWin64'],
      mode: pool['managedPipelineMode'],
      processes: process_model['maxProcesses'],
      timeout: "#{idle_timeout['Hours']}:#{idle_timeout['Minutes']}:#{idle_timeout['Seconds']}",
      timeout_days: idle_timeout['Days'],
      timeout_hours: idle_timeout['Hours'],
      timeout_minutes: idle_timeout['Minutes'],
      timeout_seconds: idle_timeout['Seconds'],
      user_identity_type: process_model['identityType'],
      username: process_model['userName'],
    }
  end
end
