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

  block "Removing old versions of net-imap < 0.2.5" do
    gembin = "#{install_dir}/embedded/bin/gem"

    next unless File.exist?(gembin)

    puts "Removing old versions of net-imap < 0.2.5"
    env = with_standard_compiler_flags(with_embedded_path)

    # remove [-a] all net-imap < 0.2.5 and [-I] ignore dependencies
    # CVE: GHSA-j3g3-5qv5-52mj
    # Note: We do NOT use -x flag to avoid removing executables/binstubs
    command "#{gembin} uninstall net-imap -v \"<0.2.5\" -a -I", env: env
  end
end
