require "functional/helper"
require "json-schema"
require "inspec/schema"

describe "inspec exec" do
  include FunctionalHelper

  parallelize_me!

  let(:out) { inspec("exec " + example_profile + " --reporter json-min --no-create-lockfile") }
  let(:json) { JSON.load(out.stdout) }

  it "can execute a profile with the mini json formatter and validate its schema" do
    data = JSON.parse(out.stdout)
    sout = Inspec::Schema.json("exec-jsonmin")
    schema = JSON.parse(sout)
    _(JSON::Validator.validate(schema, data)).wont_equal false

    _(out.stderr).must_equal ""

    assert_exit_code 101, out
  end

  it "does not contain any duplicate results with describe.one" do
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

    it "must have 5 examples" do
      _(json["controls"].length).must_equal 5
    end

    it "has an id" do
      _(controls.find { |ex| !ex.key? "id" }).must_be :nil?
    end

    it "has a profile_id" do
      _(controls.find { |ex| !ex.key? "profile_id" }).must_be :nil?
    end

    it "has a code_desc" do
      _(ex1["code_desc"]).must_equal "File / should be directory"
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
