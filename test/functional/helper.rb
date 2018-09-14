# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'rbconfig'

require 'minitest/hell'
class Minitest::Test
  parallelize_me!
end

class Module
  include Minitest::Spec::DSL
end

module FunctionalHelper
  let(:repo_path) do
    path = File.expand_path(File.join( __FILE__, '..', '..', '..'))
    # fix for vagrant repo pathing
    path.gsub!('//vboxsrv', 'C:') if is_windows?
    path
  end
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

  def self.is_windows?
    RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
  end

  def is_windows?
    FunctionalHelper.is_windows?
  end

  def inspec(commandline, prefix = nil)
    if is_windows?
      result = CMD.run_command("cmd /C \"#{prefix} bundle exec ruby #{exec_inspec} #{commandline}\"")
      result.stdout.encode!(universal_newline: true)
      result.stderr.encode!(universal_newline: true)
      convert_windows_output(result.stdout)
      # remove the CLIXML header trash in windows
      result.stderr.gsub!("#< CLIXML\n", '')
      result
    else
      CMD.run_command("#{prefix} #{exec_inspec} #{commandline}")
    end
  end

  def inspec_with_env(commandline, env = {})
    # CMD is a train transport, and does not support anything other than a
    # single param for the command line.
    # TODO: what is the intent of using Train here?
    # HACK: glue together env vars
    if is_windows?
      env_prefix = env.to_a.map { |assignment| "set #{assignment[0]}=#{assignment[1]}" }.join('&& ')
      env_prefix += '&& '
    else
      env_prefix = env.to_a.map { |assignment| "#{assignment[0]}=#{assignment[1]}" }.join(' ')
      env_prefix += ' '
    end
    inspec(commandline, env_prefix)
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
end
