require "functional/helper"

describe "profile with gem dependencies" do
  include FunctionalHelper
  let(:gem_dependency_profiles_path) { File.join(profile_path, "profile-with-gem-dependency") }
  let(:config_dir_path) { File.expand_path "test/fixtures/config_dirs" }
  let(:depdent_profile_gem_dependency) { File.join(profile_path, "profile-with-dependent-gem-dependency") }
  let(:ruby_abi_version) { RbConfig::CONFIG["ruby_version"] }
  let(:illformatted_gem_dependncy) { File.join(profile_path, "profile-with-illformed-gem-depedency") }

  def reset_globals
    ENV["HOME"] = Dir.home
  end

  before(:each) do
    reset_globals
    ENV["HOME"] = File.join(config_dir_path, "profile_gems")
  end

  after do
    reset_globals

    if config_dir_path
      Dir.glob(File.join(config_dir_path, "profile_gems")).each do |path|
        next if path.end_with? ".gitkeep"

        FileUtils.rm_rf(path)
      end
    end
  end

  it "installs the gem dependencies and load them if --auto-install-gems is provided." do
    out = inspec_with_env("exec #{gem_dependency_profiles_path} --no-create-lockfile --auto-install-gems")
    _(out.stderr).must_equal ""
    _(File.directory?(File.join(config_dir_path, "profile_gems", ".inspec/gems/#{ruby_abi_version}/gems"))).must_equal true
    assert_exit_code 0, out
  end

  it "installs the gem dependencies in dendent profile and load them if --auto-install-gems is provided." do
    out = inspec_with_env("exec #{depdent_profile_gem_dependency} --no-create-lockfile --auto-install-gems")
    _(out.stderr).must_equal ""
    _(File.directory?(File.join(config_dir_path, "profile_gems", ".inspec/gems/#{ruby_abi_version}/gems"))).must_equal true
    assert_exit_code 0, out
  end

  it "raises error for illformated gem dependencies found in the meta data file" do
    out = inspec_with_env("exec #{illformatted_gem_dependncy} --no-create-lockfile --auto-install-gems")
    _(out.stderr).must_include "Unparseable gem dependency '[\"+ 2.3.12\"]' for 'mongo'"
    assert_exit_code 1, out
  end
end
