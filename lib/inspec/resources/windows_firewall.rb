module Inspec::Resources
  class WindowsFirewall < Inspec.resource(1)
    name "windows_firewall"
    supports platform: "windows"
    desc "Check properties of the Windows Firewall for a specific profile."
    example <<~EXAMPLE
      describe windows_firewall("Public") do
        it { should be_enabled }
        its("default_inbound_action") { should_not cmp "NotConfigured" }
        its("num_rules") { should be 19 }
      end
    EXAMPLE

    def initialize(profile = "Public")
      @profile = profile
      @state = {}

      load_profile_cmd = load_firewall_profile(profile)
      cmd = inspec.powershell(load_profile_cmd)

      @state = JSON.load(cmd.stdout) unless cmd.stdout.empty?
    end

    def to_s
      "Windows Firewall (Profile #{@profile})"
    end

    def exist?
      !@state.empty?
    end

    def enabled?
      @state["enabled"]
    end

    def default_inbound_allowed?
      @state["default_inbound_action"] == "Allow"
    end

    def default_outbound_allowed?
      @state["default_outbound_action"] == "Allow"
    end

    # Access to return values from Powershell via `its("PROPERTY")` and `have_PROPERTY "VALUE"`
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

    def load_firewall_profile(profile_name)
      <<-EOH
        Remove-TypeData System.Array # workaround for PS bug here: https://bit.ly/2SRMQ8M
        $profile = Get-NetFirewallProfile -Name "#{profile_name}"
        $count = @($profile | Get-NetFirewallRule).Count
        ([PSCustomObject]@{
          profile_name = $profile.Name
          profile = $profile.Profile.ToString()
          description = $profile.Description
          enabled = [bool]::Parse($profile.Enabled.ToString())
          default_inbound_action = $profile.DefaultInboundAction.ToString()
          default_outbound_action = $profile.DefaultOutboundAction.ToString()

          allow_inbound_rules = $profile.AllowInboundRules.ToString()
          allow_local_firewall_rules = $profile.AllowLocalFirewallRules.ToString()
          allow_local_ipsec_rules = $profile.AllowLocalIPsecRules.ToString()
          allow_user_apps = $profile.AllowUserApps.ToString()
          allow_user_ports = $profile.AllowUserPorts.ToString()
          allow_unicast_response_to_multicast = $profile.AllowUnicastResponseToMulticast.ToString()

          notify_on_listen = $profile.NotifyOnListen.ToString()
          enable_stealth_mode_for_ipsec = $profile.EnableStealthModeForIPsec.ToString()
          log_max_size_kilobytes = $profile.LogMaxSizeKilobytes
          log_allowed = $profile.LogAllowed.ToString()
          log_blocked = $profile.LogBlocked.ToString()
          log_ignored = $profile.LogIgnored.ToString()

          num_rules = $count
        }) | ConvertTo-Json
      EOH
    end
  end
end
