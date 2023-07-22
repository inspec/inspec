# Generates an option file by splitting a profile into sections, grouping controls.
module InspecPlugins::Parallelism
  class ProfileSplitter
    attr_reader :cli_options 
    
    def initialize(options)
      @cli_options = options
    end

    def split(profile)
      profile_info = profile.info
      control_ids = profile_info[:controls].map {|c| c[:id] }

      # If control ids look like rules, use group by rule
      if control_ids.all? { |i| i.match? /rule_\d+\./ }
        Inspec::Log.debug("Profile splitter detected CIS-rule style control IDs, splitting...")
        output_preamble(profile_info)
        group_by_rule(control_ids)
      else
        Inspec::Log.warn("Unable to find a splitting pattern for profile #{profile_info[:name]}")
        exit(2)
      end
    end

    def group_by_rule(control_ids)
      # Find highest rule group
      rule_group_count = control_ids.map { |i| i.match(/rule_(\d+)\./)[1].to_i }.max
      1.upto(rule_group_count) do |rule_num|
        opts_line = "--controls /rule_#{rule_num}\\./ "
        opts_line += " --reporter json:logs/rule_#{rule_num}.json"
        puts opts_line
      end 
    end

    def output_preamble(profile_info)
      puts <<EOT
# Options file for `inspec parallel exec` for use with InSpec Profile
# #{profile_info[:name]} version #{profile_info[:version]}
# Generated using `inspec parallel split` v#{Inspec::VERSION}
EOT
    end
  end
end