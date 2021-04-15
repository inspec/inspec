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
      "SElinux modules"
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
      "SElinux booleans"
    end
  end

  class Selinux < Inspec.resource(1)
    name "selinux"
    supports platform: "linux"

    desc "Use selinux Inspec resource to test state/mode of the selinux policy."

    example <<~EXAMPLE
      describe selinux do
        it { should be_installed }
        it { should be_disabled }
        it { should be_permissive }
        it { should be_enforcing }
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
