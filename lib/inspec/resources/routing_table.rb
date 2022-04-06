require "inspec/resources/command"

module Inspec::Resources
  class Routingtable < Inspec.resource(1)
    # resource internal name.
    name "routing_table"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"
    supports platform: "windows"

    desc "Use the `routing_table` Chef InSpec audit resource to test the routing information parameters(destination, gateway and interface) present in the routing table."

    example <<~EXAMPLE
      describe routing_table do
        it do
          should have_entry(
            :destination => '192.168.43.1/32',
            :interface   => 'lxdbr0',
            :gateway     => '172.31.80.1',
          )
        end
      end

      describe routing_table do
        it { should have_entry(destination: '0.0.0.0', interface: 'eth0', gateway: '172.31.80.1') }
      end
    EXAMPLE

    def initialize
      skip_resource "The `routing_table` resource is not yet available on your OS." unless inspec.os.unix? || inspec.os.windows?
      # fetch the routing information and store it in @routing_info (could be hash, tbd)
      @routing_info = {}
      fetch_routing_information
    end

    # resource appearance in test reports.
    def to_s
      "routing_table"
    end

    def has_entry?(input_route)
      # check if the destination, gateway, interface exists as part of the routing_info
      if input_route.key?(:destination) && input_route.key?(:gateway) && input_route.key?(:interface)
        # check if there is key with destination's value in hash;
        # if yes, check if destination and gateway is present else return false
        @routing_info.key?(input_route[:destination]) ? @routing_info[input_route[:destination]].include?([input_route[:gateway], input_route[:interface]]) : false
      else
        raise Inspec::Exceptions::ResourceSkipped, "One or more missing key, have_entry? matcher expects a hash with 3 keys: destination, gateway and interface"
      end
    end

    private

    # fetches the routing information for the system
    def fetch_routing_information
      # check if netstat is available on the system
      utility = find_netstat_or_error

      # the command to fetch the routing information
      fetch_route_cmd = "#{utility} -rn"

      # execute the above netstat command
      cmd = inspec.command(fetch_route_cmd)

      # raise error if the exit status is not zero;
      raise Inspec::Exceptions::ResourceFailed, "Executing netstat failed: #{cmd.stderr}" if cmd.exit_status.to_i != 0

      # Todo:
      # Improve logic to fetch destination, gateway & interface efficiently.
      # The below logic assumes the following:
      # 1. destination, gateway & interface header is present as Destination, Gateway & (Iface or Netif or Interface) respectively.
      #    (Netif on BSD, Darwin,Iface on linux & Interface on Windows)
      # 2. there is no blank data for any columns or the blank data are present after the interface column.

      # cmd.stdout is the standard out of netstat -rn; split on new line to get the rows
      raw_route_info = cmd.stdout.split("\n")

      # since raw_route_info contains some row before the header (i.e. Destination Gateway ...); remove those rows
      raw_route_info.shift until raw_route_info[0] =~ /Destination/i

      # split each rows based on space to get the individual columns
      # raw_route_info is now array of arrays with the routing information
      raw_route_info.map! { |info| info.strip.split }

      # these variables will store the indices where destination, gateway and interface are present
      destination_index, gateway_index, interface_index = -1, -1, -1

      # The headers in windows are as:
      # Network Destination        Netmask          Gateway       Interface  Metric
      # Splitting on space makes "Network Destination" to be two separate values as "Network" & "Destination"
      # Remove "Network" value to apply the logic of finding index
      raw_route_info[0].shift if inspec.os.windows?

      # find the indices of destination, gateway and interface;
      # because the position of gateway & interface varies with operating system
      raw_route_info[0].each_with_index do |header, index|
        if header =~ /Destination/i
          destination_index = index
        elsif header =~ /Gateway/i
          gateway_index = index
        elsif header =~ /Iface|Netif|Interface/i
          interface_index = index
        end
      end

      # remove the initial header consisting of Destination, Gateway, Mask, ... since this is of no use
      raw_route_info.shift

      # check the indices are assigned with some index and not -1
      if destination_index != -1 && gateway_index != -1 && interface_index != -1
        # iterate through the route_info; and find destination, gateway and interface from each row
        raw_route_info.each do |info|
          # if value exists at the destination_index, gateway_index, and interface_index; store the value in @routing_info
          if !info[destination_index].nil? && !info[gateway_index].nil? && !info[interface_index].nil?
            # if the destination_key is already present, append the gateway & interface; else create new array and add them
            if @routing_info.key?(info[destination_index])
              @routing_info[info[destination_index]] << [info[gateway_index], info[interface_index]]
            else
              @routing_info[info[destination_index]] = [[info[gateway_index], info[interface_index]]]
            end
          end
        end
      end
    end

    # check if netstat is available on the system
    def find_netstat_or_error
      %w{/usr/sbin/netstat /sbin/netstat /usr/bin/netstat /bin/netstat netstat}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `netstat` utility to view routing table information"
    end
  end
end
