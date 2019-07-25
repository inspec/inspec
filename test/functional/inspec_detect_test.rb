require "functional/helper"

describe "inspec detect" do
  include FunctionalHelper

  it "outputs the correct data" do
    res = inspec("detect")

    res.stderr.must_equal ""

    stdout = res.stdout
    stdout.must_include "Platform Details"
    stdout.must_include "\nName:      \e[1m\e[36m"
    stdout.must_include "\nFamilies:  \e[1m\e[36m"
    stdout.must_include "\nArch:      \e[1m\e[36m"
    stdout.must_include "\nRelease:   \e[1m\e[36m"

    assert_exit_code 0, res
  end

  it "outputs the correct data when target the target an API" do
    res = inspec("detect -t aws://")
    res.stderr.must_equal ""

    stdout = res.stdout
    stdout.must_include "Platform Details"
    stdout.must_include "\nName:      \e[1m\e[36m"
    stdout.must_include "\nFamilies:  \e[1m\e[36m"
    stdout.must_include "\nRelease:   \e[1m\e[36m"

    stdout.wont_include "\nArch:"

    assert_exit_code 0, res
  end

  describe "when `--format json` is used`" do
    it "outputs the correct JSON data" do
      res = inspec("detect --format json")
      res.stderr.must_equal ""

      json = JSON.parse(res.stdout)
      json.keys.must_include "name"
      json.keys.must_include "families"
      json.keys.must_include "arch"
      json.keys.must_include "release"

      assert_exit_code 0, res
    end

    it "outputs the correct JSON data when the target an API" do
      res = inspec("detect -t aws:// --format json")
      res.stderr.must_equal ""

      json = JSON.parse(res.stdout)
      json.keys.must_include "name"
      json.keys.must_include "families"
      json.keys.must_include "release"

      json.keys.wont_include "arch"

      assert_exit_code 0, res
    end
  end
end
