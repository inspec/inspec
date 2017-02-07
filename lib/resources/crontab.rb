# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Verifies apt and ppa repositories
#
# Usage:
# describe apt('ubuntu-wine/ppa') do
#   it { should exist }
#   it { should be_enabled }
# end
#
# it also understands a ppa url
# describe apt('ppa:ubuntu-wine/ppa') do
#   it { should exist }
#   it { should be_enabled }
# end
#
# The following ppa formats are supported:
# - ubuntu-wine/ppa
# - ppa:ubuntu-wine/ppa
# - http://ppa.launchpad.net/juju/stable/ubuntu
#
# Install a ppa as following:
# apt-get install python-software-properties
# apt-get install software-properties-common
# add-apt-repository ppa:ubuntu-wine/ppa

module Inspec::Resources
  class Crontab < Inspec.resource(1)
    name 'crontab'
    desc 'Use the crontab InSpec audit resource to verify crontab entries on the Debian and Ubuntu platforms, '
    example "
      describe crontab('* * * * * /foo/bar') do
        it { it  should exist  }
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
