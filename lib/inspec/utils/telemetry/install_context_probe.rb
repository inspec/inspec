module Inspec
  class Telemetry
    # Hueristics to determine how InSpec was installed.
    module InstallContextProbe

      def self.guess_install_context
        # These all work by simple path recognition
        return "chef-workstation" if chef_workstation_install?
        return "omnibus" if omnibus_install?
        return "chefdk" if chefdk_install?
        return "habitat" if habitat_install?

        # Order matters here - gem mode is easily mistaken for one of the above
        return "rubygem" if rubygem_install?

        return "source" if source_install?

        "unknown"
      end

      def self.chef_workstation_install?
        !!(Inspec.src_root.start_with?("/opt/chef-workstation") || Inspec.src_root.start_with?("C:/opscode/chef-workstation"))
      end

      def self.chefdk_install?
        !!(Inspec.src_root.start_with?("/opt/chef-dk") || Inspec.src_root.start_with?("C:/opscode/chef-dk"))
      end

      def self.habitat_install?
        !!Inspec.src_root.match(%r{hab/pkgs/chef/inspec/\d+\.\d+\.\d+/\d{14}})
      end

      def self.omnibus_install?
        !!(Inspec.src_root.start_with?("/opt/inspec") || Inspec.src_root.start_with?("C:/opscode/inspec"))
      end

      def self.rubygem_install?
        !!Inspec.src_root.match(%r{gems/inspec-\d+\.\d+\.\d+})
      end

      def self.source_install?
        # These are a couple of examples of dirs removed during packaging
        %w{habitat test}.all? do |devdir|
          Dir.exist?("#{Inspec.src_root}/#{devdir}")
        end
      end

    end
  end
end
