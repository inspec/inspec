require "functional/helper"

describe "profiles with missing resources" do
  include FunctionalHelper
  let(:config_dir_path) { File.expand_path "test/fixtures/config_dirs" }
  let(:ruby_abi_version) { RbConfig::CONFIG["ruby_version"] }
  let(:ruby_dir) { File.join(config_dir_path, "profile_gems", ".inspec/gems/#{ruby_abi_version}/gems") }

  let(:fallback_profile_path) { File.join(profile_path, "fallback-resource-packs") }

  # let(:profile_with_gem_dependency_without_gem_version) { File.join(profile_path, "profile-without-gem-version") }
  # let(:illformatted_gem_dependency) { File.join(profile_path, "profile-with-illformed-gem-depedency") }
  # let(:depdent_profile_gem_dependency) { File.join(profile_path, "profile-with-dependent-gem-dependency") }

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
    # TODO - this work if you have a private rubygems server and upload inspec-test-resources to it
    skip 
    out = inspec_with_env("exec #{fallback_profile_path} --no-create-lockfile --auto-install-gems")

    _(out.stderr).must_equal ""

    # Indicates that at least one ruby install happened
    # Want better test - check for actual gem
    _(File.directory?(ruby_dir)).must_equal true

    assert_exit_code 0, out
  end

end
