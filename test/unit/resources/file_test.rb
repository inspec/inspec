require "helper"
require "inspec/resource"
require "inspec/resources/file"

describe Inspec::Resources::FileResource do
  let(:file) { stub(unix_mode_mask: 000, mode: 000) }

  it "responds on Ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "/fakepath/fakefile")
    resource.stubs(:exist?).returns(true)
    resource.stubs(:mounted?).returns(true)
    resource.stubs(:source_path).returns("/fakepath/fakefile")
    resource.stubs(:file).returns(file)
    resource.stubs(:content).returns("content")
    resource.stubs(:mode).returns(000)
    resource.stubs(:suid).returns(true)
    resource.stubs(:sgid).returns(true)
    resource.stubs(:sticky).returns(true)
    resource.stubs(:file_permission_granted?).with("read", "by_usergroup", "by_specific_user").returns("test_result")
    resource.stubs(:file_permission_granted?).with("write", "by_usergroup", "by_specific_user").returns("test_result")
    resource.stubs(:file_permission_granted?).with("execute", "by_usergroup", "by_specific_user").returns("test_result")

    _(resource.content).must_equal "content"
    _(resource.more_permissive_than?("000")).must_equal false
    _(resource.exist?).must_equal true
    _(resource.mounted?).must_equal true
    _(resource.to_s).must_equal "File /fakepath/fakefile"
    _(resource.readable?("by_usergroup", "by_specific_user")).must_equal "test_result"
    _(resource.allowed?("read", by: "by_usergroup", by_user: "by_specific_user")).must_equal "test_result"
    _(resource.writable?("by_usergroup", "by_specific_user")).must_equal "test_result"
    _(resource.allowed?("write", by: "by_usergroup", by_user: "by_specific_user")).must_equal "test_result"
    _(resource.executable?("by_usergroup", "by_specific_user")).must_equal "test_result"
    _(resource.allowed?("execute", by: "by_usergroup", by_user: "by_specific_user")).must_equal "test_result"
    _(resource.suid).must_equal true
    _(resource.sgid).must_equal true
    _(resource.sticky).must_equal true
    _(proc { resource.send(:more_permissive_than?, nil) }).must_raise(ArgumentError)
    _(proc { resource.send(:more_permissive_than?, 0700) }).must_raise(ArgumentError)
  end

  it "responds on Windows" do
    resource = MockLoader.new(:windows).load_resource("file", "C:/fakepath/fakefile")
    resource.stubs(:exist?).returns(true)
    resource.stubs(:mounted?).returns(true)
    resource.stubs(:content).returns("content")
    resource.stubs(:file_permission_granted?).with("read", "by_usergroup", "by_specific_user").returns("test_result")
    resource.stubs(:file_permission_granted?).with("write", "by_usergroup", "by_specific_user").returns("test_result")
    resource.stubs(:file_permission_granted?).with("execute", "by_usergroup", "by_specific_user").returns("test_result")
    resource.stubs(:file_permission_granted?).with("full-control", "by_usergroup", "by_specific_user").returns("test_result")
    resource.stubs(:user_permissions).returns({ "NT AUTHORITY\\SYSTEM" => "FullControl", "NT AUTHORITY\\Authenticated Users" => "ReadAndExecute", "BUILTIN\\Administrators" => "FullControl" })
    _(resource.content).must_equal "content"
    _(resource.exist?).must_equal true
    _(resource.mounted?).must_equal true
    _(resource.readable?("by_usergroup", "by_specific_user")).must_equal "test_result"
    _(resource.allowed?("read", by: "by_usergroup", by_user: "by_specific_user")).must_equal "test_result"
    _(resource.writable?("by_usergroup", "by_specific_user")).must_equal "test_result"
    _(resource.allowed?("write", by: "by_usergroup", by_user: "by_specific_user")).must_equal "test_result"
    _(resource.executable?("by_usergroup", "by_specific_user")).must_equal "test_result"
    _(resource.allowed?("execute", by: "by_usergroup", by_user: "by_specific_user")).must_equal "test_result"
    _(resource.allowed?("full-control", by: "by_usergroup", by_user: "by_specific_user")).must_equal "test_result"
    _(resource.user_permissions).must_equal({ "NT AUTHORITY\\SYSTEM" => "FullControl", "NT AUTHORITY\\Authenticated Users" => "ReadAndExecute", "BUILTIN\\Administrators" => "FullControl" })
  end

  it "returns true if file has inheritance enabled on Windows." do
    resource = MockLoader.new(:windows).load_resource("file", "C:/fakepath/fakefile")
    resource.stubs(:exist?).returns(true)
    _(resource.inherited?).must_equal true
  end

  it "does not support Windows-style ACL on Ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "/fakepath/fakefile")
    resource.stubs(:exist?).returns(true)
    _(proc { resource.send("allowed?", "full-control", { by: "by_usergroup", by_user: "by_specific_user" }) }).must_raise(RuntimeError)
    _(proc { resource.send("allowed?", "modify", { by: "by_usergroup", by_user: "by_specific_user" }) }).must_raise(RuntimeError)
  end

  it "does not support check by mask on Windows" do
    resource = MockLoader.new(:windows).load_resource("file", "C:/fakepath/fakefile")
    resource.stubs(:exist?).returns(true)
    _(proc { resource.send("readable?", "by_usergroup", nil) }).must_raise(RuntimeError)
    _(proc { resource.send("writable?", "by_usergroup", nil) }).must_raise(RuntimeError)
    _(proc { resource.send("executable?", "by_usergroup", nil) }).must_raise(RuntimeError)
  end

  it "responds with errors on unsupported OS" do
    resource = MockLoader.new(:undefined).load_resource("file", "C:/fakepath/fakefile")
    resource.stubs(:exist?).returns(true)
    _(resource.exist?).must_equal true
    _(resource.readable?("by_usergroup", "by_specific_user")).must_equal "`readable?` is not supported on your OS yet."
    _(resource.writable?("by_usergroup", "by_specific_user")).must_equal "`writable?` is not supported on your OS yet."
    _(resource.executable?("by_usergroup", "by_specific_user")).must_equal "`executable?` is not supported on your OS yet."
    _(resource.allowed?("permission", by: "by_usergroup", by_user: "by_specific_user")).must_equal "`allowed?` is not supported on your OS yet."
    _(resource.inherited?).must_equal "`inherited?` is not supported on your OS yet."
    _(proc { resource.send(:contain, nil) }).must_raise(RuntimeError)
  end
