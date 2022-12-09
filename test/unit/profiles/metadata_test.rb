require "helper"
require "inspec/metadata"

describe "metadata with supported operating systems" do
  let(:logger) { Minitest::Mock.new }
  let(:empty_options) { {} }

  def supports_meta(params)
    res = Inspec::Metadata.from_yaml("mock", "---", nil, logger)
    # manually inject supported parameters
    res.params[:supports] = params
    Inspec::Metadata.finalize(res, "mock", empty_options, logger)
    res
  end

  describe "running on ubuntu 20.04" do
    let(:backend) { MockLoader.new(:ubuntu).backend }

    it "provides all metadata content" do
      s = "---\nname: hello #{rand}"
      res = Inspec::Metadata.from_yaml("mock", s, nil)
      Inspec::Metadata.finalize(res, "mock", empty_options)
      _(res.content).must_equal(s)
    end

    it "renders a YAML containing ERB" do
      data = <<EOF
      name: dummy
      title: InSpec Profile
      maintainer: The Authors
      copyright: The Authors
      copyright_email: you@example.com
      license: Apache-2.0
      summary: An InSpec Compliance Profile
      version: 0.1.0
      depends:
      - name: inherit
        url: "https://artifactory.com/artifactory/example-repo-local/inspec/0.4.1.tar.gz"
        username: <%= ENV['USERNAME'] %>
        password: <%= ENV['API_KEY'] %>
      gem_dependencies:
        - name: "test"
          version: "1.0.0"
      entitlement_id: "test-entitlement-id"
