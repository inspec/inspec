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

require 'uri'

module Inspec::Resources
  class AptRepository < Inspec.resource(1)
    name 'apt'
    desc 'Use the apt InSpec audit resource to verify Apt repositories on the Debian and Ubuntu platforms, and also PPA repositories on the Ubuntu platform.'
    example "
      describe apt('nginx/stable') do
        it { should exist }
        it { should be_enabled }
      end
    "

    def initialize(ppa_name)
      @deb_url = nil
      # check if the os is ubuntu or debian
      if inspec.os.debian?
        @deb_url = determine_ppa_url(ppa_name)
      else
        # this resource is only supported on ubuntu and debian
        skip_resource 'The `apt` resource is not supported on your OS yet.'
      end
    end

    def exists?
      find_repo.count > 0
    end

    def enabled?
      return false if find_repo.count == 0
      actives = find_repo.map { |repo| repo[:active] }
      actives = actives.uniq
      actives.size == 1 && actives[0] = true
    end

    def to_s
      "Apt Repository #{@deb_url}"
    end

    private

    def find_repo
      read_debs.select { |repo| repo[:url] == @deb_url && repo[:type] == 'deb' }
    end

    HTTP_URL_RE = /\A#{URI::DEFAULT_PARSER.make_regexp(%w{http https})}\z/

    # read
    def read_debs
      return @repo_cache if defined?(@repo_cache)

      # load all lists
      cmd = inspec.command("find /etc/apt/ -name \*.list -exec sh -c 'cat {} || echo -n' \\;")

      # @see https://help.ubuntu.com/community/Repositories/CommandLine#Explanation_of_the_Repository_Format
      @repo_cache = cmd.stdout.chomp.split("\n").each_with_object([]) do |raw_line, lines|
        active = true

        # detect if the repo is commented out
        line = raw_line.gsub(/^(#\s*)*/, '')
        active = false if raw_line != line

        # eg.: deb http://archive.ubuntu.com/ubuntu/ wily main restricted
        # or : deb [trusted=yes] http://archive.ubuntu.com/ubuntu/ wily main restricted
        parse_repo = /^\s*(\S+)\s+(?:\[\S+\])?\s*"?([^ "\t\r\n\f]+)"?\s+(\S+)\s+(.*)$/.match(line)

        # check if we got any result and the second param is an url
        next if parse_repo.nil? || !parse_repo[2] =~ HTTP_URL_RE

        # map data
        repo = {
          type: parse_repo[1],
          url: parse_repo[2],
          distro: parse_repo[3],
          components: parse_repo[4].chomp.split(' '),
          active: active,
        }
        next unless ['deb', 'deb-src'].include? repo[:type]

        lines.push(repo)
      end
    end

    # resolves ppa urls
    # @see http://bazaar.launchpad.net/~ubuntu-core-dev/software-properties/main/view/head:/softwareproperties/ppa.py
    def determine_ppa_url(ppa_url)
      # verify if we have the url already, then just return
      return ppa_url if ppa_url =~ HTTP_URL_RE
      # otherwise start generating the ppa url

      # special care if the name stats with :
      ppa_url = ppa_url.split(':')[1] if ppa_url.start_with?('ppa:')

      # parse ppa owner and repo
      ppa_owner, ppa_repo = ppa_url.split('/')
      ppa_repo = 'ppa' if ppa_repo.nil?

      # construct new ppa url and return it
      format('http://ppa.launchpad.net/%s/%s/ubuntu', ppa_owner, ppa_repo)
    end
  end

  # for compatability with serverspec
  # this is deprecated syntax and will be removed in future versions
  class PpaRepository < AptRepository
    name 'ppa'

    def exists?
      deprecated
      super()
    end

    def enabled?
      deprecated
      super()
    end

    def deprecated
      warn '[DEPRECATION] `ppa(reponame)` is deprecated.  Please use `apt(reponame)` instead.'
    end
  end
end
