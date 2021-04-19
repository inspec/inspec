require "helper"
require "inspec/resource"
require "inspec/resources/json"

describe "Inspec::Resources::JSON" do
  describe "when loading a valid json" do
    let(:resource) { load_resource("json", "policyfile.lock.json") }

    it "gets params as a hashmap" do
      _(resource.params).must_be_kind_of Hash
    end

    it "retrieves nil if a param is missing" do
      _(resource.params["missing"]).must_be_nil
    end

    it "retrieves params by name" do
      _(resource.send("name")).must_equal "demo"
    end

    it "retrieves an array by name" do
      _(resource.send("run_list")).must_equal %w{a b}
    end

    it "doesnt resolve dot-notation names" do
      _(resource.send("x.y.z")).must_be_nil
    end

    it "doesnt resolve symbol-notation names" do
      _(resource.send(:'x.y.z')).must_be_nil
    end

    it "is enumerability matches its data" do
      enum = load_resource("json", content: '["a","b"]')
      not_enum = load_resource("json", content: "525600")

      _(enum.respond_to?(:each)).must_equal true
      _(not_enum.respond_to?(:each)).must_equal false
    end
  end

  describe "when loading a nonexistent file" do
    let(:resource) { load_resource("json", "nonexistent.json") }

    it "produces an error" do
      _(resource.resource_exception_message).must_equal "Can't find file: nonexistent.json"
    end

    it "still provides an empty hash for params" do
      _(resource.params).must_equal({})
    end
  end

  describe "#load_raw_from_file" do
    let(:path)     { "/path/to/file.txt" }
    let(:resource) { Inspec::Resources::JsonConfig.allocate }
    let(:inspec)   { mock }
    let(:file)     { mock }

    before do
      resource.stubs(:inspec).returns(inspec)
      inspec.expects(:file).with(path).returns(file)
    end

    it "raises an exception when the file does not exist" do
      file.expects(:file?).returns(false)
      _(proc { resource.send(:load_raw_from_file, path) }).must_raise Inspec::Exceptions::ResourceSkipped
    end

    it "raises an exception if the file content is nil" do
      file.expects(:file?).returns(true)
      file.expects(:content).returns(nil)
      _(proc { resource.send(:load_raw_from_file, path) }).must_raise Inspec::Exceptions::ResourceSkipped
    end

    it "raises an exception if the file content is empty" do
      file.expects(:file?).returns(true)
      file.expects(:content).at_least_once.returns("")
      _(proc { resource.send(:load_raw_from_file, path) }).must_raise Inspec::Exceptions::ResourceSkipped
    end

    it "returns the file content" do
      file.expects(:file?).returns(true)
      file.expects(:content).at_least_once.returns("json goes here")
      _(resource.send(:load_raw_from_file, path)).must_equal "json goes here"
    end
  end

  describe ":command" do
    # CASES:
    #
    # stdout:good,  stderr:empty
    # stdout:bad,   stderr:empty
    # stdout:empty, stderr:msg
    # stdout:empty, stderr:empty

    def run_json_cmd(cmd)
      Inspec::Config.cached["command_timeout"] = nil # Reset to default
      quick_resource("json", :linux, command: cmd)
    end

    # TODO: push up
    def assert_resource_skipped(res, msg)
      assert_predicate res, :resource_skipped?
      refute_predicate res, :resource_failed?

      assert_includes res.resource_exception_message, msg
    end

    # TODO: push up
    def assert_resource_failed(res, msg)
      refute_predicate res, :resource_skipped?
      assert_predicate res, :resource_failed?

      assert_includes res.resource_exception_message, msg
    end

    it "good stdout, empty stderr" do
      resource = run_json_cmd %(#{Gem.ruby} -rjson -e "h={'result'=>true}; puts h.to_json")

      assert_equal %({"result":true}), resource.raw_content.chomp
      assert_equal({ "result" => true }, resource.params)
    end

    it "bad stdout, empty stderr" do
      resource = run_json_cmd "echo 'not-valid-json'"

      assert_resource_failed resource, "unexpected token at 'not-valid-json"
    end

    it "empty stdout, message in stderr" do
      skip "Bug #4465: does not work on windows w/ transport==local" if windows?

      resource = run_json_cmd %{abort 'bad args'"}

      assert_resource_failed resource, "No JSON output, STDERR:"
    end

    it "empty stdout, empty stderr" do
      resource = run_json_cmd %{#{Gem.ruby} -e "exit 1"}

      assert_resource_failed resource, "No JSON output, STDERR was empty"
    end
  end
end
