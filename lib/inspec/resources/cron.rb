require "inspec/resources/crontab"

module Inspec::Resources
  class Cron < Crontab
    name "cron"
    supports platform: "unix"
    desc "Use the cron InSpec audit resource to test entires in the crontab file for a given user. This also can be used as alias to crontab resource."
    example <<~EXAMPLE
      describe cron do
         it { should have_entry '* * * * * /usr/local/bin/foo' }
      end

      describe cron(user: "username") do
        its(:table) { should match /you can use regexp/ }
      end
    EXAMPLE

    def initialize(opts = nil)
      super
      @params = read_cron_contents
    end

    def read_cron_contents
      result = inspec.command(crontab_cmd)
      if result.exit_status == 0
        result.stdout.lines.map { |l| parse_comment_line(l, comment_char: "#", standalone_comments: false)[0].strip }
      else
        error = result.stdout + "\n" + result.stderr
        raise Inspec::Exceptions::ResourceFailed, "Error while executing #{crontab_cmd} command: #{error}"
      end
    end

    def table
      @params.reject(&:empty?).join("\n")
    end

    def has_entry?(rule)
      @params.include?(rule)
    end

    def resource_id
      user = @user || "current user"
      "cron #{user}"
    end

    def to_s
      if is_user_crontab?
        "cron for user #{@user}"
      else
        "cron for current user"
      end
    end
  end
end
