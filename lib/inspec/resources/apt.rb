require "inspec/resources/command"

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

require "uri" unless defined?(URI)

module Inspec::Resources
  class AptRepository < Inspec.resource(1)
    name "apt"
    supports platform: "unix"
    desc "Use the apt InSpec audit resource to verify Apt repositories on the Debian and Ubuntu platforms, and also PPA repositories on the Ubuntu platform."
    example <<~EXAMPLE
      describe apt('nginx/stable') do
        it { should exist }
        it { should be_enabled }
      end
    EXAMPLE

    def initialize(ppa_name)
      @deb_url = nil
      # check if the os is ubuntu or debian
      if inspec.os.debian?
        @deb_url = determine_ppa_url(ppa_name)
      else
        # this resource is only supported on ubuntu and debian
        skip_resource "The `apt` resource is not supported on your OS yet."
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
      read_debs.select { |repo| repo[:url] == @deb_url && repo[:type] == "deb" }
    end

    # TODO: remove this. just see if it is valid w/ URI.parse
    HTTP_URL_RE = /\A#{URI::DEFAULT_PARSER.make_regexp(%w{http https})}\z/.freeze

    def read_debs
      return @repo_cache if defined?(@repo_cache)

      # load all lists
      cmd = inspec.command("find /etc/apt/ -name \"*.list\" -exec sh -c 'cat {} || echo -n' \\;")

      # @see https://help.ubuntu.com/community/Repositories/CommandLine#Explanation_of_the_Repository_Format
      @repo_cache = cmd.stdout.lines.map do |raw_line|
        # detect if the repo is commented out
        line = raw_line.gsub(/^(#\s*)*/, "")
        active = raw_line == line

        # formats:
        # deb                          "http://archive.ubuntu.com/ubuntu/" wily main restricted ...
        # deb                          http://archive.ubuntu.com/ubuntu/ wily main restricted ...
        # deb [trusted=yes]            http://archive.ubuntu.com/ubuntu/ wily main restricted ...
        # deb [arch=amd64 trusted=yes] http://archive.ubuntu.com/ubuntu/ wily main restricted ...
        # deb cdrom:[Ubuntu 15.10 _Wily Werewolf_ - Release amd64 (20151021)]/ wily main restricted ...

        words = line.sub(/^(deb|deb-src)\s+\[.+?\]/, '\1').split
        type, url, distro, *components = words
        url = url.delete('"') if url

        next if words[1] && words[1].start_with?("cdrom:") # skip unsupported apt-cdrom repos
        next if components.empty?
        next unless URI::HTTP === URI.parse(url)
        next unless %w{deb deb-src}.include? type

        # map data
        {
          type: type,
          url: url,
          distro: distro,
          components: components,
          active: active,
        }
      end.compact
    end

    # resolves ppa urls
    # @see http://bazaar.launchpad.net/~ubuntu-core-dev/software-properties/main/view/head:/softwareproperties/ppa.py
    def determine_ppa_url(ppa_url)
      # verify if we have the url already, then just return
      return ppa_url if ppa_url =~ HTTP_URL_RE

      # otherwise start generating the ppa url

      # special care if the name stats with :
      ppa_url = ppa_url.split(":")[1] if ppa_url.start_with?("ppa:")

      # parse ppa owner and repo
      ppa_owner, ppa_repo = ppa_url.split("/")
      ppa_repo = "ppa" if ppa_repo.nil?

      # construct new ppa url and return it
      format("http://ppa.launchpad.net/%s/%s/ubuntu", ppa_owner, ppa_repo)
    end
  end

  class PpaRepository < AptRepository
    name "ppa"

    def exists?
      deprecated
      super()
    end

    def enabled?
      deprecated
      super()
    end

    def deprecated
      Inspec.deprecate(:resource_ppa, "The `ppa` resource is deprecated. Please use `apt`")
    end
  end
end
