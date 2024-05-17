require "uri" unless defined?(URI)
require "openssl" unless defined?(OpenSSL)
require "tempfile" unless defined?(Tempfile)
require "open-uri" unless defined?(OpenURI)

module Inspec::Fetcher
  class Url < Inspec.fetcher(1)
    MIME_TYPES = {
      "application/x-zip-compressed" => ".zip",
      "application/zip" => ".zip",
      "application/x-gzip" => ".tar.gz",
      "application/gzip" => ".tar.gz",
    }.freeze

    name "url"
    priority 200

    def self.resolve(target, opts = {})
      if target.is_a?(Hash) && target.key?(:url)
        resolve_from_string(target[:url], opts, target[:username], target[:password])
      elsif target.is_a?(String)
        resolve_from_string(target, opts)
      elsif target.is_a?(URI)
        resolve_from_string(target.to_s, opts)
      end
    end

    def self.resolve_from_string(target, opts, username = nil, password = nil)
      uri = URI.parse(target)
      return nil if uri.nil? || uri.scheme.nil?
      return nil unless %{ http https }.include? uri.scheme

      target = transform(target)
      opts[:username] = username if username
      opts[:password] = password if password
      new(target, opts)
    rescue URI::Error
      nil
    end

    # Transforms a browser github/bitbucket url to github/bitbucket tar url
    # We distinguish between three different Github/Bitbucket URL types:
    #  - Master URL
    #  - Branch URL
    #  - Commit URL
    #
    # master url(default branch master):
    # https://github.com/nathenharvey/tmp_compliance_profile/ is transformed to
    # https://github.com/nathenharvey/tmp_compliance_profile/archive/master.tar.gz
    # https://bitbucket.org/username/repo is transformed to
    # https://bitbucket.org/username/repo/get/master.tar.gz

    # main url(default branch main):
    # https://github.com/nathenharvey/tmp_compliance_profile/ is transformed to
    # https://github.com/nathenharvey/tmp_compliance_profile/archive/main.tar.gz
    # https://bitbucket.org/username/repo is transformed to
    # https://bitbucket.org/username/repo/get/main.tar.gz
    #
    # branch:
    # https://github.com/hardening-io/tests-os-hardening/tree/2.0 is transformed to
    # https://github.com/hardening-io/tests-os-hardening/archive/2.0.tar.gz
    # https://bitbucket.org/username/repo/branch/branchname is transformed to
    # https://bitbucket.org/username/repo/get/newbranch.tar.gz
    #
    # commit:
    # https://github.com/hardening-io/tests-os-hardening/tree/48bd4388ddffde68badd83aefa654e7af3231876
    # is transformed to
    # https://github.com/hardening-io/tests-os-hardening/archive/48bd4388ddffde68badd83aefa654e7af3231876.tar.gz
    # https://bitbucket.org/username/repo/commits/95ce1f83d5bbe9eec34c5973f6894617e8d6d8cc is transformed to
    # https://bitbucket.org/username/repo/get/95ce1f83d5bbe9eec34c5973f6894617e8d6d8cc.tar.gz

    GITHUB_URL_REGEX = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w.-]+?)(\.git)?(/)?$}.freeze
    GITHUB_URL_WITH_TREE_REGEX = %r{^https?://(www\.)?github\.com/(?<user>[\w-]+)/(?<repo>[\w.-]+)/tree/(?<commit>[\w\.]+)(/)?$}.freeze
    BITBUCKET_URL_REGEX = %r{^https?://(www\.)?bitbucket\.org/(?<user>[\w-]+)/(?<repo>[\w-]+)(\.git)?(/)?$}.freeze
    BITBUCKET_URL_BRANCH_REGEX = %r{^https?://(www\.)?bitbucket\.org/(?<user>[\w-]+)/(?<repo>[\w-]+)/branch/(?<branch>[\w\.]+)(/)?$}.freeze
    BITBUCKET_URL_COMMIT_REGEX = %r{^https?://(www\.)?bitbucket\.org/(?<user>[\w-]+)/(?<repo>[\w-]+)/commits/(?<commit>[\w\.]+)(/)?$}.freeze
    GITHUB_URL = "https://github.com".freeze
    BITBUCKET_URL = "https://bitbucket.org".freeze

    def self.transform(target)
      transformed_target = if m = GITHUB_URL_REGEX.match(target) # rubocop:disable Lint/AssignmentInCondition
                             default_branch = default_ref(m, GITHUB_URL)
                             "https://github.com/#{m[:user]}/#{m[:repo]}/archive/#{default_branch}.tar.gz"
                           elsif m = GITHUB_URL_WITH_TREE_REGEX.match(target) # rubocop:disable Lint/AssignmentInCondition
                             "https://github.com/#{m[:user]}/#{m[:repo]}/archive/#{m[:commit]}.tar.gz"
                           elsif m = BITBUCKET_URL_REGEX.match(target) # rubocop:disable Lint/AssignmentInCondition
                             default_branch = default_ref(m, BITBUCKET_URL)
                             "https://bitbucket.org/#{m[:user]}/#{m[:repo]}/get/#{default_branch}.tar.gz"
                           elsif m = BITBUCKET_URL_BRANCH_REGEX.match(target) # rubocop:disable Lint/AssignmentInCondition
                             "https://bitbucket.org/#{m[:user]}/#{m[:repo]}/get/#{m[:branch]}.tar.gz"
                           elsif m = BITBUCKET_URL_COMMIT_REGEX.match(target) # rubocop:disable Lint/AssignmentInCondition
                             "https://bitbucket.org/#{m[:user]}/#{m[:repo]}/get/#{m[:commit]}.tar.gz"
                           end

      if transformed_target
        Inspec::Log.debug("URL target #{target} transformed to #{transformed_target}. Consider using the git fetcher")
        transformed_target
      else
        target
      end
    end

    attr_reader :files, :archive_path

    def initialize(url, opts)
      @target = url.to_s
      @target_uri = url.is_a?(URI) ? url : parse_uri(url)
      @insecure = opts["insecure"]
      @token = opts["token"]
      @config = opts
      @archive_path = nil
      @temp_archive_path = nil
    end

    def fetch(path)
      @archive_path ||= download_archive(path)
    end

    def resolved_source
      @resolved_source ||= { url: @target, sha256: sha256 }
    end

    def cache_key
      @archive_shasum ||= sha256
    end

    def to_s
      @target
    end

    private

    class << self
      def default_ref(match_data, repo_url)
        remote_url = "#{repo_url}/#{match_data[:user]}/#{match_data[:repo]}.git"
        command_string = "git ls-remote #{remote_url} HEAD"
        cmd = shellout(command_string)
        unless cmd.exitstatus == 0
          raise(Inspec::FetcherFailure, "Profile git dependency failed with default reference - #{remote_url} - error running '#{command_string}': #{cmd.stderr}")
        else
          # cmd.stdout of "git ls-remote #{remote_url} HEAD" looks like this:
          # "457d14843ab7c1c3740169eb47cf129a6f417964\tHEAD\n"
          ref = cmd.stdout.split("\t").first
          unless ref
            raise(Inspec::FetcherFailure, "Profile git dependency failed with default reference - #{remote_url} - error running '#{command_string}': NULL reference")
          end

          ref
        end
      end

      def shellout(cmd, opts = {})
        Inspec::Log.debug("Running external command: #{cmd} (#{opts})")
        cmd = Mixlib::ShellOut.new(cmd, opts)
        cmd.run_command
        Inspec::Log.debug("External command: completed with exit status: #{cmd.exitstatus}")
        Inspec::Log.debug("External command: STDOUT BEGIN")
        Inspec::Log.debug(cmd.stdout)
        Inspec::Log.debug("External command: STDOUT END")
        Inspec::Log.debug("External command: STDERR BEGIN")
        Inspec::Log.debug(cmd.stderr)
        Inspec::Log.debug("External command: STDERR END")
        cmd
      end
    end

    def parse_uri(target)
      return URI.parse(target) if target.is_a?(String)

      URI.parse(target[:url])
    end

    def sha256
      @archive_shasum ||= OpenSSL::Digest.digest("SHA256", File.read(@archive_path || temp_archive_path)).unpack("H*")[0]
    end

    def file_type_from_remote(remote)
      content_type = remote.meta["content-type"]
      file_type = MIME_TYPES[content_type]

      if file_type.nil?
        Inspec::Log.warn("Unrecognized content type: #{content_type}. Assuming tar.gz")
        file_type = ".tar.gz"
      end

      file_type
    end

    def temp_archive_path
      @temp_archive_path ||= if @config["server_type"] == "automate2"
                               download_automate2_archive_to_temp
                             else
                               download_archive_to_temp
                             end
    end

    def download_automate2_archive_to_temp
      return @temp_archive_path unless @temp_archive_path.nil?

      Inspec::Log.debug("Fetching URL: #{@target}")
      json = {
        owner: @config["profile"][0],
        name: @config["profile"][1],
        version: @config["profile"][2],
      }.to_json

      opts = http_opts
      opts[:use_ssl] = @target_uri.scheme == "https"

      if @insecure
        opts[:verify_mode] = OpenSSL::SSL::VERIFY_NONE
      else
        opts[:verify_mode] = OpenSSL::SSL::VERIFY_PEER
      end

      req = Net::HTTP::Post.new(@target_uri)
      opts.each do |key, value|
        req.add_field(key, value)
      end
      req.body = json
      res = Net::HTTP.start(@target_uri.host, @target_uri.port, opts) do |http|
        http.request(req)
      end

      @archive_type = ".tar.gz"
      archive = Tempfile.new(["inspec-dl-", @archive_type])
      archive.binmode
      archive.write(res.body)
      archive.rewind
      archive.close
      Inspec::Log.debug("Archive stored at temporary location: #{archive.path}")
      @temp_archive_path = archive.path
    end

    # Downloads archive to temporary file with side effect :( of setting @archive_type
    def download_archive_to_temp
      return @temp_archive_path unless @temp_archive_path.nil?

      Inspec::Log.debug("Fetching URL: #{@target}")
      remote = open_via_uri(@target)
      @archive_type = file_type_from_remote(remote) # side effect :(
      archive = Tempfile.new(["inspec-dl-", @archive_type])
      archive.binmode
      archive.write(remote.read)
      archive.rewind
      archive.close
      Inspec::Log.debug("Archive stored at temporary location: #{archive.path}")
      @temp_archive_path = archive.path
    end

    def open(target, opts) # overridden so we can control who we're talking to
      URI.open(target, opts)
    rescue NoMethodError   # TODO: remove when we drop ruby 2.4
      super(target, opts)  # Kernel#open
    end

    def open_via_uri(target)
      opts = http_opts

      # OpenURI does not support userinfo so we need to remove it
      # https://ruby-doc.org/stdlib-2.5.0/libdoc/open-uri/rdoc/OpenURI/OpenRead.html#method-i-open
      target = target.sub("#{@target_uri.userinfo}@", "") if
        opts[:http_basic_authentication]

      open(target, opts)

    rescue SocketError, Net::OpenTimeout, Errno::ECONNREFUSED, OpenURI::HTTPError => e
      raise Inspec::FetcherFailure, "Profile URL dependency #{target} could not be fetched: #{e.message}"
    end

    def download_archive(path)
      temp_archive_path
      final_path = "#{path}#{@archive_type}"
      FileUtils.mkdir_p(File.dirname(final_path))
      FileUtils.mv(temp_archive_path, final_path)
      Inspec::Log.debug("Fetched archive moved to: #{final_path}")
      @temp_archive_path = nil
      final_path
    end

    def http_opts
      opts = {}
      opts[:ssl_verify_mode] = OpenSSL::SSL::VERIFY_NONE if @insecure

      if @config["server_type"] =~ /automate/
        opts["chef-delivery-enterprise"] = @config["automate"]["ent"]
        if @config["automate"]["token_type"] == "dctoken"
          opts["x-data-collector-token"] = @config["token"]
        else
          opts["chef-delivery-user"] = @config["user"]
          opts["chef-delivery-token"] = @config["token"]
        end
      elsif @token
        opts["Authorization"] = "Bearer #{@token}"
      end

      username = @config[:username] || @target_uri.user
      password = @config[:password] || @target_uri.password
      opts[:http_basic_authentication] = [username, password] if username

      # Do not send any headers that have nil values.
      # Net::HTTP does not gracefully handle this situation.
      check_for_missing_values!(opts)

      opts
    end

    def check_for_missing_values!(opts)
      keys_missing_values = opts.keys.delete_if do |k|
        if opts[k].nil?
          false
        elsif opts[k].respond_to?(:empty?) && opts[k].empty?
          false
        else
          true
        end
      end
      unless keys_missing_values.empty?
        raise Inspec::FetcherFailure, "Unable to fetch profile - the following HTTP headers have no value: " \
          "#{keys_missing_values.join(", ")}"
      end
    end
  end
end
