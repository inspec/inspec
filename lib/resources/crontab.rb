# encoding: utf-8
# author: Avi Israeli

# Verifies if crontab entry exists
#
# Usage:
# describe crontab('* * * * * /foo/bar') do
#   it { should exist }
# end
#
module Inspec::Resources
  class Crontab < Inspec.resource(1)
    name 'crontab'
    desc 'Use the crontab InSpec audit resource to verify if crontab entry exists'
    example "
      describe crontab('* * * * * /foo/bar') do
        it {  should exist  }
      end
    "

    def initialize(crontab_entry)
      @crontab_entry = crontab_entry
    end

    def exist?
      read_crontabs
    end

    private

    # read
    def read_crontabs
      return @repo_cache if defined?(@repo_cache)

      # load all crontabl
      cmd = inspec.command("crontab -l ")
      values = cmd.stdout.split("\n")
      values.each do |value|
        if value == @crontab_entry
          return true
        end
      end
      return false
    end
  end
end
