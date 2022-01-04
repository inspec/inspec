module Inspec::Resources
  class KernelParameters < Inspec.resource(1)
    name "kernel_parameters"
    supports platform: "unix"
    desc "Use the kernel_parameters InSpec audit resource to test kernel parameters on Linux platforms."
    example <<~EXAMPLE
      describe kernel_parameters.where(parameter: /^net./ ) do
        its('parameters') { should include 'net.ipv4.conf.all.forwarding' }
      end

      describe kernel_parameters.where(parameter: "net.ipv4.conf.all.forwarding") do
        its('values') { should eq [0] }
      end

      describe kernel_parameters do
        its('parameters') { should include 'net.ipv4.conf.all.forwarding' }
        its('values') { should include 0 }
      end
    EXAMPLE

    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:parameters, field: "parameter")
      .register_column(:values, field: "value")
    filter.install_filter_methods_on_resource(self, :params)

    def initialize
      # this resource is only supported on Linux
      return skip_resource "The `kernel_parameters` resource is not supported on your OS." unless inspec.os.linux?
    end

    def to_s
      "Kernel Parameters"
    end

    private

    def params
      cmd = inspec.command("/sbin/sysctl -a")
      cmd.exit_status != 0 ? [] : parse_kernel_paramater(cmd.stdout)
    end

    def parse_kernel_paramater(stdout)
      result = []
      stdout.split("\n").each do |out|
        splitted_output = out.split("=").map(&:strip)
        result.push(
          {
            "parameter" => splitted_output[0],
            "value" => splitted_output[1].to_i,
          }
        )
      end
      result
    end

  end
end