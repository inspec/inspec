# encoding: utf-8
require 'tmpdir'
require 'fileutils'
require 'mixlib/shellout'
require 'inspec/log'

module Fetchers
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
  class Git < Inspec.fetcher(1) # rubocop:disable ClassLength
    name 'git'
    priority 200

    def self.resolve(target, opts = {})
      if target.respond_to?(:has_key?) &&target.key?(:git)
        new(target[:git], opts.merge(target))
      end
    end

    def initialize(remote_url, opts = {})
      @branch = opts[:branch]
      @tag = opts[:tag]
      @ref = opts[:ref]
      @remote_url = remote_url
      @repo_directory = nil
    end

    def fetch(dir)
      @repo_directory = dir
      FileUtils.mkdir_p(dir) unless Dir.exist?(dir)

      if cloned?
        checkout
      else
        Dir.mktmpdir do |tmpdir|
          checkout(tmpdir)
          Inspec::Log.debug("Checkout of #{resolved_ref} successful. Moving checkout to #{dir}")
          FileUtils.cp_r(tmpdir, @repo_directory)
        end
      end
      @repo_directory
    end

    def cache_key
      resolved_ref
    end

    def archive_path
      @repo_directory
    end

    def resolved_source
      { git: @remote_url, ref: resolved_ref }
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
                          resolve_ref('master')
                        end
    end

    def resolve_ref(ref_name)
      cmd = shellout("git ls-remote \"#{@remote_url}\" \"#{ref_name}*\"")
      ref = parse_ls_remote(cmd.stdout, ref_name)
      if !ref
        raise "Unable to resolve #{ref_name} to a specific git commit for #{@remote_url}"
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
        found = pairs.find { |m| m[1].end_with?(ref_name.to_s) }
        if found
          found.first
        end
      end
    end

    def cloned?
      File.directory?(File.join(@repo_directory, '.git'))
    end

    def clone(dir = @repo_directory)
      git_cmd("clone #{@remote_url} ./", dir) unless cloned?
      @repo_directory
    end

    def checkout(dir = @repo_directory)
      clone(dir)
      git_cmd("checkout #{resolved_ref}", dir)
      @repo_directory
    end

    def git_cmd(cmd, dir = @repo_directory)
      cmd = shellout("git #{cmd}", cwd: dir)
      cmd.error!
      cmd.status
    rescue Errno::ENOENT
      raise 'To use git sources, you must have git installed.'
    end

    def shellout(cmd, opts = {})
      Inspec::Log.debug("Running external command: #{cmd} (#{opts})")
      cmd = Mixlib::ShellOut.new(cmd, opts)
      cmd.run_command
      Inspec::Log.debug("External command: completed with exit status: #{cmd.exitstatus}")
      Inspec::Log.debug('External command: STDOUT BEGIN')
      Inspec::Log.debug(cmd.stdout)
      Inspec::Log.debug('External command: STDOUT END')
      Inspec::Log.debug('External command: STDERR BEGIN')
      Inspec::Log.debug(cmd.stderr)
      Inspec::Log.debug('External command: STDERR END')
      cmd
    end
  end
end
