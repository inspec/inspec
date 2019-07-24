require "functional/helper"
require "json_schemer"

describe "inspec exec" do
  include FunctionalHelper

  parallelize_me!

  let(:out) { inspec("exec " + example_profile + " --reporter json-min --no-create-lockfile") }
  let(:json) { JSON.load(out.stdout) }

  it "can execute a profile with the mini json formatter and validate its schema" do
    data = JSON.parse(out.stdout)
    sout = inspec("schema exec-jsonmin")
    schema = JSONSchemer.schema(sout.stdout)
    schema.validate(data).to_a.must_equal []

    out.stderr.must_equal ""

    assert_exit_code 101, out
  end

  it "can execute a simple file with the mini json formatter and validate its schema" do
    out = inspec("exec " + example_control + " --reporter json-min --no-create-lockfile")
    out.stderr.must_equal ""
    out.exit_status.must_equal 0
    data = JSON.parse(out.stdout)
    sout = inspec("schema exec-jsonmin")
    schema = JSONSchemer.schema(sout.stdout)
    schema.validate(data).to_a.must_equal []

    out.stderr.must_equal ""

    skip_windows!
    assert_exit_code 0, out
  end

  it "properly validates all (valid) unit tests against the schema" do
    schema = JSONSchemer.schema(JSON.parse(inspec("schema exec-jsonmin").stdout))
    all_profile_folders.each do |folder|
      begin
        out = inspec("exec " + folder + " --reporter json-min --no-create-lockfile")
        # Ensure it parses properly; discard the result
        out = JSON.parse(out.stdout)
        failures = schema.validate(out).to_a
        failures.must_equal []
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
    let(:ex1) { controls.find { |x| x["id"] == "tmp-1.0" } }
    let(:ex2) { controls.find { |x| x["id"] =~ /generated/ } }
    let(:ex3) { controls.find { |x| x["id"] == "example-1.0" } }

    before do
      # doesn't make sense on windows TODO: change the profile so it does?
      skip if windows?
    end

    it "must have 6 examples" do
      json["controls"].length.must_equal 6
    end

    it "has an id" do
      _(controls.find { |ex| !ex.key? "id" }).must_be :nil?
    end

    it "has a profile_id" do
      _(controls.find { |ex| !ex.key? "profile_id" }).must_be :nil?
    end

    it "has a code_desc" do
      _(ex1["code_desc"]).must_equal "File / is expected to be directory"
      _(controls.find { |ex| !ex.key? "code_desc" }).must_be :nil?
    end

    it "has a status" do
      skip_windows!
      _(ex1["status"]).must_equal "passed"
      _(ex3["status"]).must_equal "skipped"
    end

    it "has a skip_message" do
      _(ex1["skip_message"]).must_be :nil?
      _(ex3["skip_message"]).must_equal "Can't find file `/tmp/example/config.yaml`"
    end
  end

end
