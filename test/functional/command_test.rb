# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'train'

describe 'Inspec::InspecCLI' do
  let(:runner) { Train.create('local').connection }
  let(:repo_path) { File.expand_path(File.join( __FILE__, '..', '..', '..')) }
  let(:exec_inspec) { File.join(repo_path, 'bin', 'inspec') }
  let(:profile_path) { File.join(repo_path, 'test', 'unit', 'mock', 'profiles') }
  let(:examples_path) { File.join(repo_path, 'examples') }

  def inspec(commandline)
    runner.run_command("#{exec_inspec} #{commandline}")
  end

  describe 'example profile' do
    let(:path) { File.join(examples_path, 'profile') }

    it 'check is successful' do
      out = inspec('check ' + path)
      out.stdout.must_match /Valid.*true/
      out.exit_status.must_equal 0
    end
  end

  describe 'example inheritance profile' do
    let(:path) { File.join(examples_path, 'inheritance') }

    it 'check fails without --profiles-path' do
      out = inspec('check ' + path)
      out.stderr.must_include 'You must supply a --profiles-path to inherit'
      out.exit_status.must_equal 1
    end

    it 'check succeeds with --profiles-path' do
      out = inspec('check ' + path + ' --profiles-path ' + examples_path)
      out.stdout.must_match /Valid.*true/
      out.exit_status.must_equal 0
    end
  end
end
