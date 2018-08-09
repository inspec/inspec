# encoding: utf-8
# frozen_string_literal: true
# check for web applications in IIS
# Note: this is only supported in windows 2012 and later

class IisAppPool < Inspec.resource(1)
  name 'iis_app_pool'
  desc 'Tests IIS application pool configuration on windows.'
  example "
    describe iis_app_pool('DefaultAppPool') do
      it { should exist }
      its('enable32bit') { should cmp 'True' }
      its('runtime_version') { should eq 'v4.0' }
      its('pipeline_mode') { should eq 'Integrated' }
    end
  "

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
    "iis_app_pool '#{@pool_name}'"
  end

  private

  # I cannot think of a way to shorten this method
  # rubocop:disable Metrics/AbcSize
  def iis_app_pool
    return @cache unless @cache.nil?

    command = "Import-Module WebAdministration; Get-Item '#{@pool_path}' | Select-Object * | ConvertTo-Json"
    cmd = inspec.command(command)

    begin
      pool = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      raise Inspec::Exceptions::ResourceFailed, 'Unable to parse app pool JSON'
    end

    # map our values to a hash table
    @cache = {
      pool_name: pool['name'],
      version: pool['managedRuntimeVersion'],
      e32b: pool['enable32BitAppOnWin64'],
      mode: pool['managedPipelineMode'],
      processes: pool['processModel']['maxProcesses'],
      timeout: "#{pool['processModel']['idleTimeout']['Hours']}:#{pool['processModel']['idleTimeout']['Minutes']}:#{pool['processModel']['idleTimeout']['Seconds']}",
      timeout_days: pool['processModel']['idleTimeout']['Days'],
      timeout_hours: pool['processModel']['idleTimeout']['Hours'],
      timeout_minutes: pool['processModel']['idleTimeout']['Minutes'],
      timeout_seconds: pool['processModel']['idleTimeout']['Seconds'],
      user_identity_type: pool['processModel']['identityType'],
      username: pool['processModel']['userName'],
    }
  end
  # rubocop:enable Metrics/AbcSize
end
