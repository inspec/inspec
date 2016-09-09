require 'functional/helper'
require 'fileutils'
require 'tmpdir'

describe 'profiles with git-based dependencies' do
  include FunctionalHelper
  before(:all) do
    @tmpdir = Dir.mktmpdir
    @profile_dir = File.join(@tmpdir, "test-profile")
    @git_dep_dir = File.join(@tmpdir, "git-dep")

    Dir.chdir(@tmpdir) do
      inspec("init profile git-dep")
      inspec("init profile test-profile")
    end

    Dir.chdir(@git_dep_dir) do
      CMD.run_command("git init")
      CMD.run_command("git add .")
      CMD.run_command("git commit -m 'initial commit'")
      CMD.run_command("git commit -m 'another commit' --allow-empty")
      CMD.run_command("git tag antag")
    end

    File.open(File.join(@profile_dir, "inspec.yml"), 'a') do |f|
      f.write <<EOF
depends:
  - name: git-dep
    git: #{@git_dep_dir}
    tag: antag
EOF
    end
  end

  after(:all) do
    FileUtils.rm_rf(@tmpdir)
  end

  it 'executes a profile with a git based dependency' do
    out = inspec("exec #{@profile_dir}")
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
  end
end
