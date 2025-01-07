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
