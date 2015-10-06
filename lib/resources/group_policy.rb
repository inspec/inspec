# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

require 'json'

# return JSON object
def gpo(policy_path, policy_name)
  file = ::File.read(::File.join ::File.dirname(__FILE__), 'gpo.json')
  gpo_hash = JSON.parse(file)
  key = 'Machine--' + policy_path + '--' + policy_name
  gpo_hash[key]
end

# Group Policy
class GroupPolicy < Vulcano.resource(1)
  name 'group_policy'

  def get_registry_value(entry)
    keys = entry['registry_information'][0]
    cmd = "(Get-Item 'Registry::#{keys['path']}').GetValue('#{keys['key']}')"
    command_result ||= vulcano.command(cmd)
    val = { exit_code: command_result.exit_status.to_i, data: command_result.stdout }
    val
  end

  def convert_value(value)
    val = value.strip
    val = val.to_i if val.match(/^\d+$/)
    val
  end

  # returns nil, if not existant or value
  def method_missing(meth)
    # map gpo to registry key
    entry = gpo(@name, meth.to_s)

    # get data
    val = get_registry_value(entry)

    # verify data
    if (val[:exit_code] == 0)
      return convert_value(val[:data])
    else
      return nil
    end
  end

  def to_s
    'Group Policy'
  end
end
