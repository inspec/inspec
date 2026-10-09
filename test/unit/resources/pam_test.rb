require "helper"
require "inspec/resource"
require "inspec/resources/pam"

describe Inspec::Resources::Pam do
  let(:resource_path) { "/etc/pam.d/system-auth" }
  let(:file_mock) { double("file") }

  before do
    # Mock the backend file resource
    allow_any_instance_of(Inspec::Resources::Pam).to receive(:inspec).and_return(double("inspec"))
    allow_any_instance_of(Inspec::Resources::Pam).to receive_message_chain(:inspec, :file).with(resource_path).and_return(file_mock)
  end

  it "skips the resource if the file does not exist" do
    allow(file_mock).to receive(:file?).and_return(false)
    # The file reader throws ResourceSkipped if the file is not a file
    # We just test that initialization throws the exception
    assert_raises(Inspec::Exceptions::ResourceSkipped) do
      Inspec::Resources::Pam.new(resource_path)
    end
  end

  it "returns empty properties when file is empty" do
    allow(file_mock).to receive(:file?).and_return(true)
    allow(file_mock).to receive(:content).and_return("")

    resource = Inspec::Resources::Pam.new(resource_path)
    _(resource.params).must_equal []
    _(resource.modules).must_equal []
  end

  it "parses PAM rules and integrates with FilterTable" do
    content = <<~EOF
      auth        required      pam_env.so
      auth        sufficient    pam_unix.so nullok try_first_pass
      account     required      pam_unix.so
      -session    optional      pam_systemd.so
      @include    common-auth
    EOF

    allow(file_mock).to receive(:file?).and_return(true)
    allow(file_mock).to receive(:content).and_return(content)

    resource = Inspec::Resources::Pam.new(resource_path)

    # FilterTable properties
    _(resource.types).must_equal ["auth", "auth", "account", "session", "@include"]
    _(resource.controls).must_equal ["required", "sufficient", "required", "optional", nil]
    _(resource.modules).must_equal ["pam_env.so", "pam_unix.so", "pam_unix.so", "pam_systemd.so", "common-auth"]

    # Testing the where filter
    auth_rules = resource.where(type: "auth")
    _(auth_rules.modules).must_include "pam_unix.so"
    _(auth_rules.modules).wont_include "pam_systemd.so"

    session_rules = resource.where(type: "session")
    _(session_rules.missing_oks).must_equal [true]
  end
end
