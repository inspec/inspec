module Inspec

  # Heuristics to determine how InSpec was installed.
  module InstallContextHelpers

    def guess_install_context
      # These all work by simple path recognition
      return "chef-workstation" if chef_workstation_install?
      return "omnibus" if omnibus_install?
      return "chefdk" if chefdk_install?
      return "habitat" if habitat_install?

      # Order matters here - gem mode is easily mistaken for one of the above
      return "docker" if docker_install?
      return "rubygem" if rubygem_install?

      return "source" if source_install?

      "unknown"
    end

    private

    def chef_workstation_install?
      !!(src_root.start_with?("/opt/chef-workstation") || src_root.start_with?("C:/opscode/chef-workstation"))
    end

    def chefdk_install?
      !!(src_root.start_with?("/opt/chef-dk") || src_root.start_with?("C:/opscode/chef-dk"))
    end

    def docker_install?
      # Our docker image is based on alpine. This could be easily fooled.
      !!(rubygem_install? && path_exist?("/etc/alpine-release")) && path_exist?("/.dockerenv")
    end

    def habitat_install?
      !!src_root.match(%r{hab/pkgs/chef/inspec/\d+\.\d+\.\d+/\d{14}})
    end

    def omnibus_install?
      !!(src_root.start_with?("/opt/inspec") || src_root.start_with?("C:/opscode/inspec"))
    end

    def rubygem_install?
      !!src_root.match(%r{gems/inspec-\d+\.\d+\.\d+})
    end

    def source_install?
      # These are a couple of examples of dirs removed during packaging
      %w{habitat test}.all? do |devdir|
        path_exist?("#{src_root}/#{devdir}")
      end
    end

    def path_exist?(path)
      File.exist? path
    end
  end
end
