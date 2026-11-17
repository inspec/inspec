require "helper"
require "inspec/utils/pam_parser"

describe Inspec::Utils::PamParser do
  let(:parser) { Inspec::Utils::PamParser }

  it "returns an empty array for nil content" do
    _(parser.parse(nil)).must_equal []
  end

  it "returns an empty array for empty content" do
    _(parser.parse("")).must_equal []
  end

  it "parses a basic PAM configuration" do
    content = <<~EOF
      auth required pam_env.so
      account required pam_unix.so
    EOF
    rules = parser.parse(content)
    _(rules.length).must_equal 2

    _(rules[0]["type"]).must_equal "auth"
    _(rules[0]["control"]).must_equal "required"
    _(rules[0]["module_path"]).must_equal "pam_env.so"
    _(rules[0]["module_args"]).must_equal []

    _(rules[1]["type"]).must_equal "account"
    _(rules[1]["control"]).must_equal "required"
  end

  it "handles whitespace and tabs properly" do
    content = "auth\t\trequired\t  pam_unix.so\t\t  try_first_pass"
    rules = parser.parse(content)
    _(rules.length).must_equal 1
    
  end

  it "ignores full-line and inline comments" do
    content = <<~EOF
      # This is a comment
      auth required pam_unix.so # inline comment
    EOF
    rules = parser.parse(content)
    _(rules.length).must_equal 1
    _(rules[0]["module_path"]).must_equal "pam_unix.so"
  end

  it "handles complex control syntax" do
    content = "auth [success=1 default=ignore] pam_unix.so nullok"
    rules = parser.parse(content)
    _(rules[0]["control"]).must_equal "[success=1 default=ignore]"
    _(rules[0]["module_path"]).must_equal "pam_unix.so"
    nullok"
  end

  it "handles missing_ok type prefixes" do
    content = "-session optional pam_systemd.so"
    rules = parser.parse(content)
    _(rules[0]["type"]).must_equal "session"
    _(rules[0]["missing_ok"]).must_equal true
  end

  it "handles line continuations" do
    content = <<~EOF
      auth required pam_unix.so \\
          nullok \\
          try_first_pass
    EOF
    rules = parser.parse(content)
    _(rules.length).must_equal 1
    nullok try_first_pass"
    _(rules[0]["module_args"]).must_equal ["nullok", "try_first_pass"]
  end

  it "handles Ubuntu style @include directives" do
    content = "@include common-auth"
    rules = parser.parse(content)
    _(rules.length).must_equal 1
    _(rules[0]["type"]).must_equal "@include"
    _(rules[0]["module_path"]).must_equal "common-auth"
    _(rules[0]["control"]).must_be_nil
  end

  it "handles Linux-PAM include directives" do
    content = "auth include system-auth"
    rules = parser.parse(content)
    _(rules.length).must_equal 1
    _(rules[0]["type"]).must_equal "auth"
    _(rules[0]["control"]).must_equal "include"
    _(rules[0]["module_path"]).must_equal "system-auth"
  end
end
