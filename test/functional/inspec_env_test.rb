require "functional/helper"

describe "inspec env" do
  include FunctionalHelper

  parallelize_me!

  describe "inspec env with no args" do
    # env is a command only supported for
    # bash, zsh, and fish shells - so mac and linux
    unless windows?
      it "runs without warnings" do
        result = run_inspec_process("env")

        assert_empty result.stderr
        assert_exit_code 0, result

        # Part of the successful help usage message at the end, not likely to change
        _(result.stdout).must_include "inspec env SHELLNAME"
      end
    end
  end
end