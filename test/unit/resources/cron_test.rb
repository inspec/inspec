require "helper"
require "inspec/resource"
require "inspec/resources/cron"

describe "Inspec::Resources::Cron" do
  let(:cron) { load_resource("cron") }

  describe "has_entry?" do
    it "verifies given rule exist in the crontab entires." do
      _(cron.has_entry?("0 2 11 9 4 /path/to/script1")).must_equal true
    end

    it "fails if given rule does not exist in the crontab entires." do
      _(cron.has_entry?("* * * * * /path/to/script1")).must_equal false
    end
  end

  describe "table" do
    it "returns all entries in the crontab in strin format." do
      _(cron.table).must_match "0 2 11 9 4"
      _(cron.table).must_be_kind_of String
    end
  end

  describe "it raises errors" do
    it "fails and raises error on unsupported os" do
      resource = MockLoader.new(:windows).load_resource("cron")
      _(resource).must_be :resource_failed?
      _(resource.resource_exception_message)
        .must_equal "Resource `cron` is not supported on platform windows/6.2.9200."
    end

    it "raises error when exit status is not 0" do
      resource = MockLoader.new(:linux).load_resource("cron", { user: "testuser" })
      _(resource.resource_failed?).must_equal true
      _(resource.resource_exception_message).must_include "Error while executing crontab -l -u testuser command:"
    end
  end

  describe "resource_id" do
    it "generates the resource_id for the current resouce if user is not specified" do
      _(cron.resource_id).must_equal "cron current user"
    end

    it "generates the resource_id for the current resouce if user is specified" do
      resource = load_resource("cron", { user: "testuser" })
      _(resource.resource_id).must_equal "cron testuser"
    end
  end
end