EOF
      ENV["USERNAME"] = "dummy_user"
      ENV["API_KEY"] = "dummy_pass"
      res = Inspec::Metadata.from_yaml("mock", data, nil)
      Inspec::Metadata.finalize(res, "mock", empty_options)
      _(res.params[:name]).must_equal "mock"
      _(res.params[:depends][0][:name]).must_equal "inherit"
      _(res.params[:depends][0][:url]).must_equal "https://artifactory.com/artifactory/example-repo-local/inspec/0.4.1.tar.gz"
      _(res.params[:depends][0][:username]).must_equal "dummy_user"
      _(res.params[:depends][0][:password]).must_equal "dummy_pass"
      _(res.params[:gem_dependencies][0][:name]).must_equal "test"
      _(res.params[:gem_dependencies][0][:version]).must_equal "1.0.0"
      _(res.params[:entitlement_id]).must_equal "test-entitlement-id"
    end

    it "finalizes a loaded metadata via Profile ID" do
      res = Inspec::Metadata.from_yaml("mock", "---", nil)
      Inspec::Metadata.finalize(res, "mock", empty_options)
      _(res.params[:name]).must_equal("mock")
    end

    it "finalizes a loaded metadata via Profile ID and overwrites the ID" do
      res = Inspec::Metadata.from_yaml("mock", "---\nname: hello", nil)
      Inspec::Metadata.finalize(res, "mock", empty_options)
      _(res.params[:name]).must_equal("mock")
    end

    it "reads the version from metadata" do
      res = Inspec::Metadata.from_yaml("mock", "---\nversion: '1.1.0'", nil)
      Inspec::Metadata.finalize(res, "mock", empty_options)
      _(res.params[:version]).must_equal("1.1.0")
      _(res).must_be :valid_version?, res.params[:version]
    end

    it "does not accept invalid version from metadata" do
      res = Inspec::Metadata.from_yaml("mock", "---\nversion: '1.1.0.1'", nil)
      Inspec::Metadata.finalize(res, "mock", empty_options)
      _(res.params[:version]).must_equal("1.1.0.1")
      _(res).wont_be :valid_version?, res.params[:version]
    end

    it "finalizes a loaded metadata by turning strings into symbols" do
      res = Inspec::Metadata.from_yaml("mock", "---\nauthor: world", nil)
      Inspec::Metadata.finalize(res, "mock", empty_options)
      _(res.params[:author]).must_equal("world")
    end

    it "sets a default name with the original target if there is no name, title, or profile_id" do
      res = Inspec::Metadata.from_yaml("mock", "---", nil, logger)
      options = { target: "/path/to/tests" }
      Inspec::Metadata.finalize(res, nil, options, logger)
      _(res.params[:name]).must_equal("tests from .path.to.tests")
    end

    it "does not overwrite an existing name when name exists and profile_id is nil" do
      res = Inspec::Metadata.from_yaml("mock", "\nname: my_name", nil)
      options = { target: "/path/to/tests" }
      Inspec::Metadata.finalize(res, nil, options, logger)
      _(res.params[:name]).must_equal("my_name")
    end

    it "does not set a default name if a title is provided and profile_id is nil" do
      res = Inspec::Metadata.from_yaml("mock", "\ntitle: my_title", nil)
      options = { target: "/path/to/tests" }
      Inspec::Metadata.finalize(res, nil, options, logger)
      _(res.params[:title]).must_equal("my_title")
      _(res.params[:name]).must_be_nil
    end

    def from_yaml(str)
      Inspec::Metadata.from_yaml("mock", "---\nsupports:\n  - #{str}", nil)
    end

    it "loads the support field from metadata" do
      res = from_yaml("os: ubuntu")

      _(res.params[:supports]).must_equal([{ os: "ubuntu" }])
    end

    it "makes sure the supports release field is a string" do
      res = from_yaml("release: 12.02")

      _(res.params[:supports]).must_equal([{ release: "12.02" }])
    end

    it "makes sure the supports release field is nil if not configured" do
      res = from_yaml("release: ")

      _(res.params[:supports]).must_equal([{ release: nil }])
    end

    it "load a profile with empty supports clause" do
      m = supports_meta(nil)
      _(m).must_be :supports_platform?, backend
    end

    it "loads a profile which supports os ubuntu" do
      m = supports_meta({ "os" => "ubuntu" })
      _(m).must_be :supports_platform?, backend
    end

    it "loads a profile which supports os name ubuntu" do
      m = supports_meta({ "os-name" => "ubuntu" })
      _(m).must_be :supports_platform?, backend
    end

    it "loads a profile which supports os family linux" do
      m = supports_meta({ "os-family" => "linux" })
      _(m).must_be :supports_platform?, backend
    end

    it "loads a profile which supports release 22.04" do
      m = supports_meta({ "release" => "22.04" })
      _(m).must_be :supports_platform?, backend
    end

    it "rejects a profile which supports release 12.04" do
      m = supports_meta({ "release" => "12.04" })
      _(m).wont_be :supports_platform?, backend
    end

    it "loads a profile which supports ubuntu 22.04" do
      m = supports_meta({ "os-name" => "ubuntu", "release" => "22.04" })
      _(m).must_be :supports_platform?, backend
    end

    it "loads a profile which supports ubuntu 22.*" do
      m = supports_meta({ "os-name" => "ubuntu", "release" => "22.*" })
      _(m).must_be :supports_platform?, backend
    end

    it "rejects a profile which supports ubuntu 12.04" do
      m = supports_meta({ "os-name" => "ubuntu", "release" => "12.04" })
      _(m).wont_be :supports_platform?, backend
    end

    it "rejects a profile which supports ubuntu 12.*" do
      m = supports_meta({ "os-name" => "ubuntu", "release" => "12.*" })
      _(m).wont_be :supports_platform?, backend
    end

    it "loads a profile which supports ubuntu float 22.04 as parsed by yml" do
      m = supports_meta({ "os-name" => "ubuntu", "release" => 22.04 })
      _(m).must_be :supports_platform?, backend
    end

    it "reject unsupported os" do
      m = supports_meta({ "os-name" => "windows" })
      _(m).wont_be :supports_platform?, backend
    end

    it "loads a profile which supports multiple families" do
      m = supports_meta([
        { "os-family" => "windows" },
        { "os-family" => "unix" },
      ])
      _(m).must_be :supports_platform?, backend
    end

    it "loads a profile which supports multiple names" do
      m = supports_meta([
        { "os-family" => "windows", "os-name" => "windows_2000" },
        { "os-family" => "unix", "os-name" => "ubuntu" },
      ])
      _(m).must_be :supports_platform?, backend
    end

    it "reject a profile which supports multiple families" do
      m = supports_meta([
        { "os-family" => "windows" },
        { "os-family" => "redhat" },
      ])
      _(m).wont_be :supports_platform?, backend
    end
  end

  describe "testing the supported runtime" do
    let(:current_version) { Inspec::VERSION }
    let(:next_version) { Gem::Version.new(current_version).bump.to_s }

    def version_meta(params)
      res = Inspec::Metadata.from_yaml("mock", "---", nil, logger)
      res.params[:inspec_version] = params
      Inspec::Metadata.finalize(res, "mock", empty_options, logger)
      res
    end

    it "returns true on testing the current version" do
      m = version_meta(current_version)
      _(m).must_be :supports_runtime?
    end

    it "returns true on testing the current version" do
      m = version_meta("= " + current_version)
      _(m).must_be :supports_runtime?
    end

    it "returns true on testing >= current version" do
      m = version_meta(">= " + current_version)
      _(m).must_be :supports_runtime?
    end

    it "returns false on testing >= the next version" do
      m = version_meta(">= " + next_version)
      _(m).wont_be :supports_runtime?
    end

    it "returns false on testing > the next version" do
      m = version_meta("> " + next_version)
      _(m).wont_be :supports_runtime?
    end

    it "is included in valid?" do
      m = version_meta("> #{next_version}")
      refute_predicate m, :valid?
    end
  end
