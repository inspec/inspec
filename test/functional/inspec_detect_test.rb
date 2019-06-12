require "functional/helper"

describe "inspec detect" do
  include FunctionalHelper

  before do
    skip_windows!
  end

  it "outputs the correct data" do
    res = inspec("detect")
    res.stderr.must_equal ""
    res.exit_status.must_equal 0

    stdout = res.stdout
    stdout.must_include "Platform Details"
    stdout.must_include "\nName:      \e[1m\e[36m"
    stdout.must_include "\nFamilies:  \e[1m\e[36m"
    stdout.must_include "\nArch:      \e[1m\e[36m"
    stdout.must_include "\nRelease:   \e[1m\e[36m"
  end

  it "outputs the correct data when target the target an API" do
    res = inspec("detect -t aws://")
    res.stderr.must_equal ""
    res.exit_status.must_equal 0

    stdout = res.stdout
    stdout.must_include "Platform Details"
    stdout.must_include "\nName:      \e[1m\e[36m"
    stdout.must_include "\nFamilies:  \e[1m\e[36m"
    stdout.must_include "\nRelease:   \e[1m\e[36m"

    stdout.wont_include "\nArch:"
  end

  describe "when `--format json` is used`" do
    it "outputs the correct JSON data" do
      res = inspec("detect --format json")
      res.stderr.must_equal ""
      res.exit_status.must_equal 0

      json = JSON.parse(res.stdout)
      json.keys.must_include "name"
      json.keys.must_include "families"
      json.keys.must_include "arch"
      json.keys.must_include "release"
    end

    it "outputs the correct JSON data when the target an API" do
      res = inspec("detect -t aws:// --format json")
      res.stderr.must_equal ""
      res.exit_status.must_equal 0

      json = JSON.parse(res.stdout)
      json.keys.must_include "name"
      json.keys.must_include "families"
      json.keys.must_include "release"

      json.keys.wont_include "arch"
    end
  end
end
