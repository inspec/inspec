require "inspec/resources/command"
require "inspec/utils/filter"

module Inspec::Resources
  class SelinuxModuleFilter
    # use filtertable for SELinux Modules
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:names, field: :name)
    filter.register_column(:status, field: :status)
    filter.register_column(:states, field: :state)
    filter.register_column(:priorities , field: :priority)
    filter.register_custom_matcher(:enabled?) { |x| x.states[0] == "enabled" }
    filter.register_custom_matcher(:installed?) { |x| x.status[0] == "installed" }
    filter.install_filter_methods_on_resource(self, :modules)

    attr_reader :modules
    def initialize(modules)
      @modules = modules
    end

    def to_s
      "SELinux modules"
    end
  end

  class SelinuxBooleanFilter
    # use filtertable for SELinux Booleans
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:names, field: :name)
    filter.register_column(:states, field: :state)
    filter.register_column(:defaults, field: :default)
    filter.register_custom_matcher(:on?) { |x| x.states[0] == "on" }
    filter.install_filter_methods_on_resource(self, :booleans)

    attr_reader :booleans
    def initialize(booleans)
      @booleans = booleans
    end

    def to_s
      "SELinux booleans"
    end
  end

  class Selinux < Inspec.resource(1)
    name "selinux"
    supports platform: "linux"

    desc "Use the selinux Chef InSpec resource to test the configuration data of the SELinux policy, SELinux modules, and SELinux booleans."

    example <<~EXAMPLE
      describe selinux do
        it { should be_installed }
        it { should be_disabled }
        it { should be_permissive }
        it { should be_enforcing }
      end

      describe selinux do
        its('policy') { should eq "targeted"}
      end

      describe selinux.modules.where("zebra") do
        it { should exist }
        it { should be_installed }
        it { should be_enabled }
      end

      describe selinux.modules.where(status: "installed") do
        it { should exist }
        its('count') { should cmp 404 }
      end

      describe selinux.booleans.where(name: "xend_run_blktap") do
        it { should be_on }
      end

      describe selinux.booleans.where { name == "xend_run_blktap" && state == "on" } do
       it { should exist }
      end
    EXAMPLE

    def initialize(selinux_path = "/etc/selinux/config")
      @path = selinux_path
      cmd = inspec.command("sestatus")

      if cmd.exit_status != 0
        # `sestatus` command not found error message comes in stdout so handling both here
        out = cmd.stdout + "\n" + cmd.stderr
        return skip_resource "Skipping resource: #{out}"
      end

      result = cmd.stdout.delete(" ").gsub(/\n/, ",").gsub(/\r/, "").downcase
      @data = Hash[result.scan(/([^:]+):([^,]+)[,$]/)]
    end

    def installed?
      inspec.file(@path).exist?
    end

    def disabled?
      @data["selinuxstatus"] == "disabled"
    end

    def enforcing?
      @data["currentmode"] == "enforcing"
    end

    def permissive?
      @data["currentmode"] == "permissive"
    end

    def policy
      @data["loadedpolicyname"]
    end

    def modules
      SelinuxModuleFilter.new(parse_modules)
    end

    def booleans
      SelinuxBooleanFilter.new(parse_booleans)
    end

    def to_s
      "SELinux"
    end

    private

    def parse_modules
      raw_modules = inspec.command("semodule -lfull").stdout
      r_modules = []
      raw_modules.each_line do |entry|
        data = entry.split.map(&:strip)
        state = data.length == 4 ? data[3] : "enabled"
        r_modules.push({ name: data[1], status: "installed", state: state, priority: data[0] })
      end
      r_modules
    end

    def parse_booleans
      raw_booleans = inspec.command("semanage boolean -l -n").stdout
      r_booleans = []
      raw_booleans.each_line do |entry|
        data = entry.scan(/([^(,)]+)/).flatten.map(&:strip)
        r_booleans.push({ name: data[0], state: data[1], default: data[2] })
      end
      r_booleans
    end
  end
end
