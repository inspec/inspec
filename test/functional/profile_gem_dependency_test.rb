require "functional/helper"

describe "profile with gem dependencies" do
  include FunctionalHelper
  let(:gem_dependency_profiles_path) { File.join(profile_path, "profile-with-gem-dependency") }
  let(:config_dir_path) { File.expand_path "test/fixtures/config_dirs" }

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
    assert_exit_code 0, out
  end
end
