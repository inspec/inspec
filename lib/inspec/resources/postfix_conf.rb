require "inspec/resources/ini"
require "inspec/utils/simpleconfig"

module Inspec::Resources
  class PostfixConf < IniConfig
    name "postfix_conf"
    supports platform: "linux"
    desc "Use the postfix_conf Inspec audit resource to test the configuration of the Postfix Mail Transfer Agent"

    # Allow user to specify a custom configuration path, use default Postfix configuration path if no custom path is provided
    def initialize(*opts)
      @params = {}
      if opts.length == 1
        @raw_content = load_raw_content(opts[0])
      else
        @raw_content = load_raw_content("/etc/postfix/main.cf")
      end
      @params = parse(@raw_content)
    end

    def parse(content)
      SimpleConfig.new(content).params
    end

    def to_s
      "Postfix Mail Transfer Agent"
    end

    private

    def resource_base_name
      "Postfix Config"
    end
  end
end
