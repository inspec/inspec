require "inspec/resources/command"

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
      os = inspec.os
      cmd = if os.windows?
              inspec.command("Get-TimeZone")
            else
              inspec.command("timedatectl status | grep -i 'Time zone'")
            end
      if cmd.exit_status != 0
        raise Inspec::Exceptions::ResourceFailed, "Time Zone resource with error: #{cmd.stderr}"
      else
        if os.windows?
          splitted_output = cmd.stdout.strip.gsub(/\r/, "").split("\n").select { |out| (out.include? "Id") || (out.include? "DisplayName") || (out.include? "BaseUtcOffset") }
          @output["identifier"]  = split_and_fetch_last(splitted_output[1])
          @output["name"]        = split_and_fetch_last(splitted_output[0])
          @output["time_offset"] = split_and_fetch_last(splitted_output[2])
        else
          splitted_output = cmd.stdout.split(":")[-1]&.strip&.gsub(/[(),^]*/, "")&.split(" ") || []
          @output["identifier"]  = splitted_output[0]
          @output["name"]        = splitted_output[1]
          @output["time_offset"] = splitted_output[2]
        end
      end
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

    def to_s
      "Time Zone resource"
    end

    private

    def split_and_fetch_last(string_value)
      string_value.split(" :")[-1].strip
    end
  end
end
