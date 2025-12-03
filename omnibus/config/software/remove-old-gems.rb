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
end
