require "helper"
require "tempfile"
require "inspec/secrets"

describe Secrets::YAML do
  let(:yaml_file) do
    f = Tempfile.new(["waivers", ".yml"])
    f.write("control_1:\n  justification: \"waived\"\n  run: false\n")
    f.close
    f
  end

  after { yaml_file.unlink }

  it "loads a YAML file without the permitted_classes keyword on Ruby older than 3.1" do
    Gem.stubs(:ruby_version).returns(Gem::Version.new("3.0.3"))
    # Psych 3.3.2 (Ruby 3.0) rejects the permitted_classes keyword
    ::YAML.expects(:load_file).with(yaml_file.path).returns({ "control_1" => {} })

    Secrets::YAML.new(yaml_file.path).inputs.must_equal({ "control_1" => {} })
  end

  it "passes permitted_classes on Ruby 3.1 and later" do
    Gem.stubs(:ruby_version).returns(Gem::Version.new("3.1.0"))
    ::YAML.expects(:load_file).with(yaml_file.path, permitted_classes: [Date, Time]).returns({ "control_1" => {} })

    Secrets::YAML.new(yaml_file.path).inputs.must_equal({ "control_1" => {} })
  end
end
