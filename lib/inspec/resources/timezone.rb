require "inspec/resources/command"

module Inspec::Resources
  class TimeZone < Cmd
    name "timezone"
    supports platform: "unix"
    desc "Check for timezone configurations"
    example <<~EXAMPLE
      describe timezone do
        its('identifier') { should eq 'Asia/Kolkata' }
        its('abbreviation') { should eq 'IST' }
        its('time_offset') { should eq '+0530' }
        its('stderr') { should eq '' }
        its('exit_status') { should eq 0 }
      end
    EXAMPLE

    def initialize
      @output = []
      cmd = inspec.command("timedatectl status | grep -i 'Time zone'")
      if cmd.exit_status != 0
        raise Inspec::Exceptions::ResourceFailed, "Time Zone resource with error: #{cmd.stderr}"
      else
        @output = cmd.stdout.split(":")[-1]&.strip&.gsub(/[(),^]*/, "")&.split(" ") || []
      end
    end

    def identifier
      @output[0]
    end

    def abbreviation
      @output[1]
    end

    def time_offset
      @output[2]
    end

    def to_s
      "Time Zone resource"
    end
  end
end
