# encoding: utf-8
module Inspec::Resources
  class WindowsTasks < Inspec.resource(1)
    name 'windows_task'
    supports platform: 'windows'
    desc 'Use the windows_task InSpec audit resource to test task schedules on Microsoft Windows.'
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
      ['Ready', 'Running'].include?(info[:state])
    end

    def disabled?
      return false if info.nil? || info[:state].nil?
      info[:scheduled_task_state] == 'Disabled' || info[:state] == 'Disabled'
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

    def hostname
      info[:hostname]
    end

    def taskname
      info[:taskname]
    end

    def next_run_time
      info[:next_run_time].to_s.strip
    end

    def status
      info[:status]
    end

    def author
      info[:author]
    end

    def last_run_time
      info[:last_run_time].to_s.strip
    end

    def start_in
      info[:start_in]
    end

    def comment
      info[:comment]
    end

    def idle_time
      info[:idle_time].to_s.strip
    end

    def power_management
      info[:power_management]
    end

    def delete_task_if_not_rescheduled
      info[:delete_task_if_not_rescheduled]
    end

    def stop_task_if_runs
      info[:stop_task_if_runs]
    end

    def schedule_type
      info[:schedule_type].to_s.strip
    end

    def start_time
      info[:start_time].to_s.strip
    end

    def start_date
      info[:start_date].to_s.strip
    end

    def end_date
      info[:end_date].to_s.strip
    end

    def days
      info[:days]
    end

    def months
      info[:months]
    end

    def repeat_every
      info[:repeat_every]
    end

    def repeat_until_time
      info[:repeat_until_time].to_s.strip
    end

    def repeat_until_duration
      info[:repeat_until_duration]
    end

    def repeat_stop_if_still_running
      info[:repeat_stop_if_still_running]
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
      script = "schtasks /query /v /fo csv /tn '#{@taskuri}' |
      ConvertFrom-Csv |
      Select @{N='URI';E={$_.TaskName}},
      @{N='State';E={$_.Status.ToString()}},
      'Logon Mode',
      'Last Result',
      'Task To Run',
      'Run As User',
      'Scheduled Task State',
      'Hostname',
      'TaskName',
      'Next Run Time',
      'Status',
      'Last Run Time',
      'Author',
      'Start In',
      'Comment',
      'Idle Time',
      'Power Management',
      'Delete Task If Not Rescheduled',
      'Stop Task If Runs X Hours and X Mins',
      'Schedule Type',
      'Start Time',
      'Start Date',
      'End Date',
      'Days',
      'Months',
      'Repeat: Every',
      'Repeat: Until: Time',
      'Repeat: Until: Duration',
      'Repeat: Stop If Still Running' |
      ConvertTo-Json -Compress"

      cmd = inspec.powershell(script)

      begin
        params = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      @cache = {
        uri: params['URI'],
        state: params['State'],
        logon_mode: params['Logon Mode'],
        last_result: params['Last Result'],
        task_to_run: params['Task To Run'],
        run_as_user: params['Run As User'],
        hostname: params['HostName'],
        taskname: params['TaskName'],
        next_run_time: params['Next Run Time'],
        status: params['Status'],
        last_run_time: params['Last Run Time'],
        author: params['Author'],
        start_in: params['Start In'],
        comment: params['Comment'],
        idle_time: params['Idle Time'],
        power_management: params['Power Management'],
        delete_task_if_not_rescheduled: params['Delete Task If Not Rescheduled'],
        stop_task_if_runs: params['Stop Task If Runs X Hours and X Mins'],
        schedule_type: params['Schedule Type'],
        start_time: params['Start Time'],
        start_date: params['Start Date'],
        end_date: params['End Date'],
        days: params['Days'],
        months: params['Months'],
        repeat_every: params['Repeat: Every'],
        repeat_until_time: params['Repeat: Until: Time'],
        repeat_until_duration: params['Repeat: Until: Duration'],
        repeat_stop_if_still_running: params['Repeat: Stop If Still Running'],
        scheduled_task_state: params['Scheduled Task State'],
        type: 'windows-task'
      }
    end

    def to_s
      "Windows Task '#{@taskuri}'"
    end
  end
end
