require "tmpdir" unless defined?(Dir.mktmpdir)
require "fileutils" unless defined?(FileUtils)
require "mixlib/shellout" unless defined?(Mixlib::ShellOut)
require "inspec/log"

module Inspec::Fetcher
  #
  # The git fetcher uses the git binary to fetch remote git sources.
  # Git-based sources should be specified with the `git:` key in the
  # source hash. Additionally, we accept `:branch`, `:ref`, and `:tag`
  # keys to allow users to pin to a particular revision.
  #
  # Parts of this class are derived from:
  #
  #  https://github.com/chef/omnibus/blob/master/lib/omnibus/fetchers/git_fetcher.rb
  #
  # which is Copyright 2012-2014 Chef Software, Inc. and offered under
  # the same Apache 2 software license as inspec.
  #
  # Many thanks to the omnibus authors!
  #
  # Note that we haven't replicated all of omnibus' features here.  If
  # you got to this file during debugging, you may want to look at the
  # omnibus source for hints.
  #
  class Git < Inspec.fetcher(1)
    name "git"
    priority 200

    def self.resolve(target, opts = {})
      if target.is_a?(String)
        new(target, opts) if target.start_with?("git@") || target.end_with?(".git")
      elsif target.respond_to?(:has_key?) && target.key?(:git)
        new(target[:git], opts.merge(target))
      end
    end

    def initialize(remote_url, opts = {})
      @branch = opts[:branch]
      @tag = opts[:tag]
      @ref = opts[:ref]
      @remote_url = expand_local_path(remote_url)
      @repo_directory = nil
      @resolved_ref = nil
      @relative_path = opts[:relative_path] if opts[:relative_path] && !opts[:relative_path].empty?
    end

    def expand_local_path(url_or_file_path)
      # This paths to local on-disk repos, not relative paths within repos.
      # This is especially needed with testing.

      # We could try to do something clever with URI
      # processing, but then again, if you passed a relative path
      # to an on-disk repo, you probably expect it to exist.
      return url_or_file_path unless File.exist?(url_or_file_path)

      # It's important to expand this path, because it may be specified
      # locally in the metadata files, and when we clone, we will be
      # in a temp dir.
      File.expand_path(url_or_file_path)
    end

    def fetch(destination_path)
      @repo_directory = destination_path # Might be the cache, or vendoring, or something else
      FileUtils.mkdir_p(destination_path) unless Dir.exist?(destination_path)
      if cloned?
        checkout
      else
        Dir.mktmpdir do |working_dir|
          checkout(working_dir)
          if @relative_path
            perform_relative_path_fetch(destination_path, working_dir)
          else
            Inspec::Log.debug("Checkout of #{resolved_ref.nil? ? @remote_url : resolved_ref} successful. " \
                              "Moving checkout to #{destination_path}")
            FileUtils.cp_r(working_dir + "/.", destination_path)
          end
        end
      end
      @repo_directory
    end

    def perform_relative_path_fetch(destination_path, working_dir)
      Inspec::Log.debug("Checkout of #{resolved_ref.nil? ? @remote_url : resolved_ref} successful. " \
                        "Moving #{@relative_path} to #{destination_path}")
      unless File.exist?("#{working_dir}/#{@relative_path}")
        # Cleanup the destination path - otherwise we'll have an empty dir
        # in the cache, which is enough to confuse the cache reader
        # This is a courtesy, assuming we're writing to the cache; if we're
        # vendoring to something more complex, don't bother.
        FileUtils.rm_r(destination_path) if Dir.exist?(destination_path)

        raise Inspec::FetcherFailure, "Cannot find relative path '#{@relative_path}' " \
                                      "within profile in git repo specified by '#{@remote_url}'"
      end
      FileUtils.cp_r("#{working_dir}/#{@relative_path}", destination_path)
    end

    def cache_key
      cache_key = if @relative_path && !resolved_ref.nil?
                    OpenSSL::Digest.hexdigest("SHA256", resolved_ref + @relative_path)
                  elsif @relative_path && resolved_ref.nil?
                    OpenSSL::Digest.hexdigest("SHA256", @remote_url + @relative_path)
                  elsif resolved_ref.nil?
                    OpenSSL::Digest.hexdigest("SHA256", @remote_url)
                  else
                    resolved_ref
                  end
      cache_key
    end

    def archive_path
      @repo_directory
    end

    def resolved_source
      if resolved_ref.nil?
        source = { git: @remote_url }
      else
        source = { git: @remote_url, ref: resolved_ref }
      end
      source[:relative_path] = @relative_path if @relative_path
      source
    end

    def update_from_opts(opts)
      %i{branch tag ref}.map { |opt_name| update_ivar_from_opt(opt_name, opts) }.any?
    end

    private

    def resolved_ref
      @resolved_ref ||= if @ref
                          @ref
                        elsif @branch
                          resolve_ref(@branch)
                        elsif @tag
                          resolve_ref(@tag)
                        else
                          resolve_ref
                        end
    end

    def resolve_ref(ref_name = nil)
      command_string = if ref_name.nil?
                         # Running git ls-remote command helps to raise error if git URL is invalid and avoids cache_key creation
                         "git ls-remote \"#{@remote_url}\""
                       else
                         "git ls-remote \"#{@remote_url}\" \"#{ref_name}*\""
                       end
      cmd = shellout(command_string)
      raise(Inspec::FetcherFailure, "Profile git dependency failed for #{@remote_url} - error running '#{command_string}': #{cmd.stderr}") unless cmd.exitstatus == 0

      if ref_name.nil?
        ref = nil
      else
        ref = parse_ls_remote(cmd.stdout, ref_name)
        unless ref
          raise Inspec::FetcherFailure, "Profile git dependency failed - unable to resolve #{ref_name} to a specific git commit for #{@remote_url}"
        end
      end

      ref
    end

    #
    # The following comment is a minor modification of the comment in
    # the omnibus source for a similar function:
    #
    # Dereference annotated tags.
    #
    # The +remote_list+ parameter is assumed to look like this:
    #
    #   a2ed66c01f42514bcab77fd628149eccb4ecee28        refs/tags/rel-0.11.0
    #   f915286abdbc1907878376cce9222ac0b08b12b8        refs/tags/rel-0.11.0^{}
    #
    # The SHA with ^{} is the commit pointed to by an annotated
    # tag. If ref isn't an annotated tag, there will not be a line
    # with trailing ^{}.
    #
    # @param [String] output
    #   output from `git ls-remote origin` command
    # @param [String] ref_name
    #   the target git ref_name
    #
    # @return [String]
    #
    def parse_ls_remote(output, ref_name)
      pairs = output.lines.map { |l| l.chomp.split("\t") }
      tagged_commit = pairs.find { |m| m[1].end_with?("#{ref_name}^{}") }
      if tagged_commit
        tagged_commit.first
      else
        pairs.find { |m| m[1].end_with?(ref_name.to_s) }&.first
      end
    end

    def cloned?
      File.directory?(File.join(@repo_directory, ".git"))
    end

    def clone(dir = @repo_directory)
      git_cmd("clone #{@remote_url} ./", dir) unless cloned?
      @repo_directory
    end

    def checkout(dir = @repo_directory)
      clone(dir)
      # In case of branch, tag or git reference is not provided by User the resolved_ref will always be nil
      # and will always checkout the default HEAD branch, else it will checkout specific branch, tag or git reference.
      if resolved_ref.nil?
        git_cmd("checkout", dir)
      else
        git_cmd("checkout #{resolved_ref}", dir)
      end

      @repo_directory
    end

    def git_cmd(cmd, dir = @repo_directory)
      cmd = shellout("git #{cmd}", cwd: dir)
      cmd.error!
      cmd.status
    rescue Mixlib::ShellOut::ShellCommandFailed => e
      raise Inspec::FetcherFailure, "Error while running git command. #{e.message} "
    rescue Errno::ENOENT
      raise Inspec::FetcherFailure, "Profile git dependency failed for #{@remote_url} - to use git sources, you must have git installed."
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
end
