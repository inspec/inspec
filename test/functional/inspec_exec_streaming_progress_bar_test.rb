require "functional/helper"

describe "inspec exec with streaming progress bar reporter" do
  include FunctionalHelper

  parallelize_me!

  it "can execute a simple file and validate the streaming progress bar schema" do
    skip_windows!

    out = inspec("exec " + example_control + " --reporter progress-bar --no-create-lockfile")
    _(out.stderr).must_include "[100.00%]"
    _(out.stderr).must_include "[38;5;41m"
    _(out.stderr).wont_include "[38;5;9m"
    assert_exit_code 0, out
  end

  it "can execute a simple file while using end of options after reporter streaming progress bar option" do
    skip_windows!

    out = inspec("exec --no-create-lockfile --reporter progress-bar -- " + example_control)
    _(out.stderr).must_include "[100.00%]"
    _(out.stderr).must_include "[38;5;41m"
    _(out.stderr).wont_include "[38;5;9m"
    assert_exit_code 0, out
  end

  it "can execute a profile with dependent profiles" do
    profile = File.join(profile_path, "dependencies", "inheritance")
    out = inspec("exec " + profile + " --reporter progress-bar --no-create-lockfile")
    assert_exit_code 0, out
  end

  it "can execute a profile with --tags filters" do
    profile = File.join(profile_path, "control-tags")
    out = inspec("exec " + profile + " --tags tag1 --reporter progress-bar --no-create-lockfile")
    _(out.stderr).must_include "[100.00%]"
    _(out.stderr).must_include "[1/1]"
    assert_exit_code 0, out
  end

  it "can execute a profile with --controls filters" do
    out = inspec("exec " + File.join(profile_path, "controls-option-test") + " --no-create-lockfile --controls foo --reporter progress-bar")
    _(out.stderr).must_include "[100.00%]"
    _(out.stderr).must_include "[1/1]"
    assert_exit_code 0, out
  end

  it "can execute multiple profiles" do
    out = inspec("exec " + File.join(profile_path, "control-tags") + " " + File.join(profile_path, "controls-option-test") + " --no-create-lockfile --reporter progress-bar")
    _(out.stderr).must_include "[100.00%]"
    _(out.stderr).must_include "[10/10]"
    assert_exit_code 100, out
  end

  it "can execute and print proper output when tests are failed" do
    skip_windows!

    out = inspec("exec " + File.join(profile_path, "control-tags") + " --tags tag18 --no-create-lockfile --reporter progress-bar")
    _(out.stderr).must_include "[100.00%]"
    _(out.stderr).must_include "[38;5;9m"
    _(out.stderr).wont_include "[38;5;247m"
    _(out.stderr).wont_include "[38;5;41m"
    assert_exit_code 100, out
  end

  it "can execute and print proper output when tests are skipped" do
    skip_windows!

    out = inspec("exec " + File.join(profile_path, "skippy-controls") + " --no-create-lockfile --reporter progress-bar")
    _(out.stderr).must_include "[100.00%]"
    _(out.stderr).must_include "[38;5;247m"
    _(out.stderr).wont_include "[38;5;41m"
    _(out.stderr).wont_include "[38;5;9m"
    assert_exit_code 101, out
  end

  it "shows enhanced_outcomes with enhanced_outcomes flag" do
    skip_windows!

    out = inspec("exec " + File.join(profile_path, "enhanced-outcomes-test") + " --no-create-lockfile --reporter progress-bar --enhanced-outcomes")
    _(out.stderr).must_include "[ERROR]    tmp-1.0.1"
    _(out.stderr).must_include "[ERROR]    tmp-1.0.2"
    _(out.stderr).must_include "[N/A]      tmp-2.0.1"
    _(out.stderr).must_include "[N/A]      tmp-2.0.2"
    _(out.stderr).must_include "[N/R]      tmp-3.0.1"
    _(out.stderr).must_include "[N/R]      tmp-3.0.2"
    _(out.stderr).must_include "[N/R]      tmp-3.0.2"
    _(out.stderr).must_include "[FAILED]   tmp-4.0"
    _(out.stderr).must_include "[PASSED]   tmp-5.0"
    assert_exit_code 100, out
  end

end
