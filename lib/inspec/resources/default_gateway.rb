require "inspec/resources/command"
require_relative "routing_table"

module Inspec::Resources
  class Defaultgateway < Routingtable
    # resource internal name.
    name "default_gateway"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"
    supports platform: "windows"

    desc "Use the `default_gateway` Chef InSpec audit resource to test the assigned ip address and interface for the default route."

    example <<~EXAMPLE
      describe default_gateway do
        its(:ipaddress) { should eq '172.31.80.1' }
      end
      describe default_gateway do
        its("interface") { should eq 'eth0' }
      end
    EXAMPLE

    def initialize
      skip_resource "The `default_gateway` resource is not yet available on your OS." unless inspec.os.unix? || inspec.os.windows?
      # invoke the routing_table initialize; which populates the @routing_info
      super()
    end

    # resource appearance in test reports.
    def to_s
      "default_gateway"
    end

    # fetches the ipaddress assigned to the default gateway
    # default gateway's destination is either `default` or `0.0.0.0`
    def ipaddress
      # @routing_info is the hash populated in routing_table resource
      # @routing_info contain values as:
      # {
      #   destination1: [ [gateway1x, interface1x], [gateway1y, interface1y] ],
      #   destination2: [gateway2, interface2]
      # }
      %w{default 0.0.0.0}.each do |destination|
        return @routing_info[destination][0][0] if @routing_info.key?(destination)
      end
      # raise exception because no destination with value default or 0.0.0.0 is found in the routing table
      raise Inspec::Exceptions::ResourceFailed, "No routing found as part of default gateway"
    end

    # fetches the interface assigned to the default gateway
    def interface
      %w{default 0.0.0.0}.each do |destination|
        return @routing_info[destination][0][1] if @routing_info.key?(destination)
      end
      # raise exception because no destination with value default or 0.0.0.0 is found in the routing table
      raise Inspec::Exceptions::ResourceFailed, "No routing found as part of default gateway"
    end
  end
end