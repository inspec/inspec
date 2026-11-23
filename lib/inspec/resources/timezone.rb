require "inspec/resources/command"
require "tzinfo"

module Inspec::Resources
  class TimeZone < Cmd
    name "timezone"
    supports platform: "unix"
    supports platform: "windows"

    desc "Check for timezone configurations"
    example <<~EXAMPLE
      describe timezone do
        its('identifier') { should eq 'Asia/Kolkata' }
        its('name') { should eq 'IST' }
        its('time_offset') { should eq '+0530' }
      end
    EXAMPLE

    def initialize
      @output = {}
      load_timezone_properties
    end

    def identifier
      @output["identifier"]
    end

    def name
      @output["name"]
    end

    def time_offset
      @output["time_offset"]
    end

    def resource_id
      "timezone"
    end

    def to_s
      "Time Zone resource"
    end

    private

    def split_and_fetch_last(string_value)
      string_value.split(" :")[-1].strip
    end

    def load_timezone_properties
      cmd = determine_timezone_command

      raise Inspec::Exceptions::ResourceFailed, "Time Zone resource with error: #{cmd.stderr}" if cmd.exit_status != 0

      cmd_output = cmd.stdout
      if running_on_windows?
        splitted_output = cmd_output.strip.gsub(/\r/, "").split("\n").select { |out| (out.include? "Id") || (out.include? "DisplayName") || (out.include? "BaseUtcOffset") }
        @output["identifier"]  = split_and_fetch_last(splitted_output[1])
        @output["name"]        = split_and_fetch_last(splitted_output[0])
        @output["time_offset"] = split_and_fetch_last(splitted_output[2])
      elsif timedatectl_exists?
        splitted_output = cmd_output.split(":")[-1]&.strip&.gsub(/[(),^]*/, "")&.split(" ") || []
        @output["identifier"]  = splitted_output[0]
        @output["name"]        = splitted_output[1]
        @output["time_offset"] = splitted_output[2]
      else
        # this is a fallback for non-systemd that do not have timedatectl
        # Sample output of `ls -l /etc/localtime`:
        # lrwxr-xr-x  1 root  wheel  38 Sep 28 11:54 /etc/localtime -> /var/db/timezone/zoneinfo/Asia/Kolkata

        # Only manual testing is done for the following code.
        # No unit tests are written because inspec.command("timedatectl").exist? is mocked.
        timezone_identifier = cmd_output.match(%r{/zoneinfo/(.+)$})[1]
        @output["identifier"]  = timezone_identifier
        @output["name"]        = TZInfo::Timezone.get(timezone_identifier).current_period.abbreviation.to_s
        @output["time_offset"] = TZInfo::Timezone.get(timezone_identifier).now.strftime("%z")
      end
    end

    def determine_timezone_command
      if running_on_windows?
        inspec.command("Get-TimeZone")
      elsif timedatectl_exists?
        inspec.command("timedatectl status | grep -i 'Time zone'")
      else
        inspec.command("ls -l /etc/localtime")
      end
    end

    def running_on_windows?
      # cache the result
      @is_windows ||= inspec.os.windows?
    end

    def timedatectl_exists?
      @timedatectl_exists ||= inspec.command("timedatectl").exist?
    end
  end
end
