# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/erlang_parser'

module Inspec::Resources
  class RabbitmqConf < Inspec.resource(1)
    name 'rabbitmq_config'
    desc 'Use the rabbitmq_config InSpec resource to test configuration data '\
         'for the RabbitMQ service located in /etc/rabbitmq/rabbitmq.config on '\
         'Linux and UNIX platforms.'
    example "
      describe rabbitmq_config.params('rabbit', 'ssl_listeners') do
        it { should cmp 5671 }
      end
    "

    def initialize(conf_path = nil)
      @conf_path = conf_path || '/etc/rabbitmq/rabbitmq.config'
    end

    def params(*opts)
      opts.inject(read_params) do |res, nxt|
        res.respond_to?(:key) ? res[nxt] : nil
      end
    end

    def to_s
      "rabbitmq_config #{@conf_path}"
    end

    private

    def read_content
      return @content if defined?(@content)
      file = inspec.file(@conf_path)
      if !file.file?
        return skip_resource "Can't find file \"#{@conf_path}\""
      end

      @content = file.content
    end

    def read_params
      return @params if defined?(@params)
      return @params = {} if read_content.nil?
      @params = ErlangConfigFile.parse(read_content)
    rescue Parslet::ParseFailed
      raise "Cannot parse RabbitMQ config: \"#{read_content}\""
    end
  end
end
