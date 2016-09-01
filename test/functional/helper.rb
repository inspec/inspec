# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

require 'minitest/hell'
class Minitest::Test
  parallelize_me!
end

class Module
  include Minitest::Spec::DSL
end

module FunctionalHelper
  let(:repo_path) { File.expand_path(File.join( __FILE__, '..', '..', '..')) }
  let(:exec_inspec) { File.join(repo_path, 'bin', 'inspec') }
  let(:profile_path) { File.join(repo_path, 'test', 'unit', 'mock', 'profiles') }
  let(:examples_path) { File.join(repo_path, 'examples') }

  let(:example_profile) { File.join(examples_path, 'profile') }
  let(:example_control) { File.join(example_profile, 'controls', 'example.rb') }
  let(:inheritance_profile) { File.join(examples_path, 'profile') }
  let(:failure_control) { File.join(profile_path, 'failures', 'controls', 'failures.rb') }

  let(:dst) {
    # create a temporary path, but we only want an auto-clean helper
    # so remove the file and give back the path
    res = Tempfile.new('inspec-shred')
    FileUtils.rm(res.path)
    TMP_CACHE[res.path] = res
  }

  def inspec(commandline)
    CMD.run_command("#{exec_inspec} #{commandline}")
  end
end
