require 'functional/helper'

describe 'inspec shell tests' do
  include FunctionalHelper

  describe 'cmd' do
    def do_shell_c(code, exit_status, json = false, stderr = '')
      json_suffix = " --reporter 'json'" if json
      command = "shell -c '#{code.tr('\'','\\\'')}'#{json_suffix}"
      out = inspec(command)
      out.stderr.must_equal stderr
      out.exit_status.must_equal exit_status
      out
    end

    it 'loads a dependency' do
      res = inspec("shell -c 'gordon_config' --depends #{example_profile}")
      res.stderr.must_equal ''
      res.exit_status.must_equal 0
      res.stdout.chop.must_equal 'gordon_config'
    end

    it 'confirm file caching is disabled' do
      out = do_shell_c('inspec.backend.cache_enabled?(:file)', 0)
      out.stdout.chop.must_equal 'false'
    end

    it 'confirm command caching is disabled' do
      out = do_shell_c('inspec.backend.cache_enabled?(:command)', 0)
      out.stdout.chop.must_equal 'false'
    end

    it 'can run ruby expressions (json output)' do
      x = rand
      y = rand
      out = do_shell_c("#{x} + #{y}", 0, true)
      j = JSON.load(out.stdout)
      j.must_equal x+y
    end

    it 'can run ruby expressions' do
      x = rand
      y = rand
      out = do_shell_c("#{x} + #{y}", 0)
      out.stdout.must_equal "#{x+y}\n"
    end

    it 'can run arbitrary ruby (json output)' do
      # You cannot have a pipe in a windows command line
      return if is_windows?
      out = do_shell_c('x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10', 0, true)
      j = JSON.load(out.stdout)
      j.must_equal 24  # 1^2 + 2^2 + 3^2 + 10
    end

    it 'can run arbitrary ruby' do
      # You cannot have a pipe in a windows command line
      return if is_windows?
      out = do_shell_c('x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10', 0)
      out.stdout.must_equal "24\n"
    end

    it 'retrieves resources (json output)' do
      out = do_shell_c('platform.params', 0, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'name'
      j.keys.must_include 'families'
      j.keys.must_include 'arch'
      j.keys.must_include 'release'
    end

    it 'retrieves resources' do
      out = do_shell_c('os.params', 0)
      out.stdout.must_include 'name'
      out.stdout.must_include 'families'
      out.stdout.must_include 'arch'
      out.stdout.must_include 'release'
    end

    it 'runs anonymous tests that succeed (json output)' do
      out = do_shell_c("describe file(\"#{__FILE__}\") do it { should exist } end", 0, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'statistics'
    end

    it 'runs anonymous tests that succeed' do
      out = do_shell_c("describe file(\"#{__FILE__}\") do it { should exist } end", 0)
      out.stdout.must_include '1 successful'
      out.stdout.must_include '0 failures'
    end

    it 'runs anonymous tests that fail (json output)' do
      out = do_shell_c("describe file(\"foo/bar/baz\") do it { should exist } end", 100, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'statistics'
    end

    it 'runs anonymous tests that fail' do
      out = do_shell_c("describe file(\"foo/bar/baz\") do it { should exist } end", 100)
      out.stdout.must_include '0 successful'
      out.stdout.must_include '1 failure'
    end

    it 'runs controls with tests (json output)' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end", 0, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'statistics'
    end

    it 'runs controls with tests' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end", 0)
      out.stdout.must_include '1 successful'
      out.stdout.must_include '0 failures'
    end

    it 'runs controls with multiple tests (json output)' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end", 100, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'statistics'
    end

    it 'runs controls with multiple tests' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end", 100)
      out.stdout.must_include '0 successful'
      out.stdout.must_include '1 failure'
    end
  end

  # Pry does not support STDIN from windows currently. Skipping these for now.
  unless FunctionalHelper.is_windows?

    describe 'shell' do
      def do_shell(code, exit_status = 0, stderr = '')
        cmd = "echo '#{code.tr('\'','\\\'')}' | #{exec_inspec} shell"
        out = CMD.run_command(cmd)
        out.exit_status.must_equal exit_status
        out
      end

      it 'loads a dependency' do
        cmd = "echo 'gordon_config' | #{exec_inspec} shell --depends #{example_profile}"
        res = CMD.run_command(cmd)
        res.exit_status.must_equal 0
        res.stdout.must_include "=> gordon_config"
      end

      it 'displays the target device information for the user without requiring the help command' do
        out = do_shell('1+1')
        out.stdout.must_include 'You are currently running on:'
      end

      it 'provides a help command' do
        out = do_shell('help')
        out.stdout.must_include 'Available commands:'
        out.stdout.must_include 'You are currently running on:'
      end

      it 'provides resource help' do
        out = do_shell('help file')
        out.stdout.must_include 'Use the file InSpec audit resource'
      end

      it 'provides helpful feedback if an invalid resource is provided' do
        out = do_shell('help not_a_valid_resource')
        out.stdout.must_include 'The resource not_a_valid_resource does not exist.'
      end

      it 'provides a list of resources' do
        out = do_shell('help resources')
        out.stdout.must_include ' - command'
        out.stdout.must_include ' - file'
        out.stdout.must_include ' - sshd_config'
      end

      it 'provides matchers help' do
        out = do_shell('help matchers')
        out.stdout.must_include 'For more examples, see: https://www.inspec.io/docs/reference/matchers/'
      end

      it 'provides empty example help' do
        out = do_shell('help file')
        out.stdout.must_include 'Name'
        out.stdout.must_include 'Description'
        out.stdout.must_include 'Example'
        out.stdout.must_include 'Web Reference'
      end

      it 'exposes all resources' do
        out = do_shell('os')
        out.stdout.must_match(/\=> .*Operating.* .*System.* .*Detection/)
      end

      it 'can run ruby expressions' do
        x = rand
        y = rand
        out = do_shell("#{x} + #{y}")
        out.stdout.must_include "#{x+y}"
      end

      it 'can run arbitrary ruby' do
        out = do_shell('x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10')
        out.stdout.must_include "24"
      end

      it 'runs anonymous tests that succeed' do
        out = do_shell("describe file(\"#{__FILE__}\") do it { should exist } end")
        out.stdout.must_include '1 successful'
        out.stdout.must_include '0 failures'
      end

      it 'runs anonymous tests that fail' do
        out = do_shell("describe file(\"foo/bar/baz\") do it { should exist } end")
        out.stdout.must_include '0 successful'
        out.stdout.must_include '1 failure'
      end

      it 'runs controls with tests' do
        out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end")
        out.stdout.must_include '1 successful'
        out.stdout.must_include '0 failures'
      end

      it 'runs controls with multiple tests' do
        out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end")
        out.stdout.must_include '0 successful'
        out.stdout.must_include '1 failure'
      end

      it 'reruns controls when redefined' do
        out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end\ncontrol \"test\" do describe file(\"foo/bar/baz\") do it { should exist } end end")
        out.stdout.must_include '1 successful'
        out.stdout.must_include '1 failure'
      end
    end
  end
end
