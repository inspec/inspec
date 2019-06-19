#
require "helper"
require "rbconfig"
require "mocha/test_unit"
require "inspec/shell_detector"

module ShellDetectorTestHelpers
  def no_proc
    Dir.expects(:exist?).with("/proc").returns(false)
  end

  def with_proc(shell)
    Dir.expects(:exist?).with("/proc").returns(true)
    File.expects(:readlink).with("/proc/#{ppid}/exe").returns(shell)
  end

  def with_ps(output)
    subject.expects(:'`').with("ps -cp #{ppid} -o command=").returns(output)
  end

  def with_env(shell)
    ENV.expects(:[]).with("SHELL").returns(shell)
  end

  def with_pwuid(shell)
    Process.expects(:uid).returns(9999)
    @mock_user = Minitest::Mock.new
    @mock_user.expect :shell, shell
    Etc.expects(:getpwuid).with(9999).returns(@mock_user)
  end
end

describe Inspec::ShellDetector do
  include ShellDetectorTestHelpers

  let(:subject) { Inspec::ShellDetector.new }
  let(:ppid) { Process.ppid }

  # Small hack to ensure we can test on windows
  it "returns nil immediately if running on windows" do
    RbConfig::CONFIG.expects(:[]).with("host_os").returns("mswin")
    subject.shell!.must_be_nil
  end

  describe "not on windows" do
    before do
      RbConfig::CONFIG.expects(:[]).with("host_os").returns("beos")
    end

    it "detects the shell via /proc if it exists" do
      with_proc("/usr/bin/fish")
      subject.shell!.must_equal("fish")
    end

    it "detects via `ps` if /proc doesn't exist" do
      no_proc; with_ps("/usr/bin/ksh")
      subject.shell!.must_equal("ksh")
    end

    it "detects via ENV if parent process methods failed" do
      no_proc; with_ps(""); with_env("fish")
      subject.shell!.must_equal("fish")
    end

    it "detects via getpwuid if all else fails" do
      no_proc; with_ps(""); with_env(""); with_pwuid("/usr/bin/fish")
      subject.shell!.must_equal("fish")
      @mock_user.verify
    end

    it "returns nil if the shell isn't in the whitelist" do
      no_proc; with_ps(""); with_env("badshell"); with_pwuid("/usr/bin/badshell")
      subject.shell!.must_be_nil
    end
  end
end