end

describe "entitlement_id validation" do
  let(:logger) { Minitest::Mock.new }
  let(:empty_options) { {} }
  let(:backend) { MockLoader.new(:ubuntu).backend }

  def entitlement_id_check(entitlement_id)
    data = <<~EOF
name: dummy
title: InSpec Profile
version: 0.1.0
maintainer: human@example.com
summary: A test profile
description: A test profile
copyright: The Authors
copyright_email: you@example.com
license: Apache-2.0
#{entitlement_id}
    EOF
    md = Inspec::Metadata.from_yaml("mock", data, nil)
    Inspec::Metadata.finalize(md, "mock", empty_options)
    md.valid
  end

  it "validates well formatted entitlement_id" do
    data = <<~EOF
entitlement_id: "test-entitlement-id"
    EOF
    err, wrn = entitlement_id_check(data)
    _(err).must_be_empty
    _(wrn).must_be_empty
  end

  it "invalidates blank or empty entitlement_id" do
    data = <<~EOF
entitlement_id: " "
    EOF
    err, wrn = entitlement_id_check(data)
    _(err.count).must_equal 1
    _(err[0]).must_match(/Entitlement ID should not be blank./)
    _(wrn).must_be_empty
  end
end

describe "metadata validation" do
  let(:logger) { Minitest::Mock.new }
  let(:empty_options) { {} }
  let(:backend) { MockLoader.new(:ubuntu).backend }

  def gem_dep_check(gem_deps)
    data = <<~EOF
name: dummy
title: InSpec Profile
version: 0.1.0
maintainer: human@example.com
summary: A test profile
description: A test profile
copyright: The Authors
copyright_email: you@example.com
license: Apache-2.0
#{gem_deps}
    EOF
    md = Inspec::Metadata.from_yaml("mock", data, nil)
    Inspec::Metadata.finalize(md, "mock", empty_options)
    md.valid
  end

  it "validates a well-formed but versionless gem dep" do
    data = <<~EOF
gem_dependencies:
  - name: money
  - name: ordinal_array
    EOF
    err, wrn = gem_dep_check(data)
    _(err).must_be_empty
    _(wrn).must_be_empty
  end

  it "validates a complex versioned gem dep" do
    data = <<~EOF
gem_dependencies:
  - name: money
    version: "~>6.10, >= 5.0.0"
  - name: ordinal_array
    EOF
    err, wrn = gem_dep_check(data)
    _(err).must_be_empty
    _(wrn).must_be_empty
  end

  it "invalidates a malformed gem_dependencies section that is not an array" do
    data = <<~EOF
gem_dependencies:
  name: "test"
  version: "1.0.0"
    EOF
    err, wrn = gem_dep_check(data)
    _(err.count).must_equal 1
    _(err[0]).must_match(/gem_dependencies must be a List of Hashes/)
    _(wrn).must_be_empty
  end

  it "invalidates a malformed gem_dependencies section that is not an array of hashes" do
    data = <<~EOF
gem_dependencies:
  - A
  - B
  - C
    EOF
    err, wrn = gem_dep_check(data)
    _(err.count).must_equal 1
    _(err[0]).must_match(/gem_dependencies must be a List of Hashes/)
    _(wrn).must_be_empty
  end

  it "invalidates a malformed gem_dependencies section that is missing the name key" do
    data = <<~EOF
gem_dependencies:
  - potAto: potAHto
    EOF
    err, wrn = gem_dep_check(data)
    _(err.count).must_equal 1
    _(err[0]).must_match(/gem_dependencies entries must all have a 'name' field/)
    _(wrn.count).must_equal 1
    _(wrn[0]).must_match(/Unknown gem_dependencies key\(s\) potAto seen for entry ''/)
  end

  it "invalidates a malformed gem_dependencies section that has a malformed version constraint" do
    data = <<~EOF
gem_dependencies:
  - name: money
    version: lots
    EOF
    err, wrn = gem_dep_check(data)
    _(err.count).must_equal 1
    _(err[0]).must_match(/Unparseable gem dependency 'lots' for money/)
    _(wrn).must_be_empty
  end

  it "invalidates a malformed gem_dependencies section that has extra keys" do
    data = <<~EOF
gem_dependencies:
  - name: money
    versi0n: " >= 0"
    EOF
    err, wrn = gem_dep_check(data)
    _(wrn.count).must_equal 1
    _(wrn[0]).must_match(/Unknown gem_dependencies key\(s\) versi0n seen for entry 'money'/)
    _(err).must_be_empty
  end
end

