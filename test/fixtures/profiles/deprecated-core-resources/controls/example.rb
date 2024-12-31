# copyright: 2018, The Authors

title "sample section"

control "mongodb_conf" do
  impact 1.0
  title "Verifies the configuration of MongoDB"
  desc "Verifies the configuration of MongoDB"

  describe mongodb_conf("./test/fixtures/files/mongod.conf") do
    its(%w{storage dbPath}) { should eq "/var/lib/mongodb" }
  end
end

control "rabbitmq config test" do
  impact 1.0
  title "RabbitMQ Config Test"
  desc "Verifies the configuration of RabbitMQ"

  describe rabbitmq_config("./test/fixtures/files/rabbitmq.config").params("rabbit", "ssl_listeners") do
    it { should eq [5671] }
  end
end
