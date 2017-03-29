# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe yum do
#   its('repos') { should exist }
# end
#
# describe yum do
#   its('repos') { should include 'base/7/x86_64' }
#   its('epel') { should exist }
#   its('epel') { should be_enabled }
# end
#
# Filter for a specific repo by name
# - use full identifier e.g. 'updates/7/x86_64'
# - use short identifier e.g. 'updates'
#
# describe yum.repo('epel') do
#   it { should exist }
#   it { should be_enabled }
#   its('baseurl') { should include 'mycompany.biz' }
# end
#
# deprecated:
# describe yumrepo('epel') do
#   it { should exist }
#   it { should be_enabled }
# end

module Inspec::Resources
  class Yum < Inspec.resource(1)
    name 'yum'
    desc 'Use the yum InSpec audit resource to test the configuration of Yum repositories.'
    example "
      describe yum.repo('name') do
        it { should exist }
        it { should be_enabled }
      end
    "

    # returns all repositories
    # works as following:
    # search for Repo-id
    #   parse data in hashmap
    #   store data in object
    # until \n
    def repositories
      return @cache if defined?(@cache)
      # parse the repository data from yum
      # we cannot use -C, because this is not reliable and may lead to errors
      @command_result = inspec.command('yum -v repolist all')
      @content = @command_result.stdout
      @cache = []
      repo = {}
      in_repo = false
      @content.each_line do |line|
        # detect repo start
        in_repo = true if line =~ /^\s*Repo-id\s*:\s*(.*)\b/
        # detect repo end
        if line == "\n" && in_repo
          in_repo = false
          @cache.push(repo)
          repo = {}
        end
        # parse repo content
        if in_repo == true
          val = /^\s*([^:]*?)\s*:\s*(.*?)\s*$/.match(line)
          repo[repo_key(strip(val[1]))] = strip(val[2])
        end
      end
      @cache
    end

    def repos
      repositories.map { |repo| repo['id'] }
    end

    def repo(repo)
      YumRepo.new(self, repo)
    end

    # alias for yum.repo('reponame')
    def method_missing(name)
      repo(name.to_s) if !name.nil?
    end

    def to_s
      'Yum Repository'
    end

    private

    # Removes lefthand and righthand whitespace
    def strip(value)
      value.strip if !value.nil?
    end

    # Optimize the key value
    def repo_key(key)
      return key if key.nil?
      key.gsub('Repo-', '').downcase
    end
  end

  class YumRepo
    def initialize(yum, reponame)
      @yum = yum
      @reponame = reponame
    end

    # extracts the shortname from a repo id
    # e.g. extras/7/x86_64 -> extras
    def shortname(id)
      val = %r{^\s*([^/]*?)/(.*?)\s*$}.match(id)
      val.nil? ? nil : val[1]
    end

    def info
      return @cache if defined?(@cache)
      selection = @yum.repositories.select { |e| e['id'] == @reponame || shortname(e['id']) == @reponame }
      @cache = selection.empty? ? {} : selection.first
      @cache
    end

    def exist?
      !info.empty?
    end

    def enabled?
      return false unless exist?
      info['status'] == 'enabled'
    end

    # provide a method for each of the repo metadata items we know about
    [
      :baseurl,
      :expire,
      :filename,
      :mirrors,
      :pkgs,
      :size,
      :status,
      :updated,
    ].each do |key|
      define_method key do
        info[key.to_s]
      end
    end

    def to_s
      "YumRepo #{@reponame}"
    end
  end

  # for compatability with serverspec
  # this is deprecated syntax and will be removed in future versions
  class YumRepoLegacy < Yum
    name 'yumrepo'

    def initialize(name)
      super()
      @repository = repo(name)
    end

    def exists?
      deprecated
      @repository.exist?
    end

    def enabled?
      deprecated
      @repository.enabled?
    end

    def deprecated
      warn '[DEPRECATION] `yumrepo(reponame)` is deprecated.  Please use `yum.repo(reponame)` instead.'
    end
  end
end
