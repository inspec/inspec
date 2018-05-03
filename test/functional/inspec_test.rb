# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

describe 'command tests' do
  include FunctionalHelper

  describe 'detect with json' do
    it 'runs well on all nodes' do
      out = inspec('detect --format json')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      j = JSON.load(out.stdout)
      j.keys.must_include 'name'
      j.keys.must_include 'family'
      j.keys.must_include 'arch'
      j.keys.must_include 'release'
    end
  end

  describe 'detect without json' do
    it 'runs well on all nodes' do
      out = inspec('detect')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      std = out.stdout
      std.must_include "\n== Operating System Details\n\n"
      std.must_include "\nName:      \e[0;36m"
      std.must_include "\nFamily:    \e[0;36m"
      std.must_include "\nArch:      \e[0;36m"
      std.must_include "\nRelease:   \e[0;36m"
    end
  end

  describe 'version' do
    it 'provides the version number on stdout' do
      out = inspec('version')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.must_match /^#{Inspec::VERSION}\n\nYour version of InSpec is out of date! The latest version is [0-9\.]*\n$/
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
end
