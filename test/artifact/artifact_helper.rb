require "minitest/autorun"
require "open3"

TEST_CLI_OPTS = "--chef-license=accept-no-persist".freeze

class ArtifactTest < Minitest::Test
  make_my_diffs_pretty!

  def run_cmd(cmd)
    env  = { "PATH" => ENV["PATH"] }
    pwd  = ENV["project_root"] || `git rev-parse --show-toplevel`.chomp
    opts = { chdir: pwd }

    Open3.capture3(env, cmd, opts)
  end

  def assert_artifact(inspec_command)
    stdout, stderr, status = run_cmd "inspec #{inspec_command} #{TEST_CLI_OPTS}"

    assert_empty stderr.sub(/#< CLIXML\n/, "")
    assert stdout
    assert status
  end
end
