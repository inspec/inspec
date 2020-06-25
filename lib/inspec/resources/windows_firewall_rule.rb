module Inspec::Resources
  class WindowsFirewallRule < Inspec.resource(1)
    name "windows_firewall_rule"
    supports platform: "windows"
    desc "Check properties of a Windows Firewall rule."
    example <<~EXAMPLE
      describe windows_firewall_rule("Name") do
        it { should exist }
        it { should be_enabled }

        it { should be_outbound}
        it { should be_tcp }
        it { should have_remote_port 80 }
      end
    EXAMPLE

    def initialize(name)
      @name = name
      @state = {}

      query = load_firewall_state(name)
      cmd = inspec.powershell(query)
      @state = JSON.load(cmd.stdout) unless cmd.stdout.empty?
    end

    def to_s
      "Windows Firewall Rule #{@name}"
    end

    def exist?
      !@state.empty?
    end

    def enabled?
      @state["enabled"]
    end

    def allowed?
      @state["action"] == "Allow"
    end

    def inbound?
      @state["direction"] == "Inbound"
    end

    def outbound?
      ! inbound?
    end

    def tcp?
      @state["protocol"] == "TCP"
    end

    def udp?
      @state["protocol"] == "UDP"
    end

    def icmp?
      @state["protocol"].start_with? "ICMP"
    end

    def icmpv4?
      @state["protocol"] == "ICMPv4"
    end

    def icmpv6?
      @state["protocol"] == "ICMPv6"
    end

    # Access to return values from Powershell via `its("PROPERTY")` and `have_PROPERTY? "VALUE"`
    def method_missing(method_name, *arguments, &_block)
      property = normalize_for_have_access(method_name)

      if method_name.to_s.start_with? "has_"
        expected_value = arguments.first
        respond_to_have(property, expected_value)
      else
        access_property(property)
      end
    end

    def respond_to_missing?(method_name, _include_private = false)
      property = normalize_for_have_access(method_name)

      @state.key? property
    end

    private

    def normalize_for_have_access(property)
      property.to_s
        .delete_prefix("has_")
        .delete_suffix("?")
    end

    def access_property(property)
      @state[property]
    end

    def respond_to_have(property, value)
      @state[property] == value
    end

    # Taken from Chef, but changed `firewall_action` to `action` for consistency
    # @see https://github.com/chef/chef/blob/master/lib/chef/resource/windows_firewall_rule.rb
    def load_firewall_state(rule_name)
      <<-EOH
        Remove-TypeData System.Array # workaround for PS bug here: https://bit.ly/2SRMQ8M
        $rule = Get-NetFirewallRule -Name "#{rule_name}"
        $addressFilter = $rule | Get-NetFirewallAddressFilter
        $portFilter = $rule | Get-NetFirewallPortFilter
        $applicationFilter = $rule | Get-NetFirewallApplicationFilter
        $serviceFilter = $rule | Get-NetFirewallServiceFilter
        $interfaceTypeFilter = $rule | Get-NetFirewallInterfaceTypeFilter
        ([PSCustomObject]@{
          rule_name = $rule.Name
          description = $rule.Description
          displayname = $rule.DisplayName
          group = $rule.Group
          local_address = $addressFilter.LocalAddress
          local_port = $portFilter.LocalPort
          remote_address = $addressFilter.RemoteAddress
          remote_port = $portFilter.RemotePort
          direction = $rule.Direction.ToString()
          protocol = $portFilter.Protocol
          icmp_type = $portFilter.IcmpType
          action = $rule.Action.ToString()
          profile = $rule.Profile.ToString()
          program = $applicationFilter.Program
          service = $serviceFilter.Service
          interface_type = $interfaceTypeFilter.InterfaceType.ToString()
          enabled = [bool]::Parse($rule.Enabled.ToString())
        }) | ConvertTo-Json
      EOH
    end
  end
end
