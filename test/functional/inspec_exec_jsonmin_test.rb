require "functional/helper"
require "json_schemer"

describe "inspec exec" do
  include FunctionalHelper

  parallelize_me!

  let(:out) { inspec("exec " + complete_profile + " --reporter json-min --no-create-lockfile") }
  let(:json) { JSON.load(out.stdout) }

  it "can execute a profile with the mini json formatter and validate its schema" do
    data = JSON.parse(out.stdout)
    sout = inspec("schema exec-jsonmin")
    schema = JSONSchemer.schema(sout.stdout)
    _(schema.validate(data).to_a).must_equal []

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "can execute a simple file with the mini json formatter and validate its schema" do
    out = inspec("exec " + example_control + " --reporter json-min --no-create-lockfile")
    _(out.stderr).must_equal ""
    _(out.exit_status).must_equal 0
    data = JSON.parse(out.stdout)
    sout = inspec("schema exec-jsonmin")
    schema = JSONSchemer.schema(sout.stdout)
    _(schema.validate(data).to_a).must_equal []

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "properly validates all (valid) unit tests against the schema" do
    schema = JSONSchemer.schema(JSON.parse(inspec("schema exec-jsonmin").stdout))
    all_profile_folders.first(1).each do |folder|
      begin
        out = inspec("exec " + folder + " --reporter json-min --no-create-lockfile")
        # Ensure it parses properly; discard the result
        out = JSON.parse(out.stdout)
        failures = schema.validate(out).to_a
        _(failures).must_equal []
      rescue JSON::ParserError
        # We don't actually care about these; cannot validate if parsing fails!
        nil
      end
    end
  end

  it "does not contain any dupilcate results with describe.one" do
    out = inspec("shell -c 'describe.one do describe 1 do it { should cmp 2 } end end' --reporter=json-min")
    data = JSON.parse(out.stdout)
    _(data["controls"].length).must_equal 1
    _(data["controls"][0]["message"]).must_equal "\nexpected: 2\n     got: 1\n\n(compared using `cmp` matcher)\n"

    _(out.stderr).must_equal ""

    assert_exit_code 100, out
  end

  describe "execute a profile with mini json formatting" do
    let(:controls) { json["controls"] }
    let(:ex1) { controls.find { |x| x["id"] == "test01" } }

    it "must have 1 example" do
      _(json["controls"].length).must_equal 1
    end

    it "has an id" do
      _(controls.find { |ex| !ex.key? "id" }).must_be :nil?
    end

    it "has a profile_id" do
      _(controls.find { |ex| !ex.key? "profile_id" }).must_be :nil?
    end

    it "has a code_desc" do
      _(ex1["code_desc"]).must_equal "Host example.com is expected to be resolvable"
      _(controls.find { |ex| !ex.key? "code_desc" }).must_be :nil?
    end

    it "has a status" do
      _(ex1["status"]).must_equal "passed"
    end
  end

end
