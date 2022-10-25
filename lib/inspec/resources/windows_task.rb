require "inspec/resources/powershell"

module Inspec::Resources
  class WindowsTasks < Inspec.resource(1) # TODO: rename singular
    name "windows_task"
    supports platform: "windows"
    desc "Use the windows_task InSpec audit resource to test task schedules on Microsoft Windows."
    example <<~EXAMPLE
      describe windows_task('\\Microsoft\\Windows\\Time Synchronization\\SynchronizeTime') do
        it { should be_enabled }
      end

      describe windows_task('\\Microsoft\\Windows\\AppID\\PolicyConverter') do
        it { should be_disabled }
      end

      describe windows_task('\\Microsoft\\Windows\\Defrag\\ScheduledDefrag') do
        it { should exist }
      end

      describe windows_task('\\Microsoft\\Windows\\AppID\\PolicyConverter') do
        its('logon_mode') { should eq 'Interactive/Background' }
        its('last_result') { should eq '1' }
        its('task_to_run') { should cmp '%Windir%\\system32\\appidpolicyconverter.exe' }
        its('run_as_user') { should eq 'LOCAL SERVICE' }
      end
    EXAMPLE

    def initialize(taskuri)
      @taskuri = taskuri
      @cache = nil
    end

    def exists?
      return true unless info.nil? || info[:uri].nil?

      false
    end

    # rubocop:disable Style/WordArray
    def enabled?
      return false if info.nil? || info[:state].nil?

      ["Ready", "Running"].include?(info[:state])
    end

    def disabled?
      return false if info.nil? || info[:state].nil?

      info[:scheduled_task_state] == "Disabled" || info[:state] == "Disabled"
    end

    def logon_mode
      info[:logon_mode]
    end

    def last_result
      info[:last_result]
    end

    def task_to_run
      info[:task_to_run].to_s.strip
    end

    def run_as_user
      info[:run_as_user]
    end

    def type
      info[:type] unless info.nil?
    end

    def info
      return @cache unless @cache.nil?

      # PowerShell v5 has Get-ScheduledTask cmdlet,
      # _using something with backward support to v3_
      # script = "Get-ScheduledTask | ? { $_.URI -eq '#{@taskuri}' } | Select-Object URI,@{N='State';E={$_.State.ToString()}} | ConvertTo-Json"

      # Using schtasks as suggested by @modille but aligning property names to match cmdlet to future proof.
      script = "schtasks /query /v /fo csv /tn '#{@taskuri}' | ConvertFrom-Csv | Select @{N='URI';E={$_.TaskName}},@{N='State';E={$_.Status.ToString()}},'Logon Mode','Last Result','Task To Run','Run As User','Scheduled Task State' | ConvertTo-Json -Compress"

      cmd = inspec.powershell(script)

      begin
        params = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      # If multiple triggers are defined, `schtasks` returns a list.
      # This merges that list with the latest item taking precedence.
      # This is the same behavior as `Get-ScheduledTask`.
      params = params.reduce(:merge) if params.is_a?(Array)

      @cache = {
        uri: params["URI"],
        state: params["State"],
        logon_mode: params["Logon Mode"],
        last_result: params["Last Result"],
        task_to_run: params["Task To Run"],
        run_as_user: params["Run As User"],
        scheduled_task_state: params["Scheduled Task State"],
        type: "windows-task",
      }
    end

    def resource_id
      @taskuri || "windows_task"
    end

    def to_s
      "Windows Task '#{@taskuri}'"
    end
  end
end
