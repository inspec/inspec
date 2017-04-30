# encoding: utf-8

require 'functional/helper'

describe 'inspec shell tests' do
  include FunctionalHelper

  describe 'cmd' do
    def do_shell_c(code, exit_status, json = false, stderr = '')
      json_suffix = " --format 'json'" if json
      out = inspec("shell -c '#{code.tr('\'','\\\'')}'#{json_suffix}")
      out.stderr.must_equal stderr
      out.exit_status.must_equal exit_status
      out
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
      out = do_shell_c('x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10', 0, true)
      j = JSON.load(out.stdout)
      j.must_equal 24  # 1^2 + 2^2 + 3^2 + 10
    end

    it 'can run arbitrary ruby' do
      out = do_shell_c('x = [1,2,3].inject(0) {|a,v| a + v*v}; x+10', 0)
      out.stdout.must_equal "24\n"
    end

    it 'retrieves resources (json output)' do
      out = do_shell_c('os.params', 0, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'name'
      j.keys.must_include 'family'
      j.keys.must_include 'arch'
      j.keys.must_include 'release'
    end

    it 'retrieves resources' do
      out = do_shell_c('os.params', 0)
      out.stdout.must_include 'name'
      out.stdout.must_include 'family'
      out.stdout.must_include 'arch'
      out.stdout.must_include 'release'
    end

    it 'runs anonymous tests that succeed (json output)' do
      out = do_shell_c("describe file(\"#{__FILE__}\") do it { should exist } end", 0, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'other_checks'
      j.keys.must_include 'statistics'
    end

    it 'runs anonymous tests that succeed' do
      out = do_shell_c("describe file(\"#{__FILE__}\") do it { should exist } end", 0)
      out.stdout.must_include '1 successful'
      out.stdout.must_include '0 failures'
    end

    it 'runs anonymous tests that fail (json output)' do
      out = do_shell_c("describe file(\"foo/bar/baz\") do it { should exist } end", 1, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'other_checks'
      j.keys.must_include 'statistics'
    end

    it 'runs anonymous tests that fail' do
      out = do_shell_c("describe file(\"foo/bar/baz\") do it { should exist } end", 1)
      out.stdout.must_include '0 successful'
      out.stdout.must_include '1 failures'
    end

    it 'runs controls with tests (json output)' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end", 0, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'other_checks'
      j.keys.must_include 'statistics'
    end

    it 'runs controls with tests' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end", 0)
      out.stdout.must_include '1 successful'
      out.stdout.must_include '0 failures'
    end

    it 'runs controls with multiple tests (json output)' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end", 1, true)
      j = JSON.load(out.stdout)
      j.keys.must_include 'version'
      j.keys.must_include 'profiles'
      j.keys.must_include 'other_checks'
      j.keys.must_include 'statistics'
    end

    it 'runs controls with multiple tests' do
      out = do_shell_c("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end", 1)
      out.stdout.must_include '0 successful'
      out.stdout.must_include '1 failures'
    end
  end

  describe 'shell' do
    def do_shell(code, exit_status = 0, stderr = '')
      cmd = "echo '#{code.tr('\'','\\\'')}' | #{exec_inspec} shell"
      out = CMD.run_command(cmd)
      #out.stderr.must_equal stderr
      out.exit_status.must_equal exit_status
      out
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
      out.stdout.must_include '1 failures'
    end

    it 'runs controls with tests' do
      out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end")
      out.stdout.must_include '1 successful'
      out.stdout.must_include '0 failures'
    end

    it 'runs controls with multiple tests' do
      out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end; describe file(\"foo/bar/baz\") do it { should exist } end end")
      out.stdout.must_include '0 successful'
      out.stdout.must_include '1 failures'
    end

    it 'reruns controls when redefined' do
      out = do_shell("control \"test\" do describe file(\"#{__FILE__}\") do it { should exist } end end\ncontrol \"test\" do describe file(\"foo/bar/baz\") do it { should exist } end end")
      out.stdout.must_include '1 successful'
      out.stdout.must_include '1 failures'
    end
  end
end
