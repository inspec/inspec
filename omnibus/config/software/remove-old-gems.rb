name "remove-old-gems"

license :project_license
skip_transitive_dependency_licensing true

build do
  block "Removing old versions of rexml < 3.4.2" do
    gemfile = "#{install_dir}/embedded/bin/gem"

    next unless File.exist?(gemfile)

    puts "Removing old versions of rexml < 3.4.2"
    env = with_standard_compiler_flags(with_embedded_path)

    # remove [-a] all rexml < 3.4.2 and [-I] ignore dependencies
    # Note: We do NOT use -x flag to avoid removing executables/binstubs
    command "#{gemfile} uninstall rexml -v \"<3.4.2\" -a -I", env: env
  end

  block "Removing old versions of net-imap < 0.5.14" do
    gembin = "#{install_dir}/embedded/bin/gem"

    next unless File.exist?(gembin)

    puts "Removing old versions of net-imap < 0.5.14"
    env = with_standard_compiler_flags(with_embedded_path)

    # remove [-a] all net-imap < 0.5.14 and [-I] ignore dependencies
    # Note: We do NOT use -x flag to avoid removing executables/binstubs
    command "#{gembin} uninstall net-imap -v \"<0.5.14\" -a -I", env: env
  end

  block "Remove Gemfile.lock files from installed gems" do
    require "fileutils"

    puts "Removing Gemfile.lock files from installed gems..."
    puts "These are development artifacts and not actual runtime dependencies."

    gems_dir = "#{install_dir}/embedded/lib/ruby/gems"

    # Find and remove all Gemfile.lock files within installed gems
    # These include: gems/*/Gemfile.lock, gems/**/Gemfile.lock
    lockfiles = Dir.glob("#{gems_dir}/**/Gemfile.lock")

    lockfiles.each do |lockfile|
      puts "  Removing: #{lockfile.sub(install_dir, "")}"
      FileUtils.rm_f(lockfile)
    end

    puts "Removed #{lockfiles.length} Gemfile.lock file(s)"
  end
end
