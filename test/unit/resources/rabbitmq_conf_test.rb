require "helper"
require "inspec/resource"
require "inspec/resources/rabbitmq_config"

describe "Inspec::Resources::RabbitmqConf" do

  describe "rabbitmq_config" do
    it "check rabbitmq config parsing" do
      resource = load_resource("rabbitmq_config")
      _(resource.params("rabbit", "ssl_listeners")).must_equal [5671]
      _(resource.params("rabbit", "tcp_listeners")).must_equal({ "127.0.0.1" => 5672, "::1" => 5672 })
      _(resource.resource_id).must_equal "/etc/rabbitmq/rabbitmq.config"
    end
  end
end
