# encoding: utf-8

require 'functional/helper'

describe 'command tests' do
  include FunctionalHelper

  describe 'version' do
    it 'provides the version number on stdout' do
      out = inspec('version')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.must_equal Inspec::VERSION+"\n"
    end

    it 'prints the version as JSON when the format is specified as JSON' do
      out = inspec('version --format=json')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.must_equal %({"version":"#{Inspec::VERSION}"}\n)
    end
  end

  describe 'check' do
    it 'verifies that a profile is ok' do
      out = inspec('check ' + example_profile)
      out.stdout.must_match(/Valid.*true/)
      out.exit_status.must_equal 0
    end
  end

  describe 'help' do
    it 'outputs the same message when using `help`, `--help`, or no args' do
      outputs = [
        inspec('help').stdout,
        inspec('--help').stdout,
        inspec('').stdout,
      ]

      outputs.uniq.length.must_equal 1
    end
  end
end
