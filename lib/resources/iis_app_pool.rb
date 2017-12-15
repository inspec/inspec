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
    @inspec = inspec

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
    iis_app_pool[:timeout].split[2]
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
    "iis_app_pool '#{@pool_path}'"
  end

  private

  def iis_app_pool
    return @cache unless @cache.nil?

    command = "Import-Module WebAdministration; Get-Item '#{@pool_path}' | Select-Object * | ConvertTo-Json"
    cmd = @inspec.command(command)

    begin
      pool = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      return {}
    end

    # map our values to a hash table
    info = {
      pool_name: pool['name'],
      version: pool['managedRuntimeVersion'],
      e32b: pool['enable32BitAppOnWin64'],
      mode: pool['managedPipelineMode'],
      processes: pool['processModel']['maxProcesses'],
      # Has to be a separate command to get "XX:XX:XX" format
      timeout: @inspec.command("Get-ItemProperty #{@pool_path} processmodel.idletimeout | select-object value").stdout,
      user_identity_type: pool['processModel']['identityType'],
      username: pool['processModel']['userName'],
    }

    @cache = info unless info.nil?
  end
end
