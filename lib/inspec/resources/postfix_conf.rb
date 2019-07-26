require "inspec/resources/ini"
require "inspec/utils/simpleconfig"

module Inspec::Resources
  class PostfixConf < IniConfig
    name "postfix_conf"
    supports platform: "linux"
    supports platform: "debian"
    desc "Use the postfix_conf Inspec audit resource to test the configuration of the Postfix Mail Transfer Agent"

    def parse(content)
      SimpleConfig.new(content).params
    end

    private

    def resource_base_name
      "POSTFIX_CONF"
    end
  end
end
