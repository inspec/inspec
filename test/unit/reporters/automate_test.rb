require "helper"
require "inspec/reporters"

describe Inspec::Reporters::Automate do
  let(:options) do
    {
      "url" => "https://my-automate-server.mycompany.com/data-collector/v0/",
      "token" => "kwe09wef9uqwqmpoqwdqd=",
      "node_uuid" => "22ad2f99-f84f-5456-95a0-7e91b4b66690",
      "node_name" => "test_node",
      "environment" => "prod",
      "report_uuid" => "22ad2f99-f84f-5456-95a0-7e91b4b12345",
      "job_uuid" => "22ad2f99-f84f-5456-95a0-jobuuid12345",
    }
  end
  let(:report) do
    data = JSON.parse(File.read("test/fixtures/reporters/run_data.json"), symbolize_names: true)
    options[:run_data] = data
    Inspec::Reporters::Automate.new(options)
  end

  describe "#enriched_report" do
    it "returns a enriched report" do
      _(report.enriched_report[:node_uuid]).must_equal "22ad2f99-f84f-5456-95a0-7e91b4b66690"
      _(report.enriched_report[:node_name]).must_equal "test_node"
      _(report.enriched_report[:environment]).must_equal "prod"
      _(report.enriched_report[:report_uuid]).must_equal "22ad2f99-f84f-5456-95a0-7e91b4b12345"
      _(report.enriched_report[:job_uuid]).must_equal "22ad2f99-f84f-5456-95a0-jobuuid12345"
    end
  end

  describe "#send_report" do
    it "returns true for sent report" do
      headers = {
        "Content-Type" => "application/json",
        "x-data-collector-token" => "kwe09wef9uqwqmpoqwdqd=",
        "x-data-collector-auth" => "version=1.0",
      }
      stub = Net::HTTP::Post.new("/data-collector/v0/", headers)
      Net::HTTP::Post.expects(:new).with("/data-collector/v0/", headers).returns(stub)
      Net::HTTP.any_instance.stubs(:request).returns(Net::HTTPSuccess.new(nil, nil, nil))
      _(report.send_report).must_equal true
    end
  end

  describe "#uuid_from_string" do
    it "converts a string to a uuid" do
      end_time = "2018-03-28T14:10:50Z"
      node_uuid = "22ad2f99-f84f-5456-95a0-7e91b4b66690"
      assert = "e8293cb7-f18f-5a59-bf64-5ec9f13517b5"
      _(report.send(:uuid_from_string, end_time + node_uuid)).must_equal assert
    end
  end

  describe "config insecure override" do
    it "updates verify_ssl if insecure is set to false" do
      options["insecure"] = false
      reporter = Inspec::Reporters::Automate.new(options)
      config = reporter.instance_variable_get(:@config)
      _(config["verify_ssl"]).must_equal true
    end

    it "updates verify_ssl if insecure is set to true" do
      options["insecure"] = true
      reporter = Inspec::Reporters::Automate.new(options)
      config = reporter.instance_variable_get(:@config)
      _(config["verify_ssl"]).must_equal false
    end
  end
end
