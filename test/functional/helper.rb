# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'rbconfig'
require 'byebug'
require 'json'
require 'fileutils'
require 'yaml'
require 'tmpdir'

require 'minitest/hell'
class Minitest::Test
  parallelize_me!
end

class Module
  include Minitest::Spec::DSL
end

module Inspec
  class FuncTestRunResult
    attr_reader :train_result
    attr_reader :payload

    extend Forwardable
    def_delegator :train_result, :stdout
    def_delegator :train_result, :stderr
    def_delegator :train_result, :exit_status

    def initialize(train_result)
      @train_result = train_result
      @payload = OpenStruct.new
    end
  end
end

module FunctionalHelper
  let(:repo_path) { File.expand_path(File.join( __FILE__, '..', '..', '..')) }
  let(:exec_inspec) { File.join(repo_path, 'bin', 'inspec') }
  let(:mock_path) { File.join(repo_path, 'test', 'unit', 'mock') }
  let(:profile_path) { File.join(mock_path, 'profiles') }
  let(:examples_path) { File.join(repo_path, 'examples') }
  let(:integration_test_path) { File.join(repo_path, 'test', 'integration', 'default') }

  let(:example_profile) { File.join(examples_path, 'profile') }
  let(:meta_profile) { File.join(examples_path, 'meta-profile') }
  let(:example_control) { File.join(example_profile, 'controls', 'example.rb') }
  let(:inheritance_profile) { File.join(examples_path, 'inheritance') }
  let(:failure_control) { File.join(profile_path, 'failures', 'controls', 'failures.rb') }
  let(:simple_inheritance) { File.join(profile_path, 'simple-inheritance') }
  let(:sensitive_profile) { File.join(examples_path, 'profile-sensitive') }
  let(:config_dir_path) { File.join(mock_path, 'config_dirs') }

  let(:dst) {
    # create a temporary path, but we only want an auto-clean helper
    # so remove the file and give back the path
    res = Tempfile.new('inspec-shred')
    res.close
    FileUtils.rm(res.path)
    TMP_CACHE[res.path] = res
  }

  def convert_windows_output(text)
    text = text.force_encoding("UTF-8")
    text.gsub!("[PASS]", '✔')
    text.gsub!("\033[0;1;32m", "\033[38;5;41m")
    text.gsub!("[SKIP]", '↺')
    text.gsub!("\033[0;37m", "\033[38;5;247m")
    text.gsub!("[FAIL]", '×')
    text.gsub!("\033[0;1;31m", "\033[38;5;9m")
  end

  def is_windows?
    RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
  end

  def inspec(commandline, prefix = nil)
    if is_windows?
      result = CMD.run_command("cmd /C \"#{prefix} bundle exec ruby #{exec_inspec} #{commandline}\"")
      result.stdout.encode!(universal_newline: true)
      result.stderr.encode!(universal_newline: true)
      convert_windows_output(result.stdout)
      # remove the CLIXML header trash in windows
      result.stderr.gsub!("#< CLIXML\n", '')
      Inspec::FuncTestRunResult.new(result)
    else
      Inspec::FuncTestRunResult.new(CMD.run_command("#{prefix} #{exec_inspec} #{commandline}"))
    end
  end

  def inspec_with_env(commandline, env = {})
    inspec(commandline, assemble_env_prefix(env))
  end

  # This version allows additional options.
  # @param String command_line Invocation, without the word 'inspec'
  # @param Hash opts Additonal options, see below
  #    :env Hash A hash of environment vars to expose to the invocation.
  #    :prefix String A string to prefix to the invocation. Prefix + env + invocation is the order.  Don't 'cd' and also use the tmpdir option.
  #    :lock Boolean Default false. If false, add `--no-create-lockfile`.
  #    :json Boolean Default false. If true, add `--reporter json` and parse the output, which is stored in payload.json .
  #    :tmpdir Boolean default true.  If true, wrap execution in a Dir.tmpdir block. Use pre_run and post_t
  #    :pre_run: Proc(tmp_dir_path) - optional setup block.
  #       Your PWD will be in the tmp_dir, and it will exist and be empty.
  #    :post_run: Proc(FuncTestRunResult, tmp_dir_path) - optional result capture block.
  #       run_result will be populated, but you can add more to the ostruct .payload
  #       Your PWD will be the tmp_dir, and it will still exist (for a moment!)
  # @return FuncTestRunResult. Includes attrs exit_status, stderr, stdout, payload (an openstruct which may be used in many ways)
  def run_inspec_process(command_line, opts)
    prefix = opts[:prefix] || ''
    prefix += assemble_env_prefix(opts[:env])
    command_line += ' --reporter json ' if opts[:json]
    command_line += ' --no-create-lockfile ' unless opts[:lock]

    run_result = nil
    if opts[:tmpdir]
      Dir.mktmpdir do |tmp_dir|
        Dir.chdir(tmp_dir) do |tmp_dir|
          opts[:pre_run].call(tmp_dir) if opts[:pre_run]
          run_result = inspec(command_line, prefix)
          opts[:post_run].call(run_result, tmp_dir) if opts[:post_run]
        end
      end
    else
      run_result = inspec(command_line, prefix)
    end

    if opts[:json]
      begin
        run_result.payload.json = JSON.parse(run_result.stdout)
      rescue JSON::ParserError => e
        run_result.payload.json = {}
        run_result.payload.json_error = e
      end
    end

    run_result
  end


  # Copy all examples to a temporary directory for functional tests.
  # You can provide an optional directory which will be handed to your
  # test block with its absolute path. If nothing is provided you will
  # get the path of the examples directory in the tmp environment.
  #
  # @param dir = nil [String] optional directory you want to test
  # @param &block [Type] actual test block
  def prepare_examples(dir = nil, &block)
    Dir.mktmpdir do |tmpdir|
      FileUtils.cp_r(examples_path, tmpdir)
      bn = File.basename(examples_path)
      block.call(File.join(tmpdir, bn, dir.to_s))
    end
  end

  private
  def assemble_env_prefix(env = {})
    if is_windows?
      env_prefix = env.to_a.map { |assignment| "set #{assignment[0]}=#{assignment[1]}" }.join('&& ')
      env_prefix += '&& '
    else
      env_prefix = env.to_a.map { |assignment| "#{assignment[0]}=#{assignment[1]}" }.join(' ')
      env_prefix += ' '
    end
    env_prefix
  end
end