end

describe Inspec::Resources::FileResource do
  let(:file) { stub(unix_mode_mask: 000, mode: 644) }

  it "more_permissive_than?" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "/fakepath/fakefile")

    # TODO: this is NOT a valid way to test. Please use _actual_ mock files
    # so we aren't beholden to the CI umask and other trivialities.
    path = "test/fixtures/files/emptyfile"
    File.chmod 0644, path
    perms = "perms = %03o" % [File.stat(path).mode]

    _(resource).wont_be :more_permissive_than?, "755", perms
    _(resource).wont_be :more_permissive_than?, "644", perms
    _(resource).must_be :more_permissive_than?, "640", perms

    _(proc { resource.send(:more_permissive_than?, "0888") }).must_raise(ArgumentError)
  end

  it "when file does not exist" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "file_does_not_exist")
    assert_nil(resource.send(:more_permissive_than?, nil))
  end
end

# Test for be_immutable matcher and content_as_json, content_as_yaml properties
describe Inspec::Resources::FileResource do

  it "checks if the given file is immutable on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "constantfile.txt")
    _(resource.immutable?).wont_be_nil
  end

  # be_immutable is supported on unix systems only.
  it "checks if the given file is immutable on windows" do
    resource = MockLoader.new(:windows).load_resource("file", "constantfile.txt")
    ex = _ { resource.immutable? }.must_raise(Inspec::Exceptions::ResourceSkipped)
    _(ex.message).must_include "The `be_immutable` matcher is not supported on your OS yet."
  end

  it "checks the content_as_json property" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "myjson.json")
    _(resource.exist?).must_equal true
    _(resource.content_as_json).must_include("name")
    _(resource.content_as_json["name"]).must_equal("hello")
    _(resource.content_as_json).must_include("meta")
    _(resource.content_as_json["meta"]).must_include("creator")
    _(resource.content_as_json).must_include("array")
    _(resource.content_as_json["array"]).must_equal(%W{ zero one })
  end

  it "checks the content_as_yaml property" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "myyaml.yml")
    _(resource.exist?).must_equal true
    _(resource.content_as_yaml).must_include("name")
    _(resource.content_as_yaml["name"]).must_equal("vagrant")
    _(resource.content_as_yaml).must_include("symbol_key".to_sym)
    _(resource.content_as_yaml["symbol_key".to_sym]).must_equal(123)
    _(resource.content_as_yaml["driver"]).must_include("customize")
  end

  it "checks the content_as_json for file with invalid content" do
    resource = MockLoader.new(:ubuntu).load_resource("file", "myinvalid.file")
    _(resource.exist?).must_equal true
    ex = _ { resource.content_as_json }.must_raise(Inspec::Exceptions::ResourceFailed)
    _(ex.message).must_include "Unable to parse the given JSON file"
  end
end
