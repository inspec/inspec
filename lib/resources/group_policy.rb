# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'json'

# Group Policy
module Serverspec
  module Type

    # return JSON object
    def gpo (policy_path, policy_name)
      file = ::File.read(::File.join ::File.dirname(__FILE__), "gpo.json")
      gpo_hash = JSON.parse(file)      
      key = "Machine--" + policy_path + "--" + policy_name
      gpo_hash[key]
    end

    class GroupPolicy < Base

      def getRegistryValue(entry)
        keys = entry['registry_information'][0]
        cmd = "(Get-Item 'Registry::#{keys['path']}').GetValue('#{keys['key']}')"
        command_result ||= @runner.run_command(cmd)
        val = { :exit_code => command_result.exit_status.to_i, :data => command_result.stdout }
        val
      end

      def convertValue (value)
        val = value.strip
        val = val.to_i if val.match(/^\d+$/)
      end

      # returns nil, if not existant or value
      def method_missing(meth)
        # map gpo to registry key
        entry = gpo(@name, meth.to_s)

        # get data
        val = getRegistryValue(entry)

        # verify data
        if (val[:exit_code] == 0)
          val = convertValue(val[:data])
        else
          nil
        end

      end

      def to_s
        'Group Policy'
      end

    end

    def group_policy(policy_path)
      GroupPolicy.new(policy_path)
    end

  end
end

include Serverspec::Type
