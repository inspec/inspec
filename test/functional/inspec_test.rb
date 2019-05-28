require 'functional/helper'

describe 'command tests' do
  include FunctionalHelper

  describe 'version' do
    it 'provides the version number on stdout' do
      out = inspec('version')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      # Tolerate working on an out of date branch
      output = out.stdout.split("\n").reject { |l| l.start_with?('Your version of InSpec is out of date!') }.join("\n") + "\n"
      output.must_equal Inspec::VERSION + "\n"
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
    let(:outputs) {
      [
        inspec('help').stdout,
        inspec('--help').stdout,
        inspec('').stdout,
      ]
    }

    it 'outputs the same message regardless of invocation' do
      outputs.uniq.length.must_equal 1
    end

    it 'outputs both core commands and v2 CLI plugins' do
      commands = %w{
        archive
        artifact
        check
        compliance
        detect
        env
        exec
        habitat
        help
        init
        json
        plugin
        shell
        supermarket
        vendor
        version
      }
      outputs.each do |output|
        commands.each do |subcommand|
          output.must_include('inspec ' + subcommand)
        end
      end
    end
  end
end
