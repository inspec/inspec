require "helper"

describe Inspec::Lockfile do
  # Ruby 1.9: .to_yaml format is slightly different
  if Gem::Version.new(RUBY_VERSION) < Gem::Version.new("2.0")
    let(:lockfile_content) do
      <<~EOF
        ---
        lockfile_version: 1
        depends:
        - name: foo
          resolved_source:
            url: http://foo
          version_constraints: ! '>= 0'
          dependencies:
          - name: bar
            resolved_source:
              url: http://bar
            version_constraints: ! '>= 0'
      EOF
    end
  else
    let(:lockfile_content) do
      <<~EOF
        ---
        lockfile_version: 1
        depends:
        - name: foo
          resolved_source:
            url: http://foo
          version_constraints: ">= 0"
          dependencies:
          - name: bar
            resolved_source:
              url: http://bar
            version_constraints: ">= 0"
      EOF
    end
  end

  let(:lockfile_hash) do
    { "lockfile_version" => 1,
      "depends" => [
        { "name" => "foo", "resolved_source" => { "url" => "http://foo" }, "version_constraints" => ">= 0",
          "dependencies" => [{ "name" => "bar", "resolved_source" => { "url" => "http://bar" }, "version_constraints" => ">= 0" }]
        }] }
  end

  let(:lockfile_hash_with_symbols) do
    { "lockfile_version" => 1,
      "depends" => [
        { name: "foo", resolved_source: { url: "http://foo" }, version_constraints: ">= 0",
          dependencies: [{ name: "bar", resolved_source: { url: "http://bar" }, version_constraints: ">= 0" }]
        }] }
  end

  it "can generate a yaml representation of the lockfile" do
    l = Inspec::Lockfile.new(lockfile_hash)
    l.to_yaml.force_encoding("UTF-8").must_equal lockfile_content
  end

  it "can generates a yaml representation of the lockfile even when the depends keys are symbols" do
    l = Inspec::Lockfile.new(lockfile_hash_with_symbols)
    l.to_yaml.force_encoding("UTF-8").must_equal lockfile_content
  end

  it "uses symbol keys for the deps by default" do
    File.stubs(:read).with("testfile").returns(lockfile_content)
    l = Inspec::Lockfile.from_file("testfile")
    l.deps.must_equal lockfile_hash_with_symbols["depends"]
  end
end
